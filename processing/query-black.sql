/****** SQL QUERY - Black
		Chris Hua / @stillmatic
  ******/
SELECT	[demo].[GEO#id] AS 'Geo Code'
		,[demo].[GEO#id2] AS 'Geo ID'
		,[demo].[GEO#display-label] AS 'CSA'
		,[demo].[HD01_VD01] AS 'Pop - Tot'
		,[demo].[HD01_VD03] AS 'Pop - Black'
		,0 AS 'Asian'
		,1 AS 'Black'
		,0 AS 'Latino'
		,[med-income-black].[Estimate; Median household income in the past 12 months (in 2013] AS 'MHI'
		,([edu-Black].[Estimate; Male: - Bachelor's degree or higher] + 
			[edu-Black].[Estimate; Female: - Bachelor's degree or higher]) / [edu-black].[Estimate; Total:] AS '% College'
		,([english-black].[Estimate; Native: - Speak only English] 
			+ [english-black].[Estimate; Native: - Speak another language - Speak English "very]
			+ [english-black].[Estimate; Foreign born: - Speak only English] 
			+ [english-black].[Estimate; Foreign born: - Speak another language - Speak English]) / [english-black].[Estimate; Total:]
			AS ' % Eng - Good'

FROM [ESE].[dbo].[demo], 
	[ESE].[dbo].[med-income-black],
	[ESE].[dbo].[edu-black],
	[ESE].[dbo].[english-black]

WHERE 
	[demo].[GEO#ID] = [med-income-black].[id] 
	AND [demo].[GEO#id] = [edu-black].[id]
	AND [demo].[GEO#id] = [english-black].[id]

ORDER BY [demo].GEO#id2