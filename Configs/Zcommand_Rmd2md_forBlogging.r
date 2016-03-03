# R file to make md and add file with date for blog

## Set-up:  extract filename
f<-commandArgs(trailingOnly=TRUE)[1]


# STEP 1
## make md file
knitr::knit(f)

## STEP 2: add todays date to name so it shows up in blog (jekyll)

#1. remove .Rmd from filename
 f_stub<-strsplit(f, split="\\.")[[1]][1]

# 2. paste .md extension on to refer to the file generated by knitr
 f_md<-paste(f_stub, ".md", sep="")

# 3. extract today's date
Today<-strsplit(as.character(Sys.time()),split=" ")[[1]][1]

# paste today's date to stub
 date_f_md<-paste(Today, f_md,sep="-")

# check
print(date_f_md)

# rename .md file (comment me out to check things without the risk of overwriting a file)
file.rename(f_md, date_f_md)