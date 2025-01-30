create database portfolioproject default character set 'utf8mb4';
use portfolioproject;

-- 1. GLOBAL NUMBERS:
code:
Select SUM(new_cases) as total_cases, SUM(convert(new_deaths, signed)) as total_deaths, SUM(convert(new_deaths, signed))/SUM(New_Cases)*100 as DeathPercentage
From PortfolioProject.CovidDeaths
where continent is not null 
order by 1,2


-- 2.PERCENT POPULATION INFECTED BY COUNTRY
code:
Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject.CovidDeaths
Group by Location, Population
order by PercentPopulationInfected desc;


-- 3.PERCENT POPULATION INFECTED
code:
Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject.CovidDeaths
Group by Location, Population, date
order by PercentPopulationInfected desc;


-- 4.Total Deaths by Location
----showing countries with highest death count per population
----To convert total_deaths into an integer, you can use the CAST orCONVERT function, depending on your SQL environment. Here the query using CONVERT to explicitly convert to an integer.
--to covert we can use cast or convert. to use convert we can use like convert(int, total_deaths)
code:
select location, MAX(CONVERT(total_deaths, SIGNED)) as totaldeathcount
from portfolioproject.coviddeaths
where continent is not null
group by location
order by totaldeathcount desc;

-- 5.Bangladesh COVID-19 Statistics: Cases and Deaths Overview
-------looking at total cases vs total deaths based on particular location
code:
select location, date, total_cases, total_deaths,  (total_deaths/total_cases)*100 as deathpercentage
from portfolioproject.coviddeaths
where location like 'bangladesh'
order by 1,2;

--6.COVID-19 Death Counts by Continent
---lets break things by continent same as the above query
--showing continents with the highest death count per population
code:
select continent, MAX(CONVERT(total_deaths, SIGNED)) as totaldeathcount
from portfolioproject.coviddeaths
where continent is not null
group by continent
order by totaldeathcount desc;
