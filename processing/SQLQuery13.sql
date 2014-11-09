/****** SIMPLIFIED SQL QUERY
		Total + White + Asian
		Chris Hua / @stillmatic
  ******/
SELECT	[demo].[GEO#id] AS 'Geo Code'
		,[demo].[GEO#id2] AS 'Geo ID'
		,[demo].[GEO#display-label] AS 'CSA'
		,[demo].[HD01_VD01] AS 'Pop - Tot'
		,[demo].[HD01_VD02] AS 'Pop - White'
		,[demo].[HD01_VD05] AS 'Pop - Asian'
		,[med-income].[HD01_VD01] AS 'Med. Household Income'
		,[med-income-white].[Estimate; Median household income in the past 12 months (in 2013] AS 'MHI - White'
		,[med-income-asian].[med-inc-asian] AS 'MHI - Asian'
		,[edu-white].[Estimate; Male: - Less than high school diploma] +
			[edu-white].[Estimate; Female: - Less than high school diploma]
			AS 'Edu - White - None'
		,[edu-white].[Estimate; Male: - High school graduate (includes equivalency)] +
			[edu-white].[Estimate; Female: - High school graduate (includes equivalency)]
			AS 'Edu - White - HS' 
		,[edu-white].[Estimate; Male: - Bachelor's degree or higher] + 
			[edu-white].[Estimate; Female: - Bachelor's degree or higher]
			AS 'Edu - White - College'
		,[edu-asian].[Estimate; Male: - Less than high school diploma] +
			[edu-asian].[Estimate; Female: - Less than high school diploma]
			AS 'Edu - Asian - None'
		,[edu-asian].[Estimate; Male: - High school graduate (includes equivalency)] +
			[edu-asian].[Estimate; Female: - High school graduate (includes equivalency)]
			AS 'Edu - Asian - HS' 
		,[edu-asian].[Estimate; Male: - Bachelor's degree or higher] + 
			[edu-asian].[Estimate; Female: - Bachelor's degree or higher]
			AS 'Edu - Asian - College'
	  
FROM [ESE].[dbo].[demo], 
	[ESE].[dbo].[med-income-asian],
	[ESE].[dbo].[med-income],
	[ESE].[dbo].[med-income-white],
	[ESE].[dbo].[edu-white],
	[ESE].[dbo].[edu-asian]

WHERE 
	[demo].[GEO#ID] = [edu-white].[id]
	AND [demo].[Geo#id] = [med-income].[GEO#id]
	AND [demo].[Geo#id] = [med-income-asian].[geo#id] 
	AND [demo].[geo#id] = [med-income-white].[id]
	AND [demo].[GEO#id] = [edu-asian].[id]

ORDER BY [demo].GEO#id2