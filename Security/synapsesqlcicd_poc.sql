IF NOT EXISTS (
		SELECT *
		FROM sys.external_file_formats
		WHERE name = 'SynapseParquetFormat'
		)
	CREATE EXTERNAL FILE FORMAT [SynapseParquetFormat]
		WITH (FORMAT_TYPE = PARQUET)
GO

IF NOT EXISTS (
		SELECT *
		FROM sys.external_data_sources
		WHERE name = 'rawpq_syn02datalakestorage_dfs_core_windows_net'
		)
	CREATE EXTERNAL DATA SOURCE [rawpq_syn02datalakestorage_dfs_core_windows_net]
		WITH (LOCATION = 'abfss://rawpq@syn02datalakestorage.dfs.core.windows.net')
GO

IF NOT EXISTS (
		SELECT *
		FROM sys.schemas
		WHERE name = 'raw'
		)
	EXEC ('CREATE SCHEMA [raw]')

IF NOT EXISTS (
		SELECT *
		FROM sys.external_tables
		WHERE name = 'incoterms'
		)
	CREATE EXTERNAL TABLE [raw].[incoterms] (
		[CompanyId] INT
		,[IncotermId] NVARCHAR(4000)
		,[IncotermDescription] NVARCHAR(4000)
		,[RawInsertedTimestamp] NVARCHAR(4000)
		,[IsTableSource] NVARCHAR(4000)
		)
		WITH (
				LOCATION = 'aa/bb/A4LERF_Incoterms.parquet'
				,DATA_SOURCE = [rawpq_syn02datalakestorage_dfs_core_windows_net]
				,FILE_FORMAT = [SynapseParquetFormat]
				)
GO

/*IF NOT EXISTS (
		SELECT *
		FROM sys.VIEWS
		WHERE name = 'vw_incoterms'
		)
	CREATE VIEW [raw].[vw_incoterms]
	AS
	SELECT [CompanyId]
		,[IncotermId]
		,getdate() AS datenow
		,'abc' AS test_string
	FROM OPENROWSET(BULK 'https://syn02datalakestorage.dfs.core.windows.net/rawpq/aa/bb/A4LERF_Incoterms.parquet', FORMAT = 'PARQUET') AS result

	SELECT *
	FROM sys.VIEWS*/
