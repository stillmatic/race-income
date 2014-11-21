/****** MASTER SQL QUERY
		Chris Hua / @stillmatic
  ******/
SELECT	[demo].[GEO#id] AS 'Geo Code'
		,[demo].[GEO#id2] AS 'Geo ID'
		,[demo].[GEO#display-label] AS 'CSA'
		,[demo].[HD01_VD01] AS 'Pop - Tot'
		,[demo].[HD01_VD02] AS 'Pop - White'
		,[demo].[HD01_VD03] AS 'Pop - Black'
		,[demo].[HD01_VD04] AS 'Pop - AmInd'
		,[demo].[HD01_VD05] AS 'Pop - Asian'
		,[demo].[HD01_VD06] AS 'Pop - PacIsl'
		,[med-income].[HD01_VD01] AS 'Median Household Income'
		,[med-income-white].[Estimate; Median household income in the past 12 months (in 2013] AS 'MHI - White'
		,[med-income-black].[Estimate; Median household income in the past 12 months (in 2013] AS 'MHI - Black'
		,[med-income-indian].[Estimate; Median household income in the past 12 months (in 2013] AS 'MHI - Am. Indian'
		,[med-income-asian].[med-inc-asian] AS 'MHI - Asian'
		,[med-income-latino].[Estimate; Median household income in the past 12 months (in 2013] AS 'MHI - Latino'
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
		,[edu-Black].[Estimate; Male: - Less than high school diploma] +
			[edu-Black].[Estimate; Female: - Less than high school diploma]
			AS 'Edu - Black - None'
		,[edu-Black].[Estimate; Male: - High school graduate (includes equivalency)] +
			[edu-Black].[Estimate; Female: - High school graduate (includes equivalency)]
			AS 'Edu - Black - HS' 
		,[edu-Black].[Estimate; Male: - Bachelor's degree or higher] + 
			[edu-Black].[Estimate; Female: - Bachelor's degree or higher]
			AS 'Edu - Black - College'
		,[edu-indian].[Estimate; Male: - Less than high school diploma] +
			[edu-indian].[Estimate; Female: - Less than high school diploma]
			AS 'Edu - AmInd - None'
		,[edu-indian].[Estimate; Male: - High school graduate (includes equivalency)] +
			[edu-indian].[Estimate; Female: - High school graduate (includes equivalency)]
			AS 'Edu - AmInd - HS' 
		,[edu-indian].[Estimate; Male: - Bachelor's degree or higher] + 
			[edu-indian].[Estimate; Female: - Bachelor's degree or higher]
			AS 'Edu - AmInd - College'
	  
FROM [ESE].[dbo].[demo], 
	[ESE].[dbo].[med-income-asian],
	[ESE].[dbo].[med-income],
	[ESE].[dbo].[med-income-white],
	[ESE].[dbo].[med-income-black],
	[ESE].[dbo].[med-income-latino],
	[ESE].[dbo].[med-income-indian],
	[ESE].[dbo].[edu-white],
	[ESE].[dbo].[edu-asian],
	[ESE].[dbo].[edu-latino],
	[ESE].[dbo].[edu-black],
	[ESE].[dbo].[edu-indian]

WHERE 
	[demo].[GEO#ID] = [edu-white].[id]
	AND [demo].[Geo#id] = [med-income].[GEO#id]
	AND [demo].[Geo#id] = [med-income-asian].[geo#id] 
	AND [demo].[geo#id] = [med-income-white].[id]
	AND [demo].[GEO#ID] = [med-income-black].[id] 
	AND [demo].[GEO#id] = [med-income-latino].[id]
	AND [demo].[GEO#id] = [med-income-indian].[id]
	AND [demo].[GEO#id] = [edu-asian].[id]
	AND [demo].[GEO#id] = [edu-latino].[id]
	AND [demo].[GEO#id] = [edu-black].[id]
	AND [demo].[GEO#id] = [edu-indian].[id]

ORDER BY [demo].GEO#id2