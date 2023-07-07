CREATE EXTERNAL TABLE [stage].[hospital_admission_ext] (
    [country] NVARCHAR (4000) NULL,
    [indicator] NVARCHAR (4000) NULL,
    [date] DATE NULL,
    [year_week] NVARCHAR (4000) NULL,
    [value] BIGINT NULL,
    [source] NVARCHAR (4000) NULL,
    [url] NVARCHAR (4000) NULL
)
    WITH (
    DATA_SOURCE = [raw_syn01datalakestorage_dfs_core_windows_net],
    LOCATION = N'raw/hospital_admissions.csv',
    FILE_FORMAT = [SynapseDelimitedTextFormat]
    );

