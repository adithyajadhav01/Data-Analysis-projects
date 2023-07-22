-- THE FOLLOWING CODE IS TO FIND THE NUMBER OF RECORDS PRESENT IN COVID-DEATHS AND 

SELECT COUNT(*)
FROM coviddeaths AS total_rows

SELECT count(*)
from covidvaccinations AS total_rows

-- THE FOLLOWING CODE IS to CALCULATE THE SUM, AVERAGE, MINIMUM AND MAXIMUM VALUES

SELECT location, SUM(total_cases) as sumOfCovidCases
FROM coviddeaths
GROUP BY location
ORDER BY sumOfCovidCases DESC


SELECT SUM(total_deaths) as sumOfCovidCases
FROM coviddeaths

SELECT SUM(people_fully_vaccinated) as noOfVaccinations_world
FROM coviddeaths

-- This query will give you a result set that includes the 
-- 'location', 'date', and the minimum number of COVID-19 deaths 
-- for each date in India, sorted by date in ascending order.

SELECT location, date, MIN(total_deaths) as minOfCovidDeaths
FROM coviddeaths
WHERE location = 'India'
GROUP BY date
ORDER BY minOfCovidDeaths DESC

----------------------------------------

SELECT cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations
FROM coviddeaths cd
JOIN covidvaccinations cv ON cd.location = cv.location AND cd.date = cv.date
WHERE cd.continent is NOT NULL
ORDER BY cv.new_vaccinations DESC;

-----------------------------------------

SELECT SUM(new_cases) as totalCases, SUM(new_deaths) as totalDeaths, SUM(new_deaths)/SUM(new_cases)*100 as DeathPercentage
FROM coviddeaths
WHERE continent is NOT NULL
ORDER BY 1,2;

-----------------------------------------

SELECT *
FROM coviddeaths cd
JOIN covidvaccinations cv ON cd.location = cv.location AND cd.date = cv.date

-----------------------------------------

Select location, SUM(new_deaths) as TotalDeathCount 
From coviddeaths
Where continent is null
and location not in ('World', 'European Union', 'International')
Group by location 
order by TotalDeathCount desc

-------------------------------------------

Select Location, Population,date, MAX(total_cases) as HighestInfectedPeople, Max((total_cases/population))*100 as InfectedPopulationPercentage
From coviddeaths
Group by Location, Population, date
order by InfectedPopulationPercentage desc

--------------------------------------------








