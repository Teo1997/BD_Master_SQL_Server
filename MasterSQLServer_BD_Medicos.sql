USE [master]
GO
/****** Object:  Database [centroMedico1]    Script Date: 16/11/2021 2:20:50 p. m. ******/
CREATE DATABASE [centroMedico1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'centroMedico1', FILENAME = N'C:\SQLDATA\Centro_Medico\centroMedico1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'centroMedico1_log', FILENAME = N'C:\SQLDATA\Centro_Medico\centroMedico1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [centroMedico1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [centroMedico1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [centroMedico1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [centroMedico1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [centroMedico1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [centroMedico1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [centroMedico1] SET ARITHABORT OFF 
GO
ALTER DATABASE [centroMedico1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [centroMedico1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [centroMedico1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [centroMedico1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [centroMedico1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [centroMedico1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [centroMedico1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [centroMedico1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [centroMedico1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [centroMedico1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [centroMedico1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [centroMedico1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [centroMedico1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [centroMedico1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [centroMedico1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [centroMedico1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [centroMedico1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [centroMedico1] SET RECOVERY FULL 
GO
ALTER DATABASE [centroMedico1] SET  MULTI_USER 
GO
ALTER DATABASE [centroMedico1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [centroMedico1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [centroMedico1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [centroMedico1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [centroMedico1] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'centroMedico1', N'ON'
GO
ALTER DATABASE [centroMedico1] SET QUERY_STORE = OFF
GO
USE [centroMedico1]
GO
/****** Object:  UserDefinedDataType [dbo].[historia]    Script Date: 16/11/2021 2:20:50 p. m. ******/
CREATE TYPE [dbo].[historia] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[medico]    Script Date: 16/11/2021 2:20:50 p. m. ******/
CREATE TYPE [dbo].[medico] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[observacion]    Script Date: 16/11/2021 2:20:50 p. m. ******/
CREATE TYPE [dbo].[observacion] FROM [varchar](1000) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[paciente]    Script Date: 16/11/2021 2:20:50 p. m. ******/
CREATE TYPE [dbo].[paciente] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[turno]    Script Date: 16/11/2021 2:20:50 p. m. ******/
CREATE TYPE [dbo].[turno] FROM [int] NOT NULL
GO
/****** Object:  Table [dbo].[Concepto]    Script Date: 16/11/2021 2:20:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Concepto](
	[idConcepto] [tinyint] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[idConcepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidad]    Script Date: 16/11/2021 2:20:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidad](
	[idEspecialidad] [int] IDENTITY(1,1) NOT NULL,
	[especialidad] [varchar](50) NULL,
 CONSTRAINT [PK_Especialidad] PRIMARY KEY CLUSTERED 
(
	[idEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historia]    Script Date: 16/11/2021 2:20:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historia](
	[idHistoria] [dbo].[historia] IDENTITY(1,1) NOT NULL,
	[fechaHistoria] [datetime] NULL,
	[observacion] [dbo].[observacion] NULL,
 CONSTRAINT [PK_Historia] PRIMARY KEY CLUSTERED 
(
	[idHistoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoriaPaciente]    Script Date: 16/11/2021 2:20:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoriaPaciente](
	[idHistoria] [dbo].[historia] NOT NULL,
	[idPaciente] [dbo].[paciente] NOT NULL,
	[idMedico] [dbo].[medico] NOT NULL,
 CONSTRAINT [PK_HistoriaPaciente] PRIMARY KEY CLUSTERED 
(
	[idHistoria] ASC,
	[idPaciente] ASC,
	[idMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 16/11/2021 2:20:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico](
	[idMedico] [dbo].[medico] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
 CONSTRAINT [PK_Medico] PRIMARY KEY CLUSTERED 
(
	[idMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicoEspecialidad]    Script Date: 16/11/2021 2:20:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicoEspecialidad](
	[idMedico] [int] NOT NULL,
	[idEspecialidad] [int] NOT NULL,
	[descripcion] [varchar](1000) NULL,
 CONSTRAINT [PK_MedicoEspecialidad] PRIMARY KEY CLUSTERED 
(
	[idMedico] ASC,
	[idEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 16/11/2021 2:20:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[idPaciente] [dbo].[paciente] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[fNacimiento] [date] NULL,
	[domicilio] [varchar](50) NULL,
	[idPais] [char](3) NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](30) NULL,
	[observacion] [dbo].[observacion] NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[idPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 16/11/2021 2:20:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[idPago] [int] IDENTITY(1,1) NOT NULL,
	[concepto] [tinyint] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[monto] [money] NOT NULL,
	[estado] [tinyint] NULL,
	[observacion] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[idPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagoPaciente]    Script Date: 16/11/2021 2:20:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagoPaciente](
	[idPago] [int] NOT NULL,
	[idPaciente] [int] NOT NULL,
	[idTurno] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPago] ASC,
	[idPaciente] ASC,
	[idTurno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 16/11/2021 2:20:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[idPais] [char](3) NOT NULL,
	[pais] [varchar](50) NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[idPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turno]    Script Date: 16/11/2021 2:20:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turno](
	[idTurno] [dbo].[turno] IDENTITY(1,1) NOT NULL,
	[fechaTurno] [datetime] NULL,
	[estado] [smallint] NULL,
	[observacion] [dbo].[observacion] NULL,
 CONSTRAINT [PK_Turno] PRIMARY KEY CLUSTERED 
(
	[idTurno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TurnoEstado]    Script Date: 16/11/2021 2:20:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TurnoEstado](
	[idestado] [smallint] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_TurnoEstado] PRIMARY KEY CLUSTERED 
(
	[idestado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TurnoPaciente]    Script Date: 16/11/2021 2:20:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TurnoPaciente](
	[idTurno] [int] NOT NULL,
	[idPaciente] [int] NOT NULL,
	[idMedico] [int] NOT NULL,
 CONSTRAINT [PK_TurnoPaciente] PRIMARY KEY CLUSTERED 
(
	[idTurno] ASC,
	[idPaciente] ASC,
	[idMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Paciente] ON 
GO
INSERT [dbo].[Paciente] ([idPaciente], [nombre], [apellido], [fNacimiento], [domicilio], [idPais], [telefono], [email], [observacion]) VALUES (1, N'Jorge', N'Ramirez', CAST(N'2019-01-18' AS Date), NULL, N'ESP', NULL, NULL, NULL)
GO
INSERT [dbo].[Paciente] ([idPaciente], [nombre], [apellido], [fNacimiento], [domicilio], [idPais], [telefono], [email], [observacion]) VALUES (2, N'Claudia', N'Lopez', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Paciente] ([idPaciente], [nombre], [apellido], [fNacimiento], [domicilio], [idPais], [telefono], [email], [observacion]) VALUES (3, N'Roberto', N'Perez', CAST(N'2017-01-04' AS Date), N'Piedra buena 21', N'ESP', N'', N'', N'')
GO
SET IDENTITY_INSERT [dbo].[Paciente] OFF
GO
INSERT [dbo].[Pais] ([idPais], [pais]) VALUES (N'ARG', N'Argentina')
GO
INSERT [dbo].[Pais] ([idPais], [pais]) VALUES (N'BRA', N'Brasil')
GO
INSERT [dbo].[Pais] ([idPais], [pais]) VALUES (N'COL', N'Colombia')
GO
INSERT [dbo].[Pais] ([idPais], [pais]) VALUES (N'ESP', N'España')
GO
INSERT [dbo].[Pais] ([idPais], [pais]) VALUES (N'PER', N'Peru')
GO
SET IDENTITY_INSERT [dbo].[Turno] ON 
GO
INSERT [dbo].[Turno] ([idTurno], [fechaTurno], [estado], [observacion]) VALUES (1, CAST(N'2020-03-02T13:00:00.000' AS DateTime), 0, N'')
GO
INSERT [dbo].[Turno] ([idTurno], [fechaTurno], [estado], [observacion]) VALUES (2, CAST(N'2020-03-03T14:00:00.000' AS DateTime), 0, N'')
GO
INSERT [dbo].[Turno] ([idTurno], [fechaTurno], [estado], [observacion]) VALUES (3, CAST(N'2020-03-03T15:30:00.000' AS DateTime), 1, N'El paciente ha sido atendido')
GO
INSERT [dbo].[Turno] ([idTurno], [fechaTurno], [estado], [observacion]) VALUES (4, CAST(N'2020-03-05T18:00:00.000' AS DateTime), 2, N'El paciente llamó para cancelar el turno')
GO
SET IDENTITY_INSERT [dbo].[Turno] OFF
GO
INSERT [dbo].[TurnoEstado] ([idestado], [descripcion]) VALUES (0, N'Pendiente')
GO
INSERT [dbo].[TurnoEstado] ([idestado], [descripcion]) VALUES (1, N'Realizado')
GO
INSERT [dbo].[TurnoEstado] ([idestado], [descripcion]) VALUES (2, N'Cancelado')
GO
ALTER TABLE [dbo].[HistoriaPaciente]  WITH CHECK ADD  CONSTRAINT [FK_HistoriaPaciente_Historia] FOREIGN KEY([idHistoria])
REFERENCES [dbo].[Historia] ([idHistoria])
GO
ALTER TABLE [dbo].[HistoriaPaciente] CHECK CONSTRAINT [FK_HistoriaPaciente_Historia]
GO
ALTER TABLE [dbo].[HistoriaPaciente]  WITH CHECK ADD  CONSTRAINT [FK_HistoriaPaciente_Medico] FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medico] ([idMedico])
GO
ALTER TABLE [dbo].[HistoriaPaciente] CHECK CONSTRAINT [FK_HistoriaPaciente_Medico]
GO
ALTER TABLE [dbo].[HistoriaPaciente]  WITH CHECK ADD  CONSTRAINT [FK_HistoriaPaciente_Paciente] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[Paciente] ([idPaciente])
GO
ALTER TABLE [dbo].[HistoriaPaciente] CHECK CONSTRAINT [FK_HistoriaPaciente_Paciente]
GO
ALTER TABLE [dbo].[MedicoEspecialidad]  WITH CHECK ADD  CONSTRAINT [FK_MedicoEspecialidad_Especialidad] FOREIGN KEY([idEspecialidad])
REFERENCES [dbo].[Especialidad] ([idEspecialidad])
GO
ALTER TABLE [dbo].[MedicoEspecialidad] CHECK CONSTRAINT [FK_MedicoEspecialidad_Especialidad]
GO
ALTER TABLE [dbo].[MedicoEspecialidad]  WITH CHECK ADD  CONSTRAINT [FK_MedicoEspecialidad_Medico] FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medico] ([idMedico])
GO
ALTER TABLE [dbo].[MedicoEspecialidad] CHECK CONSTRAINT [FK_MedicoEspecialidad_Medico]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Pais] FOREIGN KEY([idPais])
REFERENCES [dbo].[Pais] ([idPais])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_Pais]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Concepto] FOREIGN KEY([concepto])
REFERENCES [dbo].[Concepto] ([idConcepto])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_Concepto]
GO
ALTER TABLE [dbo].[PagoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_PagoPaciente_Paciente] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[Paciente] ([idPaciente])
GO
ALTER TABLE [dbo].[PagoPaciente] CHECK CONSTRAINT [FK_PagoPaciente_Paciente]
GO
ALTER TABLE [dbo].[PagoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_PagoPaciente_Pago] FOREIGN KEY([idPago])
REFERENCES [dbo].[Pago] ([idPago])
GO
ALTER TABLE [dbo].[PagoPaciente] CHECK CONSTRAINT [FK_PagoPaciente_Pago]
GO
ALTER TABLE [dbo].[PagoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_PagoPaciente_Turno] FOREIGN KEY([idTurno])
REFERENCES [dbo].[Turno] ([idTurno])
GO
ALTER TABLE [dbo].[PagoPaciente] CHECK CONSTRAINT [FK_PagoPaciente_Turno]
GO
ALTER TABLE [dbo].[Turno]  WITH CHECK ADD  CONSTRAINT [FK_Turno_TurnoEstado] FOREIGN KEY([estado])
REFERENCES [dbo].[TurnoEstado] ([idestado])
GO
ALTER TABLE [dbo].[Turno] CHECK CONSTRAINT [FK_Turno_TurnoEstado]
GO
ALTER TABLE [dbo].[TurnoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_TurnoPaciente_Medico] FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medico] ([idMedico])
GO
ALTER TABLE [dbo].[TurnoPaciente] CHECK CONSTRAINT [FK_TurnoPaciente_Medico]
GO
ALTER TABLE [dbo].[TurnoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_TurnoPaciente_Paciente] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[Paciente] ([idPaciente])
GO
ALTER TABLE [dbo].[TurnoPaciente] CHECK CONSTRAINT [FK_TurnoPaciente_Paciente]
GO
ALTER TABLE [dbo].[TurnoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_TurnoPaciente_Turno] FOREIGN KEY([idTurno])
REFERENCES [dbo].[Turno] ([idTurno])
GO
ALTER TABLE [dbo].[TurnoPaciente] CHECK CONSTRAINT [FK_TurnoPaciente_Turno]
GO
USE [master]
GO
ALTER DATABASE [centroMedico1] SET  READ_WRITE 
GO
