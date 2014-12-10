/****** SQL QUERY - Latino
		Chris Hua / @stillmatic
  ******/
SELECT	CONCAT([demo].[GEO#id2],'-Latino') AS 'Stat ID'
		/*,[demo].[GEO#display-label] AS 'CSA'
		,[demo].[HD01_VD01] AS 'Pop - Tot'
		,[english-Latino].[Estimate; Total:] AS 'Pop - Latino'*/
		,0 AS 'Asian'
		,0 AS 'Black'
		,1 AS 'Latino'
		,[med-income-Latino].[Estimate; Median household income in the past 12 months (in 2013] AS 'MHI'
		,([edu-Latino].[Estimate; Male: - Bachelor's degree or higher] + 
			[edu-Latino].[Estimate; Female: - Bachelor's degree or higher]) / [edu-Latino].[Estimate; Total:] AS '% College'
		,([english-Latino].[Estimate; Native: - Speak only English] 
			+ [english-Latino].[Estimate; Native: - Speak another language - Speak English "very]
			+ [english-Latino].[Estimate; Foreign born: - Speak only English] 
			+ [english-Latino].[Estimate; Foreign born: - Speak another language - Speak English]) / [english-Latino].[Estimate; Total:]
			AS ' % Eng - Good'
		, ([Estimate; Male: - Worked full-time, year-round in the past 12 mo] +
		   [Estimate; Female: - Worked full-time, year-round in the past 12 ])/[employment_hispanic].[Estimate; Total:] 
			AS '% Full-time'

FROM [ESE].[dbo].[demo], 
	[ESE].[dbo].[med-income-Latino],
	[ESE].[dbo].[edu-Latino],
	[ESE].[dbo].[english-Latino],
	[ESE].[dbo].[employment_hispanic]

WHERE 
	[demo].[GEO#ID] = [edu-Latino].[id]
	AND [demo].[geo#id] = [med-income-Latino].[id]
	AND [demo].[GEO#id] = [english-Latino].[id]
	AND [demo].[GEO#id] = [employment_hispanic].[id]

ORDER BY [demo].GEO#id2