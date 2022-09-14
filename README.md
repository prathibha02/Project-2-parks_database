# project-2
Project 2 Group 4 - National Parks

# Description

The early bird gets the worm, break a leg, beat around the bush. Idioms are wise words to carry through the walk of life, but the monkey business of data science can be summarized in an acronym: ETL. ETL this, ETL that, ETL it hard and fast. But hold your horses because what in the world is ETL? ETL stands for extract, transform and load. As the name suggests, ETL is a three-phase process in which raw data is pulled from various sources, cleaned up or updated to match the intended purposes and subsquently loaded into a database readily avaiable for use. Project 2 is a collaborative exercise in the three unique stages. This repository foucses on national parks data to create a database for hikers looking for trails based on current weather conditions.

To start, data is extracted by making calls two APIs and pulled from an online community, Kaggle. The first API is the [National Parks Service](https://www.nps.gov/subjects/developer/api-documentation.htm#/) (NPS). NPS requires users to sign up for a free API key with no limts. The parameters limit the query to national parks that are commonly visited for hiking. The calls to NPS gathers data on the park name, address and contact information as well as if the park charges a fee to enter. The second API is the [OpenWeather API](https://openweathermap.org/current). Similar to the NPS API, OpenWeather requires an API key. Originally the desired data was historical weather data, but it is not included in the free tier subscription plan. Instead of historical data, the API calls gathers current weather conditions. The third dataset comes from [Kaggle](https://www.kaggle.com/datasets/planejane/national-park-trails), which contains information on hiking trails, such as the length, difficulty and average user rating.

The next step involves transforming the extracted data. To connect the NPS and hiking trails dataset, the park code pulled from NPS is inserted as a column in the hiking trails data. The park code will allow for easier querying down the line. Next, any trails without a corresponding national park is filtered out and saved as a separate file. To ensure quality hiking, the hiking trails data is furthered filtered for only trails with an average rating of 2 or higher and reviewed at least more than 10 times. Next, the team creates and merges an aggregate summary table of the number of trails, average difficulty and average rating per national park with the NPS data. It is important to note that the hiking trails dataset is limited to about 50 national parks, resulting in zeroes in the NPS data.

The final step include loading the cleaned data into a database. Using SQLAlchemy and Pandas, the team imports the three datasets into PostgreSQL.

# Repository Description
In the opening directory of the repository, you will find two folders and one Jupyter notebook. The first folder is the 'Working' folder, which contains a 'Resources' folder with the extracted datasets as well as another folder entitled 'cleaned' with the transformed data. The 'Working' folder also contains three others entitled: 'Extract,' 'Transform,' and 'Load.' Each of those folders contains notebooks pertaining to its respective folder name. To facilitate tasks, there is a tasks folder. We created this 'Working' to clean-up the repository for easier viewing and navigation. A better approach to this is taking advantage of branch creation in GitHub. But as an artifact of group projects with short turnover periods, instead of ensuring the repository looks beautiful at all times, we allowed everyone to focus on the tasks at hand and work with their own conventions.

After everyone completed their pieces to the project, we created a 'cleaned' folder and a consolidated notebook entitled 'National_Parks' in the opening directory. The consolidated notebook takes everyone's code and flows like a story of ETL. The 'cleaned' folder contains the transformed data.

# Modules Used
    - Pandas
    - Requests
    - SQLAlchemy

# Requirements
To run the scripts, you will need the following:

    - National Parks API Key
    - OpenWeather API Key
    - PostgreSQL
