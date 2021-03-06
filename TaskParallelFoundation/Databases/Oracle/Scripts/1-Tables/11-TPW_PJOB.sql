-- CREATE TABLE
CREATE TABLE XYZ.TPW_PJOB
(
	PJOB_ID				NUMBER(10)							NOT NULL,
	STATE_ID			NUMBER(5)							NOT NULL,
	TASK_ID_RECORD		NUMBER(5)		DEFAULT 0			NOT NULL,
	SCHEDULED_TIME		DATE			DEFAULT SYSDATE		NOT NULL,
	EXPIRY_TIME			DATE			DEFAULT (SYSDATE+7)	NOT NULL,
	START_TIME			TIMESTAMP(3),
	END_TIME			TIMESTAMP(3),
	USER_APP			VARCHAR2(128),
	USER_NAME			VARCHAR2(64),
	DESCRIPTION_		VARCHAR2(256),

	CONSTRAINT PK_TPW_PJOB PRIMARY KEY (PJOB_ID),
	CONSTRAINT FK_TPW_PJOB_STATE_ID FOREIGN KEY (STATE_ID) REFERENCES XYZ.TPW_WF_STATE (STATE_ID),
	CONSTRAINT CK_TPW_PJOB_TASK_ID_RECORD CHECK (TASK_ID_RECORD >= 0)
)
STORAGE (INITIAL 64K NEXT 64K BUFFER_POOL KEEP);

CREATE INDEX XYZ.IX_TPW_PJOB ON XYZ.TPW_PJOB (STATE_ID, SCHEDULED_TIME, PJOB_ID);

----------------------------------------------------------------------------------------------------
--
--	Copyright 2012 Abel Cheng
--	This source code is subject to terms and conditions of the Apache License, Version 2.0.
--	See http://www.apache.org/licenses/LICENSE-2.0.
--	All other rights reserved.
--	You must not remove this notice, or any other, from this software.
--
--	Original Author:	Abel Cheng <abelcys@gmail.com>
--	Created Date:		2012-03-23
--	Primary Host:		http://dbParallel.codeplex.com
--	Change Log:
--	Author				Date			Comment
--
--
--
--
--	(Keep clean code rather than complicated code plus long comments.)
--
----------------------------------------------------------------------------------------------------
