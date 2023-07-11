/****** Object:  Table [stage].[country_response_ext]    Script Date: 11-07-2023 11:42:51 ******/
CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] WITH (FORMAT_TYPE = DELIMITEDTEXT, FORMAT_OPTIONS (FIELD_TERMINATOR = N',', FIRST_ROW = 2, USE_TYPE_DEFAULT = False))
GO

CREATE EXTERNAL DATA SOURCE [raw_syn01datalakestorage_dfs_core_windows_net] WITH (LOCATION = N'abfss://raw@syn02datalakestorage.dfs.core.windows.net')
GO

CREATE EXTERNAL TABLE [stage].[country_response_ext]
(
	[Country] [nvarchar](4000),
	[Response_measure] [nvarchar](4000),
	[change] [bigint],
	[date_start] [date],
	[date_end] [nvarchar](4000)
)
WITH (DATA_SOURCE = [raw_syn01datalakestorage_dfs_core_windows_net],LOCATION = N'raw/country_response.csv',FILE_FORMAT = [SynapseDelimitedTextFormat])
GO


CREATE EXTERNAL TABLE [stage].[hospital_admission_ext]
(
	[country] [nvarchar](4000),
	[indicator] [nvarchar](4000),
	[date] [date],
	[year_week] [nvarchar](4000),
	[value] [bigint],
	[source] [nvarchar](4000),
	[url] [nvarchar](4000)
)
WITH (DATA_SOURCE = [raw_syn01datalakestorage_dfs_core_windows_net],LOCATION = N'raw/hospital_admissions.csv',FILE_FORMAT = [SynapseDelimitedTextFormat])
GO





