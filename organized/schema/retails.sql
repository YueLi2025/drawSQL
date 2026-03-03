CREATE TABLE customer (
  c_custkey INTEGER,
  c_mktsegment TEXT,
  c_nationkey INTEGER,
  c_name TEXT,
  c_address TEXT,
  c_phone TEXT,
  c_acctbal REAL,
  c_comment TEXT,
  PRIMARY KEY (c_custkey),
  FOREIGN KEY (c_nationkey) REFERENCES nation(n_nationkey)
);

CREATE TABLE lineitem (
  l_shipdate TEXT,
  l_orderkey INTEGER,
  l_discount REAL,
  l_extendedprice REAL,
  l_suppkey INTEGER,
  l_quantity INTEGER,
  l_returnflag TEXT,
  l_partkey INTEGER,
  l_linestatus TEXT,
  l_tax REAL,
  l_commitdate TEXT,
  l_receiptdate TEXT,
  l_shipmode TEXT,
  l_linenumber INTEGER,
  l_shipinstruct TEXT,
  l_comment TEXT,
  FOREIGN KEY (l_orderkey) REFERENCES orders(o_orderkey),
  FOREIGN KEY (l_suppkey) REFERENCES partsupp(ps_suppkey),
  FOREIGN KEY (l_partkey) REFERENCES partsupp(ps_partkey)
);

CREATE TABLE nation (
  n_nationkey INTEGER,
  n_name TEXT,
  n_regionkey INTEGER,
  n_comment TEXT,
  PRIMARY KEY (n_nationkey),
  FOREIGN KEY (n_regionkey) REFERENCES region(r_regionkey)
);

CREATE TABLE orders (
  o_orderdate TEXT,
  o_orderkey INTEGER,
  o_custkey INTEGER,
  o_orderpriority TEXT,
  o_shippriority INTEGER,
  o_clerk TEXT,
  o_orderstatus TEXT,
  o_totalprice REAL,
  o_comment TEXT,
  PRIMARY KEY (o_orderkey),
  FOREIGN KEY (o_custkey) REFERENCES customer(c_custkey)
);

CREATE TABLE part (
  p_partkey INTEGER,
  p_type TEXT,
  p_size INTEGER,
  p_brand TEXT,
  p_name TEXT,
  p_container TEXT,
  p_mfgr TEXT,
  p_retailprice REAL,
  p_comment TEXT,
  PRIMARY KEY (p_partkey)
);

CREATE TABLE partsupp (
  ps_partkey INTEGER,
  ps_suppkey INTEGER,
  ps_supplycost REAL,
  ps_availqty INTEGER,
  ps_comment TEXT,
  FOREIGN KEY (ps_partkey) REFERENCES part(p_partkey),
  FOREIGN KEY (ps_suppkey) REFERENCES supplier(s_suppkey)
);

CREATE TABLE region (
  r_regionkey INTEGER,
  r_name TEXT,
  r_comment TEXT,
  PRIMARY KEY (r_regionkey)
);

CREATE TABLE supplier (
  s_suppkey INTEGER,
  s_nationkey INTEGER,
  s_comment TEXT,
  s_name TEXT,
  s_address TEXT,
  s_phone TEXT,
  s_acctbal REAL,
  PRIMARY KEY (s_suppkey),
  FOREIGN KEY (s_nationkey) REFERENCES nation(n_nationkey)
);
