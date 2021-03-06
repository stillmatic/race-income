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
		/*,[demo].[HD01_VD06] AS 'Pop - PacIsl'*/
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
		,[english-White].[Estimate; Native: - Speak only English] 
			+ [english-White].[Estimate; Native: - Speak another language - Speak English "very]
			+ [english-White].[Estimate; Foreign born: - Speak only English] 
			+ [english-White].[Estimate; Foreign born: - Speak another language - Speak English]
			AS 'Eng - White - Good'
		,[english-White].[Estimate; Total:] - [english-White].[Estimate; Native: - Speak only English] 
			- [english-White].[Estimate; Native: - Speak another language - Speak English "very]
			- [english-White].[Estimate; Foreign born: - Speak only English] 
			- [english-White].[Estimate; Foreign born: - Speak another language - Speak English]
			AS 'Eng - White - Bad'
		/*,[english-Asian].[Estimate; Native: - Speak only English] 
			+ [english-Asian].[Estimate; Native: - Speak another language - Speak English "very]
			+ [english-Asian].[Estimate; Foreign born: - Speak only English] 
			+ [english-Asian].[Estimate; Foreign born: - Speak another language - Speak English]
			AS 'Eng - Asian - Good'
		,[english-Asian].[Estimate; Total:] - [english-Asian].[Estimate; Native: - Speak only English] 
			- [english-Asian].[Estimate; Native: - Speak another language - Speak English "very]
			- [english-Asian].[Estimate; Foreign born: - Speak only English] 
			- [english-Asian].[Estimate; Foreign born: - Speak another language - Speak English]
			AS 'Eng - Asian - Bad'
		,[english-Indian].[Estimate; Native: - Speak only English] 
			+ [english-Indian].[Estimate; Native: - Speak another language - Speak English "very]
			+ [english-Indian].[Estimate; Foreign born: - Speak only English] 
			+ [english-Indian].[Estimate; Foreign born: - Speak another language - Speak English]
			AS 'Eng - AmInd - Good'
		,[english-Indian].[Estimate; Total:] - [english-Indian].[Estimate; Native: - Speak only English] 
			- [english-Indian].[Estimate; Native: - Speak another language - Speak English "very]
			- [english-Indian].[Estimate; Foreign born: - Speak only English] 
			- [english-Indian].[Estimate; Foreign born: - Speak another language - Speak English]
			AS 'Eng - AmInd - Bad'*/
		,[english-Latino].[Estimate; Native: - Speak only English] 
			+ [english-Latino].[Estimate; Native: - Speak another language - Speak English "very]
			+ [english-Latino].[Estimate; Foreign born: - Speak only English] 
			+ [english-Latino].[Estimate; Foreign born: - Speak another language - Speak English]
			AS 'Eng - Latino - Good'
		,[english-Latino].[Estimate; Total:] - [english-Latino].[Estimate; Native: - Speak only English] 
			- [english-Latino].[Estimate; Native: - Speak another language - Speak English "very]
			- [english-Latino].[Estimate; Foreign born: - Speak only English] 
			- [english-Latino].[Estimate; Foreign born: - Speak another language - Speak English]
			AS 'Eng - Latino - Bad'

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
	[ESE].[dbo].[edu-indian],
	[ESE].[dbo].[english-black],
	[ESE].[dbo].[english-asian],
	[ESE].[dbo].[english-white],
	[ESE].[dbo].[english-indian],
	[ESE].[dbo].[english-latino]

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
	AND [demo].[GEO#id] = [english-black].[id]
	AND [demo].[GEO#id] = [english-white].[id]
	AND [demo].[GEO#id] = [english-latino].[id]
	AND [demo].[GEO#id] = [english-asian].[id]
	AND [demo].[GEO#id] = [english-indian].[id]


ORDER BY [demo].GEO#id2