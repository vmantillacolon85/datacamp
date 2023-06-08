select * 
from Country c 

select IndicatorName 
from Indicators i 

select * 
from Indicators i 

select Year, CountryCode 
from Indicators i 
where "Year" = 1985 and CountryCode = "PRI"

select * 
from Country c 

select *
FROM Series s 

select *
FROM SeriesNotes sn 

select *
from Footnotes f 

select *
from CountryNotes cn 

select * 
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 

select i.CountryCode, ShortName, IncomeGroup, Region, LatestPopulationCensus, IndicatorName, Year, Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 

select i.CountryCode, ShortName, IncomeGroup, Region, LatestPopulationCensus, IndicatorName, Year, Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 

select i.CountryCode, ShortName, IncomeGroup, Region, LatestPopulationCensus, IndicatorName, Year, Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode
where IndicatorName = 'Birth rate, crude (per 1,000 people)'


(NER
UGA
TCD
AGO
MLI)

--------------------------------------
--1.  What countries have the highest percentage of people age 0-14 years in 2014?"

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Population, ages 0-14 (% of total)' and i.Year = 2014
group by i.CountryCode
order by Value desc
limit 5

--2.  What countries have the highest percentage of people age 15-64 years in 2014?"


select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Population, ages 15-64 (% of total)' and i.Year = 2014
group by i.CountryCode
order by Value desc
limit 5

--
--3.  What countries have the highest percentage of people ages 65 and above in 2014?"


select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Population ages 65 and above (% of total)' and i.Year = 2014
group by i.CountryCode
order by Value desc
limit 5

------

/* 4.  What is the total population in the top 5 countries with the youngest population? */

-- in 2014
select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Population, total' and i.Year = 2014 and i.CountryCode IN ('NER',
'UGA',
'TCD',
'AGO',
'MLI')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years 

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Population, total' and i.CountryCode IN ('NER',
'UGA',
'TCD',
'AGO',
'MLI')
group by i.CountryCode, Year
order by Value DESC


--or comparing the top 2 in each of the three categories

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Population, total' and i.CountryCode IN ('NER',
'UGA',
'ARE',
'QAT',
'JPN',
'ITA')
group by i.CountryCode, Year
order by Value DESC



--5.  What is the total population of the top 5 countries with people 15-64?


--in 2014

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Population, total' and i.Year = 2014 and i.CountryCode IN (
'ARE',
'QAT',
'MAC',
'BHR',
'OMN')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Population, total' and i.CountryCode IN (
'ARE',
'QAT',
'MAC',
'BHR',
'OMN')
group by i.CountryCode, Year
order by Value DESC


--6.  What is the total population of the top 5 counries with people 65 and above?

--in 2014

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Population, total' and i.Year = 2014 and i.CountryCode IN (
'JPN',
'ITA',
'DEU',
'GRC',
'PRT')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years 

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Population, total' and i.CountryCode IN (
'JPN',
'ITA',
'DEU',
'GRC',
'PRT')
group by i.CountryCode, Year
order by Value DESC

---------


--7. What is the total GDP per capita in the top 5 countries with the youngest population? */

--with year 2014

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'GDP per capita (current US$)' and i.Year = 2014 and i.CountryCode IN ('NER',
'UGA',
'TCD',
'AGO',
'MLI')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'GDP per capita (current US$)' and i.CountryCode IN ('NER',
'UGA',
'TCD',
'AGO',
'MLI')
group by i.CountryCode, Year
order by Value DESC



--8.  What is the total GDP per capita of the top 5 countries with people 15-64?

--with year 2014

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'GDP per capita (current US$)' and i.Year = 2014 and i.CountryCode IN (
'ARE',
'QAT',
'MAC',
'BHR',
'OMN')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'GDP per capita (current US$)' and i.CountryCode IN (
'ARE',
'QAT',
'MAC',
'BHR',
'OMN')
group by i.CountryCode, Year
order by Value DESC

--9.  What is the total GDP per capita of the top 5 counries with people 65 and above?

--in 2014

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'GDP per capita (current US$)' and i.Year = 2014 and i.CountryCode IN (
'JPN',
'ITA',
'DEU',
'GRC',
'PRT')
group by i.CountryCode, Year
order by Value DESC


--or  throughout the years

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'GDP per capita (current US$)'  and i.CountryCode IN (
'JPN',
'ITA',
'DEU',
'GRC',
'PRT')
group by i.CountryCode, Year
order by Value DESC

------------------
--10.  What is the total population growth in the top 5 countries with the youngest population? */

--in 2014

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Population growth (annual %)' and i.Year = 2014 and i.CountryCode IN ('NER',
'UGA',
'TCD',
'AGO',
'MLI')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years 

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Population growth (annual %)' and i.CountryCode IN ('NER',
'UGA',
'TCD',
'AGO',
'MLI')
group by i.CountryCode, Year
order by Value DESC



--11.  What is the total population growth of the top 5 countries with people 15-64?


--in 2014

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Population growth (annual %)' and i.Year = 2014 and i.CountryCode IN (
'ARE',
'QAT',
'MAC',
'BHR',
'OMN')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years 

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Population growth (annual %)' and i.CountryCode IN (
'ARE',
'QAT',
'MAC',
'BHR',
'OMN')
group by i.CountryCode, Year
order by Value DESC



--12.  What is the total population growth of the top 5 counries with people 65 and above?

--in 2014

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Population growth (annual %)' and i.Year = 2014 and i.CountryCode IN (
'JPN',
'ITA',
'DEU',
'GRC',
'PRT')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years


select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Population growth (annual %)'  and i.CountryCode IN (
'JPN',
'ITA',
'DEU',
'GRC',
'PRT')
group by i.CountryCode, Year
order by Value DESC

------------------

--13. What is the total mobile cellular subscriptions in the top 5 countries with the youngest population? */

--in 2014

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Mobile cellular subscriptions' and i.Year = 2014 and i.CountryCode IN ('NER',
'UGA',
'TCD',
'AGO',
'MLI')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years 

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Mobile cellular subscriptions' and i.CountryCode IN ('NER',
'UGA',
'TCD',
'AGO',
'MLI')
group by i.CountryCode, Year
order by Value DESC



--14.  What is the total mobile cellular subscriptions of the top 5 countries with people 15-64?


--in 2014

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Mobile cellular subscriptions' and i.Year = 2014 and i.CountryCode IN (
'ARE',
'QAT',
'MAC',
'BHR',
'OMN')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years 

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Mobile cellular subscriptions' and i.CountryCode IN (
'ARE',
'QAT',
'MAC',
'BHR',
'OMN')
group by i.CountryCode, Year
order by Value DESC



--15.  What is the total mobile cellular subscriptions of the top 5 counries with people 65 and above?

--in 2014

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Mobile cellular subscriptions' and i.Year = 2014 and i.CountryCode IN (
'JPN',
'ITA',
'DEU',
'GRC',
'PRT')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years


select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Mobile cellular subscriptions'  and i.CountryCode IN (
'JPN',
'ITA',
'DEU',
'GRC',
'PRT')
group by i.CountryCode, Year
order by Value DESC

-----


--16. What is the total urban population in the top 5 countries with the youngest population? */

--in 2014
--can use urban population or Urban population (% of total) or Urban population growth (annual %)

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Urban population' and i.Year = 2014 and i.CountryCode IN ('NER',
'UGA',
'TCD',
'AGO',
'MLI')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years 

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Urban population' and i.CountryCode IN ('NER',
'UGA',
'TCD',
'AGO',
'MLI')
group by i.CountryCode, Year
order by Value DESC



--17.  What is the total urban population of the top 5 countries with people 15-64?


--in 2014
--can use urban population or Urban population (% of total) or Urban population growth (annual %)

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Urban population' and i.Year = 2014 and i.CountryCode IN (
'ARE',
'QAT',
'MAC',
'BHR',
'OMN')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years 

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Urban population' and i.CountryCode IN (
'ARE',
'QAT',
'MAC',
'BHR',
'OMN')
group by i.CountryCode, Year
order by Value DESC



--18.  What is the total urban population of the top 5 counries with people 65 and above?

--in 2014
--can use urban population or Urban population (% of total) or Urban population growth (annual %)

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Urban population' and i.Year = 2014 and i.CountryCode IN (
'JPN',
'ITA',
'DEU',
'GRC',
'PRT')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years


select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Urban population'  and i.CountryCode IN (
'JPN',
'ITA',
'DEU',
'GRC',
'PRT')
group by i.CountryCode, Year
order by Value DESC


-----------------------

--19. What is the total rural population in the top 5 countries with the youngest population? */

--in 2014
--can use rural population or rural population (% of total) or rural population growth (annual %)

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Rural population' and i.Year = 2014 and i.CountryCode IN ('NER',
'UGA',
'TCD',
'AGO',
'MLI')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years 

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Rural population' and i.CountryCode IN ('NER',
'UGA',
'TCD',
'AGO',
'MLI')
group by i.CountryCode, Year
order by Value DESC



--20.  What is the total rural population of the top 5 countries with people 15-64?


--in 2014
--can use rural population or rural population (% of total) or rural population growth (annual %)

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Rural population' and i.Year = 2014 and i.CountryCode IN (
'ARE',
'QAT',
'MAC',
'BHR',
'OMN')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years 

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Rural population' and i.CountryCode IN (
'ARE',
'QAT',
'MAC',
'BHR',
'OMN')
group by i.CountryCode, Year
order by Value DESC



--21.  What is the total rural population of the top 5 counries with people 65 and above?

--in 2014
--can use rural population or rural population (% of total) or rural population growth (annual %)

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Rural population' and i.Year = 2014 and i.CountryCode IN (
'JPN',
'ITA',
'DEU',
'GRC',
'PRT')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years


select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Rural population'  and i.CountryCode IN (
'JPN',
'ITA',
'DEU',
'GRC',
'PRT')
group by i.CountryCode, Year
order by Value DESC



----------------------------

--22. What is the birth rate in the top 5 countries with the youngest population? */

--in 2014--no results show for year 2014-incomplete data

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Birth rate, crude (per 1,000 people)' and i.Year = 2014 and i.CountryCode IN ('NER',
'UGA',
'TCD',
'AGO',
'MLI')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years 

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Birth rate, crude (per 1,000 people)' and i.CountryCode IN ('NER',
'UGA',
'TCD',
'AGO',
'MLI')
group by i.CountryCode, Year
order by Value DESC



--23.  What is the birth rate of the top 5 countries with people 15-64?


--in 2014--no results show for year 2014-incomplete data

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Birth rate, crude (per 1,000 people)' and i.Year = 2014 and i.CountryCode IN (
'ARE',
'QAT',
'MAC',
'BHR',
'OMN')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years 

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Birth rate, crude (per 1,000 people)' and i.CountryCode IN (
'ARE',
'QAT',
'MAC',
'BHR',
'OMN')
group by i.CountryCode, Year
order by Value DESC



--24.  What is the birth rate of the top 5 counries with people 65 and above?

--in 2014--no results show for year 2014-incomplete data

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Birth rate, crude (per 1,000 people)' and i.Year = 2014 and i.CountryCode IN (
'JPN',
'ITA',
'DEU',
'GRC',
'PRT')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years


select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Birth rate, crude (per 1,000 people)'  and i.CountryCode IN (
'JPN',
'ITA',
'DEU',
'GRC',
'PRT')
group by i.CountryCode, Year
order by Value DESC


------------------

--25. What is the fertility rate in the top 5 countries with the youngest population? */

--in 2014--no results show for year 2014-incomplete data

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Fertility rate, total (births per woman)' and i.Year = 2014 and i.CountryCode IN ('NER',
'UGA',
'TCD',
'AGO',
'MLI')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years 

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Fertility rate, total (births per woman)' and i.CountryCode IN ('NER',
'UGA',
'TCD',
'AGO',
'MLI')
group by i.CountryCode, Year
order by Value DESC



--26.  What is the fertility rate of the top 5 countries with people 15-64?


--in 2014--no results show for year 2014-incomplete data

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Fertility rate, total (births per woman)' and i.Year = 2014 and i.CountryCode IN (
'ARE',
'QAT',
'MAC',
'BHR',
'OMN')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years 

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Fertility rate, total (births per woman)' and i.CountryCode IN (
'ARE',
'QAT',
'MAC',
'BHR',
'OMN')
group by i.CountryCode, Year
order by Value DESC



--27.  What is the birth rate of the top 5 counries with people 65 and above?

--in 2014--no results show for year 2014-incomplete data

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Fertility rate, total (births per woman)' and i.Year = 2014 and i.CountryCode IN (
'JPN',
'ITA',
'DEU',
'GRC',
'PRT')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years


select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Fertility rate, total (births per woman)'  and i.CountryCode IN (
'JPN',
'ITA',
'DEU',
'GRC',
'PRT')
group by i.CountryCode, Year
order by Value DESC


------------------
--25. What is the life expectancy at birth in the top 5 countries with the youngest population? */

--in 2014--no results show for year 2014-incomplete data

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Life expectancy at birth, total (years)' and i.Year = 2014 and i.CountryCode IN ('NER',
'UGA',
'TCD',
'AGO',
'MLI')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years 

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Life expectancy at birth, total (years)' and i.CountryCode IN ('NER',
'UGA',
'TCD',
'AGO',
'MLI')
group by i.CountryCode, Year
order by Value DESC



--26.  What is the life expectancy at birth of the top 5 countries with people 15-64?


--in 2014--no results show for year 2014-incomplete data

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Life expectancy at birth, total (years)' and i.Year = 2014 and i.CountryCode IN (
'ARE',
'QAT',
'MAC',
'BHR',
'OMN')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years 

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Life expectancy at birth, total (years)' and i.CountryCode IN (
'ARE',
'QAT',
'MAC',
'BHR',
'OMN')
group by i.CountryCode, Year
order by Value DESC



--27.  What is the life expectancy at birth of the top 5 counries with people 65 and above?

--in 2014--no results show for year 2014-incomplete data

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Life expectancy at birth, total (years)' and i.Year = 2014 and i.CountryCode IN (
'JPN',
'ITA',
'DEU',
'GRC',
'PRT')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years


select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Life expectancy at birth, total (years)'  and i.CountryCode IN (
'JPN',
'ITA',
'DEU',
'GRC',
'PRT')
group by i.CountryCode, Year
order by Value DESC

----------------

--28. What is the percentage of working age people in the top 5 countries with the youngest population? */

--in 2014--no results show for year 2014-incomplete data

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Age dependency ratio (% of working-age population)' and i.Year = 2014 and i.CountryCode IN ('NER',
'UGA',
'TCD',
'AGO',
'MLI')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years 

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Age dependency ratio (% of working-age population)' and i.CountryCode IN ('NER',
'UGA',
'TCD',
'AGO',
'MLI')
group by i.CountryCode, Year
order by Value DESC



--29.  What is the percentage of working age people of the top 5 countries with people 15-64?


--in 2014--no results show for year 2014-incomplete data

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Age dependency ratio (% of working-age population)' and i.Year = 2014 and i.CountryCode IN (
'ARE',
'QAT',
'MAC',
'BHR',
'OMN')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years 

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Age dependency ratio (% of working-age population)' and i.CountryCode IN (
'ARE',
'QAT',
'MAC',
'BHR',
'OMN')
group by i.CountryCode, Year
order by Value DESC



--30.  What is the percentage of working age people of the top 5 counries with people 65 and above?

--in 2014--no results show for year 2014-incomplete data

select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Age dependency ratio (% of working-age population)' and i.Year = 2014 and i.CountryCode IN (
'JPN',
'ITA',
'DEU',
'GRC',
'PRT')
group by i.CountryCode, Year
order by Value DESC

--or throughout the years


select i.CountryCode, Shortname, IncomeGroup, Region, IndicatorName, i.Year, AVG(i.value) as Value
from Country c 
join Indicators i 
on c.CountryCode = i.CountryCode 
where IndicatorName = 'Age dependency ratio (% of working-age population)'  and i.CountryCode IN (
'JPN',
'ITA',
'DEU',
'GRC',
'PRT')
group by i.CountryCode, Year
order by Value DESC





