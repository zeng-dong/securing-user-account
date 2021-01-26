USE Globomantics
GO

CREATE TABLE [dbo].[UserToken](
	[UserId] [bigint] NOT NULL,
	[LoginProvider] [NVARCHAR](450) NOT NULL,
	[Name] [NVARCHAR](450) NOT NULL,
	[Value] [NVARCHAR](MAX) NULL,
 CONSTRAINT [PK_UserToken] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE dbo.[UserToken]  WITH CHECK ADD  CONSTRAINT [FK_UserToken_User_UserId] FOREIGN KEY([UserId])
REFERENCES dbo.[GlobomanticsUser] ([UserId])
ON DELETE CASCADE
GO

ALTER TABLE dbo.[UserToken] CHECK CONSTRAINT [FK_UserToken_User_UserId]
GO

ALTER TABLE dbo.GlobomanticsUser
ADD [AccessFailedCount] [SMALLINT] NOT NULL DEFAULT 0,
	[LockoutEnd] [DATETIMEOFFSET](7) NULL,
	[TwoFactorEnabled] [BIT] NOT NULL DEFAULT 0;