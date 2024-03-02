USE [master]
GO

CREATE DATABASE [kaizenITSM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kaizenITSM_data', FILENAME = N'kaizenITSM_data.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'kaizenITSM_log', FILENAME = N'kaizenITSM_log.ldf' , SIZE = 253952KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO




