﻿CREATE TABLE TPW_PUMP_SERVER
(
	SERVER_NAME			NVARCHAR(32) 						NOT NULL,
	SERVICE_BEAT		DATETIME		DEFAULT GETDATE()	NOT NULL,
	IS_PRIMARY			BIT				DEFAULT 0			NOT NULL,
	SERVICE_ACCOUNT		NVARCHAR(32),
	CONSTRAINT PK_TPW_PUMP_SERVER PRIMARY KEY (SERVER_NAME)
);