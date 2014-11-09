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
		,[education-white].[Estimate; Female: - 9th to 12th grade, no diploma] +
			[education-white].[Estimate; Female: - GED or alternative credential] +
			[education-white].[Estimate; Female: - Less than 9th grade] +
			[education-white].[Estimate; Female: - Regular high school diploma] +
			[education-white].[Estimate; Male: - 9th to 12th grade, no diploma] +
			[education-white].[Estimate; Male: - GED or alternative credential] + 
			[education-white].[Estimate; Male: - Less than 9th grade] + 
			[education-white].[Estimate; Male: - Regular high school diploma]
			AS 'Edu - White - HS' 
		,[education-white].[Estimate; Female: - Associate's degree] + 
			[education-white].[Estimate; Female: - Bachelor's degree] + 
			[education-white].[Estimate; Female: - Some college, no degree] +
			[education-white].[Estimate; Male: - Associate's degree] + 
			[education-white].[Estimate; Male: - Bachelor's degree] + 
			[education-white].[Estimate; Male: - Some college, no degree] 
			AS 'Edu - White - College'
		,[education-white].[Estimate; Female: - Graduate or professional degree] +
			[education-white].[Estimate; Male: - Graduate or professional degree]
			AS 'Edu - White - Postgrad'
		,[med-income].[HD01_VD01] AS 'Median Household Income'
		,[med-income-white].[Estimate; Median household income in the past 12 months (in 2013] AS 'MHI - White'
		,[med-income-black].[Estimate; Median household income in the past 12 months (in 2013] AS 'MHI - Black'
		,[med-income-indian].[Estimate; Median household income in the past 12 months (in 2013] AS 'MHI - Am. Indian'
		,[med-income-asian].[med-inc-asian] AS 'MHI - Asian'
		,[med-income-latino].[Estimate; Median household income in the past 12 months (in 2013] AS 'MHI - Latino'
	  
FROM [ESE].[dbo].[demo], 
	[ESE].[dbo].[education-white],
	[ESE].[dbo].[med-income-asian],
	[ESE].[dbo].[med-income],
	[ESE].[dbo].[med-income-white],
	[ESE].[dbo].[med-income-black],
	[ESE].[dbo].[med-income-latino],
	[ESE].[dbo].[med-income-indian]

WHERE 
	[demo].[GEO#ID] = [education-white].[id]
	AND [demo].[Geo#id] = [med-income].[GEO#id]
	AND [demo].[Geo#id] = [med-income-asian].[geo#id] 
	AND [demo].[geo#id] = [med-income-white].[id]
	AND [demo].[GEO#ID] = [med-income-black].[id] 
	AND [demo].[GEO#id] = [med-income-latino].[id]
	AND [demo].[GEO#id] = [med-income-indian].[id]

ORDER BY [demo].GEO#id2