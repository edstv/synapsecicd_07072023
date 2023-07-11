IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stage')
     CREATE SCHEMA [stage]
