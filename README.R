#!/usr/bin/env Rscript
#
# ants documentation in rmarkdown format
#
library(ggplot2)
library(shiny)
library(ggvis)
library(rmarkdown)
srcdir<-"./"
buildrmd='antstalkbuild.Rmd'
allfns<-Sys.glob("*/*Rmd")
# print(allfns) # look these over to see the organization you want
rawrmds<-c("firstslide.Rmd","background/background1.Rmd","registration/registration1.Rmd","templates/templates1.Rmd",
           "segmentation/segmentation1.Rmd","inhomogeneitycorrection/inhomogeneitycorrection1.Rmd","jlf/jlf1.Rmd",
           "evaluation/sata.Rmd","evaluation/antsvfreesurfer.Rmd","antsr/antsrdemo.Rmd",
           "discussion/discussion1.Rmd","lastslide.Rmd")
for ( x in 1:length(rawrmds) ) {
  if ( x == 1 )  cmd<-paste( "cat ",rawrmds[x]," > ",buildrmd ) else cmd<-paste( "cat ",rawrmds[x]," >> ",buildrmd )
  system(cmd)
}
render(buildrmd, clean=TRUE, "revealjs_presentation", output_file='index.html' ) 
#
# render( paste(pre,".Rmd",sep=''), clean=TRUE, "pdf_document" )
# render( paste(pre,".Rmd",sep=''), clean=TRUE, "ioslides_presentation" ) 
# render( paste(pre,".Rmd",sep=''), clean=TRUE, "beamer_presentation" ) 
#
