/****** SQL QUERY - Asian
		Chris Hua / @stillmatic
  ******/
SELECT	CONCAT([demo].[GEO#id2], '-Asian') AS 'Stat ID'
		/*,[demo].[GEO#display-label] AS 'CSA'
		,[demo].[HD01_VD01] AS 'Pop - Tot'
		,[demo].[HD01_VD05] AS 'Pop - Asian'*/
		,1 AS 'Asian'
		,0 AS 'Black'
		,0 AS 'Latino'
		,[med-income-asian].[med-inc-asian] AS 'MHI'
		,([edu-asian].[Estimate; Male: - Bachelor's degree or higher] + 
			[edu-asian].[Estimate; Female: - Bachelor's degree or higher]) / [edu-asian].[Estimate; Total:] AS '% College'
		,([english-asian].[Estimate; Native: - Speak only English] 
			+ [english-asian].[Estimate; Native: - Speak another language - Speak English "very]
			+ [english-asian].[Estimate; Foreign born: - Speak only English] 
			+ [english-asian].[Estimate; Foreign born: - Speak another language - Speak English]) / [english-asian].[Estimate; Total:]
			AS ' % Eng - Good'
		, ([Estimate; Male: - Worked full-time, year-round in the past 12 mo] +
		   [Estimate; Female: - Worked full-time, year-round in the past 12 ])/[employment_asian].[Estimate; Total:] 
			AS '% Full-time'

FROM [ESE].[dbo].[demo], 
	[ESE].[dbo].[med-income-asian],
	[ESE].[dbo].[edu-asian],
	[ESE].[dbo].[english-asian],
	[ESE].[dbo].[employment_asian]

WHERE 
	[demo].[GEO#ID] = [med-income-asian].[geo#id] 
	AND [demo].[GEO#id] = [edu-asian].[id]
	AND [demo].[GEO#id] = [english-asian].[id]
	AND [demo].[GEO#id] = [employment_asian].[id]

ORDER BY [demo].GEO#id2