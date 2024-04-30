


-- Create symbols table
CREATE TABLE symbols;

-- Create basic_financials table
CREATE TABLE basic_financials;

-- Create financials_reported table
CREATE TABLE financials_reported;

-- Create quotes table
CREATE TABLE quotes;

-- Create usa_spending table
CREATE TABLE usa_spending;

-- Create company_news table
CREATE TABLE company_news;

-- Alter the `symbols` table:
ALTER TABLE symbols MODIFY symbol VARCHAR(10) NOT NULL;
ALTER TABLE symbols ADD PRIMARY KEY (symbol);

-- Alter the `quotes` table:
ALTER TABLE quotes MODIFY symbol VARCHAR(10) NOT NULL;
ALTER TABLE quotes ADD PRIMARY KEY (symbol);
ALTER TABLE quotes ADD CONSTRAINT fk_quotes_symbol FOREIGN KEY (symbol) REFERENCES symbols(symbol);

-- Alter the `basic_financials` table:
ALTER TABLE basic_financials MODIFY symbol VARCHAR(10) NOT NULL;
ALTER TABLE basic_financials ADD PRIMARY KEY (symbol);
ALTER TABLE basic_financials ADD CONSTRAINT fk_basic_financials_symbol FOREIGN KEY (symbol) REFERENCES symbols(symbol);

-- Alter the `financials_reported` table:
ALTER TABLE financials_reported ADD COLUMN id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

-- Add foreign key constraint for financials_reported table
ALTER TABLE financials_reported ADD CONSTRAINT fk_financials_reported_symbol FOREIGN KEY (symbol) REFERENCES symbols(symbol);


-- Alter the `usa_spending` table:
ALTER TABLE company_news ADD COLUMN id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

-- Add foreign key constraint for usa_spending table
ALTER TABLE company_news ADD CONSTRAINT fk_company_news_symbol FOREIGN KEY (symbol) REFERENCES symbols(symbol);

ALTER TABLE basic_financials
ADD COLUMN ebitdaCagr5Y DOUBLE NULL,
ADD COLUMN revenueGrowthTTMYoy DOUBLE NULL,
ADD COLUMN currentRatioAnnual DOUBLE NULL,
ADD COLUMN epsAnnual DOUBLE NULL;




