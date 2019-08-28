# load library
{
  library(tidyverse)
  library(dslabs)
  library(caret) # machine learning
  library(dplyr) # data wrangling
  library(ggplot2) # data visualization
  library(dataMeta) # create description for dataset/dataframe
  library(knitr) # for simple table generator
}

# set up graphical theme
{
  ds_theme_set()
}

# import data and create data description
# Wisconsin Prognostic Breast Cancer (WPBC)
{
  wpbc = read.delim("Case_Study_1/Data/wpbc.dat",sep=",",header = F)
  var_desc = c("ID_No","Outcome","Time","mean_radius","mean_texture","mean_perimeter","mean_area",
                "mean_smoothness","mean_compactness","mean_concavity","mean_concave_point","mean_symmetry",
                "mean_fractal_dimension","se_radius","se_texture","se_perimeter","se_area",
                "se_smoothness","se_compactness","se_concavity","se_concave_point","se_symmetry",
                "se_fractal_dimension","worst_radius","worst_texture","worst_perimeter","worst_area",
                "worst_smoothness","worst_compactness","worst_concavity","worst_concave_point","worst_symmetry",
                "worst_fractal_dimension","tumor_size","lymph_node_status")
  var_type = rep(0,35)
  var_type[c(2,35)]=1
  names(wpbc) = var_desc
}

# overview about the original data set
kable(head(dat1,10),format="markdown")

# build up data dictionary
linker = build_linker(wpbc, variable_description = var_desc, variable_type = var_type)

# build up dictionary
dict = build_dict(my.data = wpbc, linker = linker, option_description = NULL, prompt_varopts = F)

# build up dataset description
data_desc = "This is data set donated by Nick Street from 1995, contain information of follow-up data for one breast cancer case. 
These are consecutive patients seen by Dr. Wolberg since 1984, and include only those cases exhibiting invasive breast cancer and no evidence of distant metastases at the time of diagnosis. 
The first 30 features are computed from a digitized image of a fine needle aspirate (FNA) of a breast mass.  
They describe characteristics of the cell nuclei present in the image. 
A few of the images can be found at http://www.cs.wisc.edu/~street/images/
"

desc_data = incorporate_attr(my.data = wpbc, data.dictionary = dict, main_string = data_desc)

# view information about data set
attributes(desc_data)

# reference source for creating description
{
  source = "https://cran.r-project.org/web/packages/dataMeta/vignettes/dataMeta_Vignette.html"
}
