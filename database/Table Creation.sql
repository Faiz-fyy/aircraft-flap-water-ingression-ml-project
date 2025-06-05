CREATE TABLE parts (
	SN_ID VARCHAR(10) PRIMARY KEY,
    SN VARCHAR(10), 
    PN VARCHAR(10), 
    Position VARCHAR(10)
    );

CREATE TABLE parameters (
	Parameters_ID VARCHAR(10) PRIMARY KEY, 
    mAm DOUBLE, 
    SFD DOUBLE,
    D4 bool,
    D7 bool
    );

CREATE TABLE relative_date (
	Date_ID VARCHAR(15) PRIMARY KEY,
	Relative_Day INT, 
    Relative_Week INT, 
    Relative_Month INT,
    Relative_Quarter INT,
	Rain_Season VARCHAR(15)
    );

CREATE TABLE inspections (
	Inspection_ID VARCHAR(10) PRIMARY KEY, 
	Date_ID VARCHAR(15),
    SN_ID VARCHAR(10),
    Parameters_ID VARCHAR(10),
    Water bool,
    Disbond bool,
	FOREIGN KEY (Date_ID) REFERENCES relative_date(Date_ID),
    FOREIGN KEY (SN_ID) REFERENCES Parts(SN_ID),
    FOREIGN KEY (Parameters_ID) REFERENCES Parameters(Parameters_ID)
    );

-- Store Exposure in parameters table
ALTER TABLE parameters ADD Exposure DOUBLE GENERATED ALWAYS AS (mAm/POWER(SFD, 2)) STORED;

-- Indexes for performance optimization
CREATE INDEX idx_relative_day ON relative_date(Relative_Day);
CREATE INDEX idx_water ON inspections(Water);
CREATE INDEX idx_pn ON parts(PN);
