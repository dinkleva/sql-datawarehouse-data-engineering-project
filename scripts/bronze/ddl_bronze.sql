
/*
	==================================================
	Inserting raw data to bronze layer 
	==================================================
	This data has 40 columns and some columns may contain "Fort Worth, TX" kind of values. FIELDTERMINATOR may think ',' comma
	inside '"' quotes as two different columns so to handle this FIELDQUOTE is used...
	======================================================
	After loading the data whole thing is c
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	BEGIN TRY
		PRINT '========================================';
		PRINT 'Loading bronze layer';
		PRINT '========================================';

		PRINT '----------------------------------------';
		PRINT ' >> TRUNCATING TABLE: bronze.bank_transactions << ';

		TRUNCATE TABLE bronze.bank_transactions;

		PRINT '========================================';
		PRINT ' >> Inserting Data into : bronze.bank_payments << '; 
		BULK INSERT bronze.bank_transactions
		FROM 'C:\Users\dinkl\OneDrive\Desktop\bank.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a', ----------- handles UNIX new line '\n' ------------------
			FIELDQUOTE = '"', --- handles ',' inside quotes(") --------
			CODEPAGE = '65001',
			TABLOCK
		);
	END TRY
	BEGIN CATCH
	PRINT '===============================================';
	PRINT 'SOMETHING ERROR OCCURED WHILE LOADING THE RAW DATA ';
	PRINT '===============================================';
	END CATCH
END
