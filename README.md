Instructions for Running the Data Visualization Web Application

**Requirements:**
1) R Version: Ensure you have R installed, preferably version 4.3.0 or higher.
2) Required Packages: Make sure to install the necessary packages before running the application.
   
**Steps:**
1) Download and Install R:
      If you haven't already, download and install R from the official website. Ensure you have version 4.3.0 or above installed.
2) Clone or Download Repository:
      Clone the repository using Git or download and unzip the folder containing the application files.
3) Set Working Directory:
      * Open your preferred Integrated Development Environment (IDE) such as RStudio or Visual Studio Code.
      * Set the working directory to the location where the visualize.R file is located using the setwd() function.
        Example:
                setwd("Path/To/visualize.R")
4) Run the Application:
      In the console or R terminal of your IDE, execute the following command to run the application:
                shiny::runApp("visualize.R")
5) Select Data File:
      Once the application is running, you will be prompted to choose the CSV file you wish to visualize. Select the appropriate file from your system.
6) Explore Data Visualization:
      After selecting the data file, the application will generate interactive visualizations based on the data provided. Explore the visualizations to gain insights into your data.
Note: If you encounter any issues during the installation or execution process, refer to the documentation.

Feel free to adjust any details or add further instructions as needed!
