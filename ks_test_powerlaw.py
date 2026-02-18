#!/usr/bin/env python3
"""
Kolmogorov-Smirnov test for power-law distribution of template frequencies.
Tests whether the count distribution in combined_templates.csv follows a power law.
"""

import csv
import numpy as np
from scipy import stats
from pathlib import Path


def fit_powerlaw_mle(counts, x_min=None):
    """
    Fit discrete power law P(x) ~ x^(-alpha) for x >= x_min.
    MLE: alpha = 1 + n / sum(ln(x_i / x_min))
    """
    counts = np.array(counts, dtype=float)
    if x_min is None:
        x_min = np.min(counts)
    x_filtered = counts[counts >= x_min]
    n = len(x_filtered)
    if n < 2:
        return None, None
    log_ratio = np.log(x_filtered / x_min)
    alpha = 1 + n / np.sum(log_ratio)
    return alpha, x_min


def powerlaw_cdf(x, alpha, x_min):
    """CDF of continuous power law: P(X <= x) = 1 - (x/x_min)^(-alpha+1) for x >= x_min."""
    x = np.asarray(x)
    result = np.zeros_like(x, dtype=float)
    mask = x >= x_min
    result[mask] = 1 - (x_min / x[mask]) ** (alpha - 1)
    return result


def main():
    base_dir = Path(__file__).parent
    input_path = base_dir / "combined_templates.csv"

    counts = []
    with open(input_path, encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for row in reader:
            try:
                counts.append(int(row["count"]))
            except (ValueError, KeyError):
                continue

    counts = np.array(counts)
    n = len(counts)
    print(f"Loaded {n} template counts")
    print(f"Count range: {counts.min()} to {counts.max()}")
    print(f"Mean: {counts.mean():.2f}, Median: {np.median(counts):.1f}")

    # Fit power law with x_min = 1 (include all data)
    alpha, x_min = fit_powerlaw_mle(counts, x_min=1)
    print(f"\nPower law fit (x_min=1): alpha = {alpha:.4f}")

    # KS test: compare empirical CDF to fitted power law
    # Use continuous approximation for discrete data
    sorted_counts = np.sort(counts)
    n_obs = len(sorted_counts)
    ecdf = np.arange(1, n_obs + 1) / n_obs

    # Theoretical CDF at observed points
    tcdf = powerlaw_cdf(sorted_counts, alpha, x_min)

    # KS statistic: max|F_emp - F_theo|
    d_vals = np.abs(ecdf - tcdf)
    ks_stat = np.max(d_vals)
    ks_idx = np.argmax(d_vals)
    print(f"\nKS statistic D = {ks_stat:.6f}")
    print(f"  (at count = {sorted_counts[ks_idx]})")

    # P-value via parametric bootstrap (Clauset et al. 2009)
    # Generate synthetic data from fitted power law, refit, compute KS each time
    n_sims = 1000
    np.random.seed(42)
    ks_synthetic = []

    # Generate from power law: P(X>=x) = (x/x_min)^(-alpha+1)
    # Inverse transform: x = x_min * u^(-1/(alpha-1)), u ~ Uniform(0,1)
    for _ in range(n_sims):
        u = np.random.uniform(0, 1, n_obs)
        # Avoid u=0
        u = np.clip(u, 1e-10, 1)
        synthetic = np.ceil(x_min * (u ** (-1 / (alpha - 1)))).astype(int)
        synthetic = np.maximum(synthetic, 1)
        alpha_s, _ = fit_powerlaw_mle(synthetic, x_min=1)
        if alpha_s is not None and alpha_s > 1:
            ecdf_s = np.arange(1, n_obs + 1) / n_obs
            tcdf_s = powerlaw_cdf(np.sort(synthetic), alpha_s, 1)
            ks_synthetic.append(np.max(np.abs(ecdf_s - tcdf_s)))

    ks_synthetic = np.array(ks_synthetic)
    p_value = np.mean(ks_synthetic >= ks_stat)
    print(f"\nParametric bootstrap p-value (n={n_sims}): {p_value:.4f}")

    # Also report scipy's asymptotic p-value (less reliable for fitted params)
    # kstest with custom cdf
    def powerlaw_cdf_func(x):
        return powerlaw_cdf(x, alpha, x_min)

    ks_result = stats.kstest(counts, powerlaw_cdf_func, alternative="two-sided")
    print(f"\nScipy kstest (asymptotic): D = {ks_result.statistic:.6f}, p = {ks_result.pvalue:.6f}")

    # Interpretation
    print("\n" + "=" * 60)
    alpha_0 = 0.05
    if p_value > alpha_0:
        print(f"Result: FAIL TO REJECT null (p={p_value:.4f} > {alpha_0})")
        print("The template frequency distribution is consistent with a power law.")
    else:
        print(f"Result: REJECT null (p={p_value:.4f} <= {alpha_0})")
        print("The template frequency distribution does NOT follow a power law.")

    # Optional: test with x_min > 1 (exclude single-occurrence templates)
    counts_gt1 = counts[counts > 1]
    if len(counts_gt1) >= 50:
        print("\n" + "-" * 60)
        print("Sensitivity: Testing tail only (x_min=2, exclude count=1):")
        alpha2, _ = fit_powerlaw_mle(counts_gt1, x_min=2)
        sorted2 = np.sort(counts_gt1)
        ecdf2 = np.arange(1, len(sorted2) + 1) / len(sorted2)
        tcdf2 = powerlaw_cdf(sorted2, alpha2, 2)
        ks2 = np.max(np.abs(ecdf2 - tcdf2))
        print(f"  alpha = {alpha2:.4f}, KS D = {ks2:.6f}")
        # Quick bootstrap
        ks2_syn = []
        for _ in range(500):
            u = np.random.uniform(0.001, 1, len(counts_gt1))
            syn = np.ceil(2 * (u ** (-1 / (alpha2 - 1)))).astype(int)
            syn = np.maximum(syn, 2)
            a_s, _ = fit_powerlaw_mle(syn, x_min=2)
            if a_s and a_s > 1:
                ecdf_s = np.arange(1, len(syn) + 1) / len(syn)
                tcdf_s = powerlaw_cdf(np.sort(syn), a_s, 2)
                ks2_syn.append(np.max(np.abs(ecdf_s - tcdf_s)))
        p2 = np.mean(np.array(ks2_syn) >= ks2) if ks2_syn else 0
        print(f"  Bootstrap p-value: {p2:.4f}")


if __name__ == "__main__":
    main()
