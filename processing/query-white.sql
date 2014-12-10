/****** SQL QUERY - White
		Chris Hua / @stillmatic
  ******/
SELECT	[demo].[GEO#id] AS 'Geo Code'
		,[demo].[GEO#id2] AS 'Geo ID'
		,[demo].[GEO#display-label] AS 'CSA'
		,[demo].[HD01_VD01] AS 'Pop - Tot'
		,[demo].[HD01_VD02] AS 'Pop - White'
		,0 AS 'Asian'
		,0 AS 'Black'
		,0 AS 'Latino'
		,[med-income-White].[Estimate; Median household income in the past 12 months (in 2013] AS 'MHI'
		,([edu-White].[Estimate; Male: - Bachelor's degree or higher] + 
			[edu-White].[Estimate; Female: - Bachelor's degree or higher]) / [edu-White].[Estimate; Total:] AS '% College'
		,([english-White].[Estimate; Native: - Speak only English] 
			+ [english-White].[Estimate; Native: - Speak another language - Speak English "very]
			+ [english-White].[Estimate; Foreign born: - Speak only English] 
			+ [english-White].[Estimate; Foreign born: - Speak another language - Speak English]) / [english-White].[Estimate; Total:]
			AS ' % Eng - Good'

FROM [ESE].[dbo].[demo], 
	[ESE].[dbo].[med-income-white],
	[ESE].[dbo].[edu-white],
	[ESE].[dbo].[english-white]

WHERE 
	[demo].[GEO#ID] = [edu-white].[id]
	AND [demo].[geo#id] = [med-income-white].[id]
	AND [demo].[GEO#id] = [english-white].[id]

ORDER BY [demo].GEO#id2