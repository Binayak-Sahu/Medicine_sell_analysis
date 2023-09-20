# Medicine_sell_analysis
The process involves the acquisition of data from online sources, followed by the utilization of the pandas library to preprocess and refine the collected data. Subsequently, an examination of the data pertaining to two competing pharmaceutical businesses is conducted using Excel and SQL.

1. What data checks will you apply on the given datasets?

   INITIAL CHECK:    While Checking the Data we need to check the following:
    - Find the number of rows and columns (.shape)
    - Datatypes of columns (.dtypes)
    - Checking for nan values (.isnan().sum())
    - Check for duplicate values (is_unique())

    FINAL CHECK: While Checking the Data we need to check the following:
    - There were duplicate data from all 3 datasets. So, we have cleaned and deleted them
    - In dataset, 'Specialty' column some of the specialities were not specified. So, it is replaced with 'Not Specified'.
    - There were 2 missing values in 2 rows in Affiliation' dataset. We have deleted them and updated the dataset in this and as well as in 'Physician_Level_Data'
    - In the Affiliation' dataset, the Hospital Zip column was object type. So, we have changed into int64.
    - There were no structural issues.
  
2. Plot a graph showing the sales of both the given products over months.

    - Sales of Fludara has been increasing opter the entire period, but the sales of Mercapto decreased first in the month of februarythen started increasing.
    - After february, sales of Mercapto has been increasing at a higher rate than the sales of Fludara.
    - It can be observed that the sales of both the medicines soared during the summer season.
    - Also the total sales of the medicines has been increasing throughout the period.
