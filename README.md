# Project
This SQL script is related to a project involving human resources data. Let's break down the key components:

1. **Database and Tables:**
   - The script is using a database named `projecthr`.
   - Tables include `absenteeism`, `reasons`, and presumably `compensation`.

2. **Views:**
   - A view named `main_table_absenteeism` is created, which mirrors the data in the `absenteeism` table.
   - Another view named `HEALTHIEST` is created, filtering the 25 healthiest individuals based on certain criteria, such as not being a social drinker, not being a social smoker, having a body mass index (BMI) less than 25, and having absenteeism hours below the average.
   - The `SEASONSANDBMI` view categorizes data by BMI and seasons.

3. **Queries:**
   - The script performs a series of SELECT queries to retrieve information from the database.
   - The first query joins the `absenteeism` table with the `compensation` and `reasons` tables based on ID and the reason for absence.
   - There is a COUNT query (`TOTALNONSMOKERS`) that counts the number of non-smokers in the `absenteeism` table.
   - The script has additional queries for Power BI, extracting data related to BMI categories, seasons, and various other employee details.



