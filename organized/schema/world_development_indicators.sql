CREATE TABLE Country (
  CountryCode TEXT,
  ShortName TEXT,
  TableName TEXT,
  LongName TEXT,
  Alpha2Code TEXT,
  CurrencyUnit TEXT,
  SpecialNotes TEXT,
  Region TEXT,
  IncomeGroup TEXT,
  Wb2Code TEXT,
  NationalAccountsBaseYear TEXT,
  NationalAccountsReferenceYear TEXT,
  SnaPriceValuation TEXT,
  LendingCategory TEXT,
  OtherGroups TEXT,
  SystemOfNationalAccounts TEXT,
  AlternativeConversionFactor TEXT,
  PppSurveyYear TEXT,
  BalanceOfPaymentsManualInUse TEXT,
  ExternalDebtReportingStatus TEXT,
  SystemOfTrade TEXT,
  GovernmentAccountingConcept TEXT,
  ImfDataDisseminationStandard TEXT,
  LatestPopulationCensus TEXT,
  LatestHouseholdSurvey TEXT,
  SourceOfMostRecentIncomeAndExpenditureData TEXT,
  VitalRegistrationComplete TEXT,
  LatestAgriculturalCensus TEXT,
  LatestIndustrialData INTEGER,
  LatestTradeData INTEGER,
  LatestWaterWithdrawalData INTEGER,
  PRIMARY KEY (CountryCode)
);

CREATE TABLE Series (
  SeriesCode TEXT,
  Topic TEXT,
  IndicatorName TEXT,
  ShortDefinition TEXT,
  LongDefinition TEXT,
  UnitOfMeasure TEXT,
  Periodicity TEXT,
  BasePeriod TEXT,
  OtherNotes INTEGER,
  AggregationMethod TEXT,
  LimitationsAndExceptions TEXT,
  NotesFromOriginalSource TEXT,
  GeneralComments TEXT,
  Source TEXT,
  StatisticalConceptAndMethodology TEXT,
  DevelopmentRelevance TEXT,
  RelatedSourceLinks TEXT,
  OtherWebLinks INTEGER,
  RelatedIndicators INTEGER,
  LicenseType TEXT,
  PRIMARY KEY (SeriesCode)
);

CREATE TABLE CountryNotes (
  Countrycode TEXT,
  Seriescode TEXT,
  Description TEXT,
  FOREIGN KEY (Countrycode) REFERENCES Country(CountryCode),
  FOREIGN KEY (Seriescode) REFERENCES Series(SeriesCode)
);

CREATE TABLE Footnotes (
  Countrycode TEXT,
  Seriescode TEXT,
  Year TEXT,
  Description TEXT,
  FOREIGN KEY (Countrycode) REFERENCES Country(CountryCode),
  FOREIGN KEY (Seriescode) REFERENCES Series(SeriesCode)
);

CREATE TABLE Indicators (
  CountryName TEXT,
  CountryCode TEXT,
  IndicatorName TEXT,
  IndicatorCode TEXT,
  Year INTEGER,
  Value INTEGER,
  FOREIGN KEY (CountryCode) REFERENCES Country(CountryCode)
);

CREATE TABLE SeriesNotes (
  Seriescode TEXT,
  Year TEXT,
  Description TEXT,
  FOREIGN KEY (Seriescode) REFERENCES Series(SeriesCode)
);
