# Cyclistic Bike Share Case Study

## Introduction
This case study is a part of the Google Data Analytics Certificate specialization. I believe it will help me in strengthening my data analysis skills as I will be using different tools that I have learned from this specialization in addition to other courses on a real-world dataset and a real scenario.I will use these steps in my data analysis process: Ask, Prepare,
Process, Share and Act


## Background
The case study is about a fictional bike share company called “Cyclistic” based in Chicago that has been operating since 2016 and has grown to own 5,824 bikes across 692 stations. They have two types of riders: casual riders that use the service for one ride or full-day, and annual riders who are Cyclistic members. The company’s financial department has found that annual members are more profitable, and the marketing team, led by Moreno, sees an opportunity to convert casual riders into Cyclistic’s annual members as they are already familiar with Cyclistic services.

## Ask
### Key Business Tasks
The goal is to create a marketing strategy to increase the number of Cyclistic annual members by targeting casual riders. As a junior data analyst on the marketing team, I have been tasked with analyzing Cyclistic's historical data from the last 12 months to identify trends and patterns. Using this analysis, I will provide professional visuals, insights, and recommendations to inform marketing strategies.

### Business Questions
I will address the following key questions:
- How do annual members and casual riders use Cyclistic bikes differently?
- Why would casual riders be incentivized to purchase Cyclistic annual memberships?
- How can Cyclistic leverage social media to influence casual riders to become annual members?

### Key Stakeholders
- **Lily Moreno**: the director of the marketing department and my boss.
- **Cyclistic Executive Team**: who will decide whether or not to approve the recommended marketing program.

## Prepare
For this case study, I will be using Cyclistic historical trip data from Jan 2023 to Dec 2023, which has been made available by Motivate International Inc. under the license. The data is stored in 12 CSV files, one for each month. Each file contains 13 columns which are:

- `ride_id`: ID for each ride
- `rideable_type`: Type of bikes used (electric_bike, classic_bike, docked_bike)
- `started_at`: The timestamp when the ride started
- `ended_at`: The timestamp when the ride ended
- `start_station_name`: Name of station where the bike is unlocked
- `start_station_id`: The start station ID
- `end_station_name`: Name of station where the bike is locked
- `end_station_id`: The end station ID
- `start_lat`: Start latitude
- `start_lng`: Start longitude
- `end_lat`: End latitude
- `end_lng`: End longitude
- `member_casual`: Type of the rider

## Process
Given that the dataset contains over 2,000,000 rows, Excel isn’t suited to handle it efficiently. Instead, we chose Microsoft SQL Server for data manipulation, as it is built to manage and process large datasets effectively.

### 1) Data Combining
The data was initially spread across multiple Excel files, so we needed to consolidate them in Microsoft SQL Server. To start, we created a database named “Cyclistic_data” and imported all 12 Excel files into this database. Next, we created a staging table called “CyclisticStagingTable” to merge the data from all 12 files into one comprehensive table. This approach enabled efficient management and analysis of the data as a single, unified dataset.

### Data Exploration
Before analyzing the data, we need to familiarize ourselves with it. Our data contains 13 columns with the `ride_id` as the unique column, which is our primary key, and 5,719,877 records. We did the following steps to ensure our data is ready for analysis:

#### Duplicated Values
We first checked for duplicates using `ride_id` as it has unique values:
- We found no duplicates in the data.

#### Null Values
We found null values in several columns that needed to be removed:
- 875,716 nulls in `start_station_name`
- 875,848 in `start_station_id`
- 929,202 in `end_station_name`
- 929,343 in `end_station_id`
- 6,990 in each of `end_lat`, `end_lng`

#### Distinct Values
In column `rideable_type`, we have three types of bikes: Classic bike, Electric bike, and Docked bike, and column `member_casual` has two unique values: member and casual riders.

#### Outliers
We checked for outliers that could shift our data results:
- **Less than a minute rides**: This duration is likely an anomaly, as it doesn't provide enough time for a meaningful ride.
- **More than 24 hours rides**: Such rides are also unusual, as they exceed typical usage patterns for bike rentals.

We found 6,333 rides that took more than 24 hrs. and 88,950 rides that took less than a minute. These rides were removed.

### 2) Data Cleaning
We created another table called `cyclistic_tbl` with all cleaned data by removing all null values and outliers as it’s a case study and we can’t ask the company about these anomalies. The new table also included newly created columns needed for the analysis, such as:

- `ride_length`: the length of each ride
- `day_of_week`: day number extracted from `started_at`
- `day_name`: names of the days
- `ride_month`: the month of the ride
- `month_name`: the name of months
- `ride_year`: the year of the ride

1,439,662 records were removed, and now the data is cleaned, including all necessary columns, and is ready to be analyzed.

## Data Analysis
We used SQL to analyze trends and distinguish behavioral patterns between member and casual riders. Power BI was then utilized to visualize these insights, enabling a clear and interactive presentation of the findings.

### Total Rides in 2023
The dataset includes a total of approximately 4 million rides, with 2,763,533 rides by members and 1,516,682 rides by casual riders. This breakdown equates to 64.57% member rides and 35.43% casual rides, highlighting strong engagement among members compared to casual users.

### Bike Type
Classic bikes and electric bikes are used by both member and casual riders, with electric bikes being the most used type. Docked bikes are the least used and are only used by casual riders.

### Rides Frequency by Hour
- **Member Riders**: Peak hours are between 6 AM - 10 AM and 3 PM - 7 PM, with the highest activity at 5 PM, indicating commuting patterns.
- **Casual Riders**: Increased activity throughout the day, peaking at 5 PM, suggesting leisurely usage.

### Rides Frequency and Average Duration by Day
- **Member Riders**: Ride frequency is higher on weekdays, with longer rides on weekends.
- **Casual Riders**: Ride frequency is higher on weekends, with longer ride durations on Saturdays and Sundays.

### Rides Frequency and Average Duration by Month
- **Summer**: Both groups ride more frequently with longer durations.
- **Winter**: Lower ride frequency and shorter durations.

### Average Ride Duration
- **Casual Riders**: Average ride duration is 23.04 minutes, indicating leisure usage.
- **Member Riders**: Average ride duration is 12.28 minutes, suggesting routine trips.

### Top Stations
This visual shows the top 5 bike stations for member and casual riders:
- **Clark St & Elm St**: Top station for members.
- **Streeter Dr & Grand Ave**: Top station for casual riders.

## Share
Connecting Power BI to Microsoft SQL enabled a direct and efficient way to access and visualize cleaned data, ensuring data accuracy and consistency across reports.
## Conclusion 
The main goal of this case study was to create a marketing strategy in order to encourage casual riders to convert to annual subscription which will increase the company revenues. Through our data analysis we dicovered patterns and trends in the behviour of casual riders that helped us in counstructing our recommendation and by applying these recommendations our goal will be met.
## Things I learned through this case study
- This was my first experience working with a dataset of over 4 million rows. I successfully combined multiple files using Microsoft SQL Server, which helped me develop my skills in handling large volumes of data.
- After merging the datasets, I focused on cleaning the data to ensure its accuracy and usability. This process deepened my understanding of data quality and preparation.
- I then connected the cleaned data to Power BI, where I created a simple and user-friendly dashboard. Utilizing DAX for calculations and measures, I was able to provide valuable insights through visualizations.
