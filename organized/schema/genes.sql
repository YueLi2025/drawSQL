CREATE TABLE Classification (
  GeneID TEXT,
  Localization TEXT,
  PRIMARY KEY (GeneID)
);

CREATE TABLE Genes (
  GeneID TEXT,
  Essential TEXT,
  Class TEXT,
  Complex TEXT,
  Phenotype TEXT,
  Motif TEXT,
  Chromosome INTEGER,
  Function TEXT,
  Localization TEXT,
  FOREIGN KEY (GeneID) REFERENCES Classification(GeneID)
);

CREATE TABLE Interactions (
  GeneID1 TEXT,
  GeneID2 TEXT,
  Type TEXT,
  Expression_Corr REAL,
  FOREIGN KEY (GeneID1) REFERENCES Classification(GeneID),
  FOREIGN KEY (GeneID2) REFERENCES Classification(GeneID)
);
