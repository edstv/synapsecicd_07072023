IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stage')
exec ('CREATE SCHEMA [STAGE]')
