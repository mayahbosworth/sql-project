
-- Create trading_volume table
CREATE TABLE trading_volume;

-- Create growth_estimate table
CREATE TABLE growth_estimate;

-- Create insider_transactions table
CREATE TABLE insider_transactions;

-- Create earnings_estimate table
CREATE TABLE earnings_estimate;

-- Create eps_revisions table
CREATE TABLE eps_revisions;

-- Create eps_trend table
CREATE TABLE eps_trend;


-- Alter the `earnings_estimate` table:
ALTER TABLE earnings_estimate ADD COLUMN id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

-- Add foreign key constraint for earnings_estimate table
ALTER TABLE earnings_estimate ADD CONSTRAINT fk_earnings_estimate_symbol FOREIGN KEY (symbol) REFERENCES symbols(symbol);

-- Alter the `eps_revisions` table:
ALTER TABLE eps_revisions ADD COLUMN id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

-- Add foreign key constraint for eps_revisions table
ALTER TABLE eps_revisions ADD CONSTRAINT fk_eps_revisions_symbol FOREIGN KEY (symbol) REFERENCES symbols(symbol);

-- Alter the `eps_trend` table:
ALTER TABLE eps_trend ADD COLUMN id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

-- Add foreign key constraint for eps_trend table
ALTER TABLE eps_trend ADD CONSTRAINT fk_eps_trend_symbol FOREIGN KEY (symbol) REFERENCES symbols(symbol);

-- Alter the `trading_volume` table:
ALTER TABLE trading_volume ADD COLUMN id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

-- Add foreign key constraint for earnings_estimate table
ALTER TABLE trading_volume ADD CONSTRAINT fk_trading_volume_symbol FOREIGN KEY (symbol) REFERENCES symbols(symbol);

-- Alter the `insider_transactions` table:
ALTER TABLE insider_transactions ADD COLUMN id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

-- Add foreign key constraint for earnings_estimate table
ALTER TABLE insider_transactions ADD CONSTRAINT fk_insider_transactions_symbol FOREIGN KEY (symbol) REFERENCES symbols(symbol);

-- Alter the `insider_transactions` table:
ALTER TABLE growth_estimate ADD COLUMN id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

-- Add foreign key constraint for earnings_estimate table
ALTER TABLE growth_estimate ADD CONSTRAINT fk_growth_estimate_symbol FOREIGN KEY (symbol) REFERENCES symbols(symbol);