# The Squirrel Cafe: Predicting Winter Weather Conditions
This project showcases the nut consumption of eurasian red squirrels (Sciurus vulgaris) at The Squirrel Cafe in Ahrensburg, Germany.

To use the Shiny app of The Squirrel Cafe, visit my [shinyapps.io]() page.

This project was completed by [Anna M. Kot](https://github.com/kotanna) at University of New Hampshire for DATA901: Analytics Applications I (Fall 2018).

---

## Getting Started
The following instructions will get you a copy of the project up and running on your local machine.

### System Requirements
1. Install [R](https://cran.rstudio.com/)
2. Install [RStudio](https://www.rstudio.com/products/rstudio/download3/)
3. Install R packages: `knitr`, `ProjectTemplate`  (e.g., `install.packages("knitr")`)
4. Install any R packages required for data import or listed in `config/global.dcf`

### Instructions for use

1. [Download](https://github.com/kotanna/squirrel-cafe/archive/master.zip) a zip file of the project
2. Unzip this file to an appropriate location and open the project in RStudio by clicking the `.Rproj` file 
3. Open the included RMarkdown file (i.e., `explore.Rmd`) and run the chunk `library(ProjectTemplate); load.project()` to:
    * read in the global configuration file contained in `config`
    * load R packages listed in the configuration file
    * read in datasets stored in `data` or `cache`
    * preprocess the data using the files in the `munge` directory
4. Verify the data imported correctly (you may well get errors at this point indicating that you need to install additional R packages or dependencies, if so, install these)

You're now ready to start manipulating and analyzing the data, already fully preprocessed.

### General Tips

* **Data sets:** If you need to use additional data sets, add the data set(s) to the `data` folder for import into the project.
* **Data manipulation:** If you need to modify the imported data, put your code in an r-script in the munge directory (i.e., `munge/01-munge.R`) (e.g., add or modify a variable in a data frame; add or remove cases; merge data frames). More generally, if there are any objects that need to be accessible across multiple analyses, then put them in the munge script.
* **Data analysis**: If you are running analyses that you plan to keep, then place them in an an RMarkdown file (e.g., `explore.rmd`). For every analysis you create, put a separate file in the 'src' directory and make sure that the you have an initial chunk that just has `library(ProjecTemplate); load.project()`.
* **R Packages:** If you need to use an additional R package, add the name of this package to the `libraries` line in `config/global.dcf` rather than adding `library("packagename")` to your script.
* **Custom functions:** If you write a function to help you perform your analyses, then place it in an r script in the `lib` directory. This way it will be automatically imported everytime you run `load.project()`.

---

## Author and Acknowledgments
* [Anna M. Kot](https://github.com/kotanna) - *Initial project*
* [The Squirrel Cafe](https://www.thesquirrelcafe.com/) - *The Squirrel Cafe Data*

This project was built using [ProjectTemplate](http://projecttemplate.net/), an R package facilitating data analysis with R.

If you are interested in the data collected by The Squirrel Cafe, you can [download](https://www.thesquirrelcafe.com/app/download/11135361894/TheSquirrelCafe_data_csv.zip?t=1533748543) it from their website. The data covers the timeframe from Jul. 28, 2016 to Aug. 8, 2018.