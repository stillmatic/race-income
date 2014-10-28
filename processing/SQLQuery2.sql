/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [demo-csa].[GEO#id]
      ,[demo-csa].[GEO#id2]
      ,[demo-csa].[GEO#display-label]
      ,[demo-csa].[HD01_VD01] AS 'Pop - Top'
	  ,[demo-csa].[HD02_VD02] AS 'Pop - White'
	  ,[demo-csa].[HD02_VD03] AS 'Pop - Black'
	  ,[demo-csa].[HD02_VD04] AS 'Pop - AmInd'
	  ,[demo-csa].[HD02_VD05] AS 'Pop - Asian'
	  ,[demo-csa].[HD02_VD06] AS 'Pop - PacIsl'
	  ,[med-income-asian-csa].[med-inc-asian] AS 'Median Household Income - Asian'
FROM [ESE].[dbo].[demo-csa], [ESE].[dbo].[med-income-asian-csa]
WHERE [demo-csa].[Geo#id] = [med-income-asian-csa].[geo#id]
ORDER BY GEO#id2