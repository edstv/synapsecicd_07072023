CREATE EXTERNAL TABLE [stage].[country_response_ext] (
    [Country] NVARCHAR (4000) NULL,
    [Response_measure] NVARCHAR (4000) NULL,
    [change] BIGINT NULL,
    [date_start] DATE NULL,
    [date_end] NVARCHAR (4000) NULL
)
    WITH (
    DATA_SOURCE = [raw_syn01datalakestorage_dfs_core_windows_net],
    LOCATION = N'raw/country_response.csv',
    FILE_FORMAT = [SynapseDelimitedTextFormat]
    );

