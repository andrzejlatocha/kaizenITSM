CREATE TABLE [itsm].[TypeOfObjects](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [varchar](150) NULL,
	[Icon] [varchar](50) NULL,
	[IsHardware] [bit] NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Status] [char](1) NULL,
	[Deleted] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_TypeOfObjects] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [itsm].[TypeOfObjects] ADD  CONSTRAINT [DF_TypeOfObjects_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO

ALTER TABLE [itsm].[TypeOfObjects] ADD  CONSTRAINT [DF_TypeOfObjects_CreationUserID]  DEFAULT ((0)) FOR [CreationUserID]
GO

ALTER TABLE [itsm].[TypeOfObjects] ADD  CONSTRAINT [DF_TypeOfObjects_ModifyingDate]  DEFAULT (getdate()) FOR [ModifyingDate]
GO

ALTER TABLE [itsm].[TypeOfObjects] ADD  CONSTRAINT [DF_TypeOfObjects_ModifyingUserID]  DEFAULT ((0)) FOR [ModifyingUserID]
GO

ALTER TABLE [itsm].[TypeOfObjects] ADD  CONSTRAINT [DF_TypeOfObjects_Status]  DEFAULT ('A') FOR [Status]
GO

ALTER TABLE [itsm].[TypeOfObjects] ADD  CONSTRAINT [DF_TypeOfObjects_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [itsm].[TypeOfObjects] ADD  CONSTRAINT [DF_TypeOfObjects_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

CREATE TABLE [itsm].[ParametersType](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TypeOfObjectID] [int] NULL,
	[ObjectGroupID] [int] NULL,
	[Label] [varchar](150) NULL,
	[ValueType] [varchar](50) NULL,
	[Control] [varchar](50) NULL,
	[Inherit] [bit] NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Status] [char](1) NULL,
	[Deleted] [nchar](10) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_ParametersType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [itsm].[ParametersType] ADD  CONSTRAINT [DF_ParametersForObjectType_Inherit]  DEFAULT ((0)) FOR [Inherit]
GO

ALTER TABLE [itsm].[ParametersType] ADD  CONSTRAINT [DF_ParametersForObjectType_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO

ALTER TABLE [itsm].[ParametersType] ADD  CONSTRAINT [DF_ParametersForObjectType_CreationUserID]  DEFAULT ((0)) FOR [CreationUserID]
GO

ALTER TABLE [itsm].[ParametersType] ADD  CONSTRAINT [DF_ParametersForObjectType_ModifyingDate]  DEFAULT (getdate()) FOR [ModifyingDate]
GO

ALTER TABLE [itsm].[ParametersType] ADD  CONSTRAINT [DF_ParametersForObjectType_ModifyingUserID]  DEFAULT ((0)) FOR [ModifyingUserID]
GO

ALTER TABLE [itsm].[ParametersType] ADD  CONSTRAINT [DF_ParametersType_Status]  DEFAULT ('A') FOR [Status]
GO

ALTER TABLE [itsm].[ParametersType] ADD  CONSTRAINT [DF_ParametersForObjectType_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [itsm].[ParametersType] ADD  CONSTRAINT [DF_ParametersForObjectType_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [itsm].[ParametersType]  WITH CHECK ADD  CONSTRAINT [FK_ParametersType_ParametersType] FOREIGN KEY([ID])
REFERENCES [itsm].[ParametersType] ([ID])
GO

ALTER TABLE [itsm].[ParametersType] CHECK CONSTRAINT [FK_ParametersType_ParametersType]
GO

ALTER TABLE [itsm].[ParametersType]  WITH CHECK ADD  CONSTRAINT [FK_ParametersType_TypeOfObjects] FOREIGN KEY([TypeOfObjectID])
REFERENCES [itsm].[TypeOfObjects] ([ID])
GO

ALTER TABLE [itsm].[ParametersType] CHECK CONSTRAINT [FK_ParametersType_TypeOfObjects]
GO

CREATE TABLE [itsm].[ObjectProperties](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ObjectID] [int] NULL,
	[ParameterTypeID] [int] NULL,
	[Value] [nvarchar](max) NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Status] [char](1) NULL,
	[Deleted] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_ObjectProperties] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [itsm].[ObjectProperties] ADD  CONSTRAINT [DF_ObjectParameters_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO

ALTER TABLE [itsm].[ObjectProperties] ADD  CONSTRAINT [DF_ObjectParameters_CreationUserID]  DEFAULT ((0)) FOR [CreationUserID]
GO

ALTER TABLE [itsm].[ObjectProperties] ADD  CONSTRAINT [DF_ObjectParameters_ModifyingDate]  DEFAULT (getdate()) FOR [ModifyingDate]
GO

ALTER TABLE [itsm].[ObjectProperties] ADD  CONSTRAINT [DF_ObjectParameters_ModifyingUserID]  DEFAULT ((0)) FOR [ModifyingUserID]
GO

ALTER TABLE [itsm].[ObjectProperties] ADD  CONSTRAINT [DF_ObjectParameters_Status]  DEFAULT ('A') FOR [Status]
GO

ALTER TABLE [itsm].[ObjectProperties] ADD  CONSTRAINT [DF_ObjectParameters_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [itsm].[ObjectProperties] ADD  CONSTRAINT [DF_ObjectParameters_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [itsm].[ObjectProperties]  WITH CHECK ADD  CONSTRAINT [FK_ObjectProperties_ParametersType] FOREIGN KEY([ParameterTypeID])
REFERENCES [itsm].[ParametersType] ([ID])
GO

ALTER TABLE [itsm].[ObjectProperties] CHECK CONSTRAINT [FK_ObjectProperties_ParametersType]
GO

CREATE TABLE [itsm].[CategoryOfParameters](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [varchar](150) NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Deleted] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_CategoryOfParameters] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [itsm].[CategoryOfParameters] ADD  CONSTRAINT [DF_CategoryOfParameters_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO

ALTER TABLE [itsm].[CategoryOfParameters] ADD  CONSTRAINT [DF_CategoryOfParameters_CreationUserID]  DEFAULT ((0)) FOR [CreationUserID]
GO

ALTER TABLE [itsm].[CategoryOfParameters] ADD  CONSTRAINT [DF_CategoryOfParameters_ModifyingDate]  DEFAULT (getdate()) FOR [ModifyingDate]
GO

ALTER TABLE [itsm].[CategoryOfParameters] ADD  CONSTRAINT [DF_CategoryOfParameters_ModifyingUserID]  DEFAULT ((0)) FOR [ModifyingUserID]
GO

ALTER TABLE [itsm].[CategoryOfParameters] ADD  CONSTRAINT [DF_CategoryOfParameters_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [itsm].[CategoryOfParameters] ADD  CONSTRAINT [DF_CategoryOfParameters_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

CREATE TABLE [itsm].[CategoryOfParameters](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [varchar](150) NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Deleted] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_CategoryOfParameters] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [itsm].[CategoryOfParameters] ADD  CONSTRAINT [DF_CategoryOfParameters_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO

ALTER TABLE [itsm].[CategoryOfParameters] ADD  CONSTRAINT [DF_CategoryOfParameters_CreationUserID]  DEFAULT ((0)) FOR [CreationUserID]
GO

ALTER TABLE [itsm].[CategoryOfParameters] ADD  CONSTRAINT [DF_CategoryOfParameters_ModifyingDate]  DEFAULT (getdate()) FOR [ModifyingDate]
GO

ALTER TABLE [itsm].[CategoryOfParameters] ADD  CONSTRAINT [DF_CategoryOfParameters_ModifyingUserID]  DEFAULT ((0)) FOR [ModifyingUserID]
GO

ALTER TABLE [itsm].[CategoryOfParameters] ADD  CONSTRAINT [DF_CategoryOfParameters_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [itsm].[CategoryOfParameters] ADD  CONSTRAINT [DF_CategoryOfParameters_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

CREATE TABLE [itsm].[ParameterCategories](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ParameterTypeID] [int] NULL,
	[CategoryOfParametersID] [int] NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Status] [char](1) NULL,
	[Deleted] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_ParameterCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [itsm].[ParameterCategories] ADD  CONSTRAINT [DF_ParameterCategories_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO

ALTER TABLE [itsm].[ParameterCategories] ADD  CONSTRAINT [DF_ParameterCategories_CreationUserID]  DEFAULT ((0)) FOR [CreationUserID]
GO

ALTER TABLE [itsm].[ParameterCategories] ADD  CONSTRAINT [DF_ParameterCategories_ModifyingDate]  DEFAULT (getdate()) FOR [ModifyingDate]
GO

ALTER TABLE [itsm].[ParameterCategories] ADD  CONSTRAINT [DF_ParameterCategories_ModifyingUserID]  DEFAULT ((0)) FOR [ModifyingUserID]
GO

ALTER TABLE [itsm].[ParameterCategories] ADD  CONSTRAINT [DF_ParameterCategories_Status]  DEFAULT ('A') FOR [Status]
GO

ALTER TABLE [itsm].[ParameterCategories] ADD  CONSTRAINT [DF_ParameterCategories_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [itsm].[ParameterCategories] ADD  CONSTRAINT [DF_ParameterCategories_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

CREATE TABLE [itsm].[Objects](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [varchar](500) NULL,
	[TypeOfObjectID] [int] NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Status] [char](1) NULL,
	[Deleted] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
	[ParentID] [int] NULL,
	[ChildID] [int] NULL,
 CONSTRAINT [PK_Objects] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [itsm].[Objects] ADD  CONSTRAINT [DF_Objects_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO

ALTER TABLE [itsm].[Objects] ADD  CONSTRAINT [DF_Objects_CreationUserID]  DEFAULT ((0)) FOR [CreationUserID]
GO

ALTER TABLE [itsm].[Objects] ADD  CONSTRAINT [DF_Objects_ModifyingDate]  DEFAULT (getdate()) FOR [ModifyingDate]
GO

ALTER TABLE [itsm].[Objects] ADD  CONSTRAINT [DF_Objects_ModifyingUserID]  DEFAULT ((0)) FOR [ModifyingUserID]
GO

ALTER TABLE [itsm].[Objects] ADD  CONSTRAINT [DF_Objects_Status]  DEFAULT ('A') FOR [Status]
GO

ALTER TABLE [itsm].[Objects] ADD  CONSTRAINT [DF_Objects_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [itsm].[Objects] ADD  CONSTRAINT [DF_Objects_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [itsm].[Objects]  WITH CHECK ADD  CONSTRAINT [FK_Objects_TypeOfObjects] FOREIGN KEY([TypeOfObjectID])
REFERENCES [itsm].[TypeOfObjects] ([ID])
GO

ALTER TABLE [itsm].[Objects] CHECK CONSTRAINT [FK_Objects_TypeOfObjects]
GO

CREATE TABLE [itsm].[ObjectsHierarchy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NULL,
	[ChildID] [int] NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Status] [char](1) NULL,
	[Deleted] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_ObjectsHierarchy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [itsm].[ObjectsHierarchy] ADD  CONSTRAINT [DF_ObjectsHierarchy_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO

ALTER TABLE [itsm].[ObjectsHierarchy] ADD  CONSTRAINT [DF_ObjectsHierarchy_CreationUserID]  DEFAULT ((0)) FOR [CreationUserID]
GO

ALTER TABLE [itsm].[ObjectsHierarchy] ADD  CONSTRAINT [DF_ObjectsHierarchy_ModifyingDate]  DEFAULT (getdate()) FOR [ModifyingDate]
GO

ALTER TABLE [itsm].[ObjectsHierarchy] ADD  CONSTRAINT [DF_ObjectsHierarchy_ModifyingUserID]  DEFAULT ((0)) FOR [ModifyingUserID]
GO

ALTER TABLE [itsm].[ObjectsHierarchy] ADD  CONSTRAINT [DF_ObjectsHierarchy_Status]  DEFAULT ('A') FOR [Status]
GO

ALTER TABLE [itsm].[ObjectsHierarchy] ADD  CONSTRAINT [DF_ObjectsHierarchy_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [itsm].[ObjectsHierarchy] ADD  CONSTRAINT [DF_ObjectsHierarchy_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

