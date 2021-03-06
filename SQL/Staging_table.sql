USE [master]
GO
/****** Object:  Database [SEP_Staging]    Script Date: 13/05/2019 16:03:20 ******/
CREATE DATABASE [SEP_Staging]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SEP_Staging', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SEP_Staging.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SEP_Staging_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SEP_Staging_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SEP_Staging] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SEP_Staging].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SEP_Staging] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SEP_Staging] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SEP_Staging] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SEP_Staging] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SEP_Staging] SET ARITHABORT OFF 
GO
ALTER DATABASE [SEP_Staging] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SEP_Staging] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SEP_Staging] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SEP_Staging] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SEP_Staging] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SEP_Staging] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SEP_Staging] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SEP_Staging] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SEP_Staging] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SEP_Staging] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SEP_Staging] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SEP_Staging] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SEP_Staging] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SEP_Staging] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SEP_Staging] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SEP_Staging] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SEP_Staging] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SEP_Staging] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SEP_Staging] SET  MULTI_USER 
GO
ALTER DATABASE [SEP_Staging] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SEP_Staging] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SEP_Staging] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SEP_Staging] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SEP_Staging] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SEP_Staging] SET QUERY_STORE = OFF
GO
USE [SEP_Staging]
GO
/****** Object:  Table [dbo].[F_CO2_staging]    Script Date: 13/05/2019 16:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_CO2_staging](
	[DateKey] [int] NULL,
	[TimeKey] [int] NULL,
	[PlantKey] [int] NULL,
	[B_PlantKey] [int] NULL,
	[Units_CO2] [float] NULL,
	[Date_Value] [date] NULL,
	[Time_Value] [time](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F_Humidity_Staging]    Script Date: 13/05/2019 16:03:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_Humidity_Staging](
	[DateKey] [int] NULL,
	[TimeKey] [int] NULL,
	[PlantKey] [int] NULL,
	[B_PlantKey] [int] NULL,
	[Units_Humidity] [float] NULL,
	[Date_Value] [date] NULL,
	[Time_Value] [time](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F_Light_Staging]    Script Date: 13/05/2019 16:03:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_Light_Staging](
	[DateKey] [int] NULL,
	[TimeKey] [int] NULL,
	[PlantKey] [int] NULL,
	[B_PlantKey] [int] NULL,
	[Units_Light] [int] NULL,
	[Date_Value] [date] NULL,
	[Time_Value] [time](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F_Temperature_Staging]    Script Date: 13/05/2019 16:03:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_Temperature_Staging](
	[DateKey] [int] NULL,
	[TimeKey] [int] NULL,
	[PlantKey] [int] NULL,
	[B_PlantKey] [int] NULL,
	[Units_Temperature] [float] NULL,
	[Date_Value] [date] NULL,
	[Time_Value] [time](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F_Watering_staging]    Script Date: 13/05/2019 16:03:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_Watering_staging](
	[DateKey] [int] NULL,
	[TimeKey] [int] NULL,
	[PlantKey] [int] NULL,
	[B_PlantKey] [int] NULL,
	[AmountOfWater] [float] NULL,
	[HoursSinceWatering] [float] NULL,
	[Date_Value] [date] NULL,
	[Time_Value] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plant_Dimension_Staging]    Script Date: 13/05/2019 16:03:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plant_Dimension_Staging](
	[PlantKey] [int] IDENTITY(1,1) NOT NULL,
	[B_PlantKey] [int] NULL,
	[PlantName] [char](25) NULL,
	[validFrom] [date] NULL,
	[validTo] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[FillDimTime]    Script Date: 13/05/2019 16:03:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FillDimTime] 
as 
BEGIN 
--Specify Total Number of Hours You need to fill in Time Dimension 
DECLARE @Size INTEGER 
--iF @Size=32 THEN This will Fill values Upto 32:59 hr in Time Dimension 
Set @Size=23 
DECLARE @hour INTEGER 
DECLARE @minute INTEGER 
DECLARE @second INTEGER 
DECLARE @TimeAltKey INTEGER 
DECLARE @TimeInSeconds INTEGER 
DECLARE @Time30 varchar(25) 
DECLARE @Hour30 varchar(4) 
DECLARE @Minute30 varchar(4) 
DECLARE @Second30 varchar(4) 
DECLARE @HourBucket varchar(15) 
DECLARE @HourBucketGroupKey int 
DECLARE @DayTimeBucket varchar(100) 
DECLARE @DayTimeBucketGroupKey int 
SET @hour = 0 
SET @minute = 0 
SET @second = 0 
SET @TimeAltKey = 0 
WHILE(@hour<= @Size ) 
BEGIN 
if (@hour <10 ) 
begin 
set @Hour30 = '0' + cast( @hour as varchar(10)) 
end 
else 
begin 
set @Hour30 = @hour 
end 
--Create Hour Bucket Value 
set @HourBucket= @Hour30+':00' +'-' +@Hour30+':59' 
WHILE(@minute <= 59) 
BEGIN 
WHILE(@second <= 59) 
BEGIN 
set @TimeAltKey = @hour *10000 +@minute*100 +@second 
set @TimeInSeconds =@hour * 3600 + @minute *60 +@second 
If @minute <10 
begin 
set @Minute30 = '0' + cast ( @minute as varchar(10) ) 
end 
else 
begin 
set @Minute30 = @minute 
end 
if @second <10 
begin 
set @Second30 = '0' + cast ( @second as varchar(10) ) 
end 
else 
begin 
set @Second30 = @second 
end 
--Concatenate values for Time30 
set @Time30 = @Hour30 +':'+@Minute30 +':'+@Second30 
--DayTimeBucketGroupKey can be used in Sorting of DayTime Bucket In proper Order 
SELECT @DayTimeBucketGroupKey = 
CASE 
WHEN (@TimeAltKey >= 00000 AND @TimeAltKey <= 25959) THEN 0 
WHEN (@TimeAltKey >= 30000 AND @TimeAltKey <= 65959) THEN 1 
WHEN (@TimeAltKey >= 70000 AND @TimeAltKey <= 85959) THEN 2 
WHEN (@TimeAltKey >= 90000 AND @TimeAltKey <= 115959) THEN 3 
WHEN (@TimeAltKey >= 120000 AND @TimeAltKey <= 135959)THEN 4 
WHEN (@TimeAltKey >= 140000 AND @TimeAltKey <= 155959)THEN 5 
WHEN (@TimeAltKey >= 50000 AND @TimeAltKey <= 175959) THEN 6 
WHEN (@TimeAltKey >= 180000 AND @TimeAltKey <= 235959)THEN 7 
WHEN (@TimeAltKey >= 240000) THEN 8 
END 
--print @DayTimeBucketGroupKey 
-- DayTimeBucket Time Divided in Specific Time Zone 
-- So Data can Be Grouped as per Bucket for Analyzing as per time of day 
SELECT @DayTimeBucket = 
CASE 
WHEN (@TimeAltKey >= 00000 AND @TimeAltKey <= 25959) 
THEN 'Late Night (00:00 AM To 02:59 AM)' 
WHEN (@TimeAltKey >= 30000 AND @TimeAltKey <= 65959) 
THEN 'Early Morning(03:00 AM To 6:59 AM)' 
WHEN (@TimeAltKey >= 70000 AND @TimeAltKey <= 85959) 
THEN 'AM Peak (7:00 AM To 8:59 AM)' 
WHEN (@TimeAltKey >= 90000 AND @TimeAltKey <= 115959) 
THEN 'Mid Morning (9:00 AM To 11:59 AM)' 
WHEN (@TimeAltKey >= 120000 AND @TimeAltKey <= 135959) 
THEN 'Lunch (12:00 PM To 13:59 PM)' 
WHEN (@TimeAltKey >= 140000 AND @TimeAltKey <= 155959)
THEN 'Mid Afternoon (14:00 PM To 15:59 PM)' 
WHEN (@TimeAltKey >= 50000 AND @TimeAltKey <= 175959)
THEN 'PM Peak (16:00 PM To 17:59 PM)' 
WHEN (@TimeAltKey >= 180000 AND @TimeAltKey <= 235959)
THEN 'Evening (18:00 PM To 23:59 PM)' 
WHEN (@TimeAltKey >= 240000) THEN 'Previous Day Late Night _
(24:00 PM to '+cast( @Size as varchar(10)) +':00 PM )' 
END 
-- print @DayTimeBucket 
INSERT into D_Time(TimeAltKey,[Time30] ,[Hour30] ,
[MinuteNumber],[SecondNumber],[TimeInSecond],[HourlyBucket],
DayTimeBucketGroupKey,DayTimeBucket) 
VALUES (@TimeAltKey ,@Time30 ,@hour ,@minute,@Second , 
@TimeInSeconds,@HourBucket,@DayTimeBucketGroupKey,@DayTimeBucket ) 
SET @second = @second + 1 
END 
SET @minute = @minute + 1 
SET @second = 0 
END 
SET @hour = @hour + 1 
SET @minute =0 
END 
END 

GO
USE [master]
GO
ALTER DATABASE [SEP_Staging] SET  READ_WRITE 
GO
