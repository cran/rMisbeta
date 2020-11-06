\name{OutMisDat}
\alias{OutMisDat}
\title{This function allows user's to add outliers and missing values in the original dataset}

\description{OutMisDat() function returns the outliers and missing value incorporated data. The percentages of outliers and missing values can be 
            provided by the users. If pctOut and pctMis both are provided 0 then this function returns the original dataset}
\usage{
OutMisDat(xx,pctOut,pctMis)
}

\arguments{
  \item{xx}{xx denotes a vector of data matrix.}
  \item{pctOut}{percentage of outliers defined by user.}
  \item{pctMis}{percentage of missing values defined by user.}
}

\value{This function returns the outlier and missing incorporated data matrix
    \item{Datao}{a dataset corrupted by Outlier and missing value}

}
\references{Shahjaman M, Mollah MHM, Rahman MR, Islam SSM and Mollah NHM. Robust identification of differentially expressed genes from RNA-seq data.
 Genomics 2020; 112(2): 2000:2010.}

\author{Md.Shahjaman; shahjaman_brur@yahoo.com}

\examples{
nG=1000
n1=n2=5
Simdat=Sim2Group(nG,n1,n2,var0=0.1,pde=0.1) 
xx=Simdat$outmat
Datao=xx
MisOutdat<-OutMisDat(xx,pctOut=0.1,pctMis=0.1)
}











