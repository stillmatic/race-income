/****** SQL QUERY - White
		Chris Hua / @stillmatic
  ******/
SELECT	CONCAT([demo].[GEO#id2],'-White') AS 'Stat ID'
		/*,[demo].[GEO#display-label] AS 'CSA'
		,[demo].[HD01_VD01] AS 'Pop - Tot'
		,[demo].[HD01_VD02] AS 'Pop'*/
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
		, ([Estimate; Male: - Worked full-time, year-round in the past 12 mo] +
		   [Estimate; Female: - Worked full-time, year-round in the past 12 ])/[employment_white].[Estimate; Total:] 
			AS '% Full-time'

FROM [ESE].[dbo].[demo], 
	[ESE].[dbo].[med-income-white],
	[ESE].[dbo].[edu-white],
	[ESE].[dbo].[english-white],
	[ESE].[dbo].[employment_white]


WHERE 
	[demo].[GEO#ID] = [edu-white].[id]
	AND [demo].[geo#id] = [med-income-white].[id]
	AND [demo].[GEO#id] = [english-white].[id]
	AND [demo].[GEO#id] = [ESE].[dbo].[employment_white].[id]

ORDER BY [demo].GEO#id2