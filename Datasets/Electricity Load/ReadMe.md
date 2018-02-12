Data Set Information: https://archive.ics.uci.edu/ml/datasets/ElectricityLoadDiagrams20112014#

Data set has no missing values. 
Values are in kW of each 15 min. To convert values in kWh values must be divided by 4. 
Each column represent one client. Some clients were created after 2011. In these cases consumption were considered zero. 
All time labels report to Portuguese hour. However all days present 96 measures (24*15). Every year in March time change day (which has only 23 hours) the values between 1:00 am and 2:00 am are zero for all points. Every year in October time change day (which has 25 hours) the values between 1:00 am and 2:00 am aggregate the consumption of two hours. 



Attribute Information:

Data set were saved as txt using csv format, using semi colon (;). 
First column present date and time as a string with the following format 'yyyy-mm-dd hh:mm:ss' 
Other columns present float values with consumption in kW 

