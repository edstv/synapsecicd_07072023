IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'raw')
exec ('CREATE SCHEMA [raw]')
