﻿CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat]
    WITH (
    FORMAT_TYPE = DELIMITEDTEXT,
    FORMAT_OPTIONS (FIELD_TERMINATOR = N',')
    );

