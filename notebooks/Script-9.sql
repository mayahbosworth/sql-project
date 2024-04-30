
SELECT CONSTRAINT_NAME, TABLE_NAME 
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
WHERE TABLE_SCHEMA = 'mayah_bosworth_sql_project' AND TABLE_NAME = 'quotes';

SELECT COUNT(*)
FROM information_schema.table_constraints
WHERE table_schema = 'mayah_bosworth_sql_project'
AND table_name = 'quotes'
AND constraint_name = 'fk_quotes_symbol' -- Replace with the actual constraint name
AND constraint_type = 'FOREIGN KEY';



-- Drop foreign key constraints in the correct order

-- Alter the `quotes` table:
ALTER TABLE quotes DROP FOREIGN KEY fk_quotes_symbol;

-- Alter the `basic_financials` table:
ALTER TABLE basic_financials DROP FOREIGN KEY fk_basic_financials_symbol;

-- Alter the `earnings_estimate` table:
ALTER TABLE earnings_estimate DROP FOREIGN KEY fk_earnings_estimate_symbol;

-- Alter the `eps_revisions` table:
ALTER TABLE eps_revisions DROP FOREIGN KEY fk_eps_revisions_symbol;

-- Alter the `eps_trend` table:
ALTER TABLE eps_trend DROP FOREIGN KEY fk_eps_trend_symbol;

-- Alter the `financials_reported` table:
ALTER TABLE financials_reported DROP FOREIGN KEY fk_financials_reported_symbol;

-- Alter the `growth_estimate` table:
ALTER TABLE growth_estimate DROP FOREIGN KEY fk_growth_estimate_symbol;

-- Alter the `insider_transactions` table:
ALTER TABLE insider_transactions DROP FOREIGN KEY fk_insider_transactions_symbol;

-- Alter the `trading_volume` table:
ALTER TABLE trading_volume DROP FOREIGN KEY fk_trading_volume_symbol;

-- Alter the `usa_spending` table:
ALTER TABLE usa_spending DROP FOREIGN KEY fk_usa_spending_symbol;

-- Modify columns and add primary keys

-- Alter the `symbols` table:
ALTER TABLE symbols MODIFY symbol VARCHAR(10) NOT NULL;
ALTER TABLE symbols DROP PRIMARY KEY;
ALTER TABLE symbols ADD PRIMARY KEY (symbol);

-- Alter the `quotes` table:
ALTER TABLE quotes DROP PRIMARY KEY;
ALTER TABLE quotes MODIFY symbol VARCHAR(10) NOT NULL;
ALTER TABLE quotes ADD PRIMARY KEY (symbol);
ALTER TABLE quotes ADD CONSTRAINT fk_quotes_symbol FOREIGN KEY (symbol) REFERENCES symbols(symbol);

-- Alter the `basic_financials` table:
ALTER TABLE basic_financials DROP PRIMARY KEY;
ALTER TABLE basic_financials MODIFY symbol VARCHAR(10) NOT NULL;
ALTER TABLE basic_financials ADD PRIMARY KEY (symbol);
ALTER TABLE basic_financials ADD CONSTRAINT fk_basic_financials_symbol FOREIGN KEY (symbol) REFERENCES symbols(symbol);

-- Alter the `earnings_estimate` table:
ALTER TABLE earnings_estimate ADD COLUMN id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

-- Add foreign key constraint for earnings_estimate table
ALTER TABLE earnings_estimate ADD CONSTRAINT fk_earnings_estimate_symbol FOREIGN KEY (symbol) REFERENCES symbols(symbol);

-- Repeat the above pattern for other tables

-- Alter the `eps_revisions` table:
ALTER TABLE eps_revisions ADD COLUMN id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

-- Add foreign key constraint for eps_revisions table
ALTER TABLE eps_revisions ADD CONSTRAINT fk_eps_revisions_symbol FOREIGN KEY (symbol) REFERENCES symbols(symbol);

-- Repeat the above pattern for other tables

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

-- Alter the `financials_reported` table:
ALTER TABLE financials_reported ADD CONSTRAINT fk_financials_reported_symbol FOREIGN KEY (symbol) REFERENCES symbols(symbol);

-- Alter the `usa_spending` table:
ALTER TABLE usa_spending ADD COLUMN id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

-- Add foreign key constraint for usa_spending table
ALTER TABLE usa_spending ADD CONSTRAINT fk_usa_spending_symbol FOREIGN KEY (symbol) REFERENCES symbols(symbol);




-- Step 2: Ensure that the 'symbol' column in each table contains only values that exist in the 'Symbols' table
-- You might have to do some data cleaning to ensure that every 'symbol' in your tables exists in the 'Symbols' table.
-- If there are symbols that don't exist, you'll need to insert them into the 'Symbols' table before creating foreign keys.
-- You can find missing symbols with a query like:
-- SELECT DISTINCT symbol FROM insider_transactions 
-- WHERE symbol NOT IN (SELECT symbol FROM Symbols);

-- Add missing symbols to the Symbols table here

-- Step 3: After establishing foreign key relationships, check for redundancy and remove any unnecessary columns.
-- This would typically involve ensuring that no non-key attributes are dependent on other non-key attributes.

-- NOTE: Ensure that each table's 'symbol' column is of the same data type and character length as the 'Symbols' table's 'symbol' column.


