\name{CalcMeanVar}
\alias{CalcMeanVar}
\title{This function estimates the robust mean and variance using beta-divergence method.}

\description{The CalcMeanVar() function estimates the robust mean and variance using beta-divergence method for RobMeanVar () function. The beta-weight
			 function confirms that is the data contain outliers or not.The larger weights indicate the good data points and the smaller weights (near to zero)
			 indicates the outlying data points.}
\usage{
CalcMeanVar(xx,Mo)
}

\arguments{
  \item{xx}{xx denotes a vector of data matrix.}
   \item{Mo}{Mo denotes median of xx.}
}

\value{This function returns a data frame containing 3 components
    \item{MM }{Robust mean vector produced by beta-divergence method.}
    \item{VV}{Robust variance produced by beta-divergence method.}
	\item{WW}{Weights of the each data points produced by beta-divergence method using weight function.}
}
\references{Shahjaman M, Mollah MHM, Rahman MR, Islam SSM and Mollah NHM. Robust identification of differentially expressed genes from RNA-seq data.
 Genomics 2020; 112(2): 2000:2010.}

\author{Md.Shahjaman and Md. Nurul Haque Mollah shahjaman_brur@yahoo.com}

\examples{
nG=1000
n1=n2=5
Simdat=Sim2Group(nG,n1,n2,var0=0.1,pde=0.1) 
xx=Simdat$outmat
Datao=xx
cl=rep(c(1,2),each=n1)
MisOutdat<-OutMisDat(xx,pctOut=0.1,pctMis=0.1)
res=remat(MisOutdat,cl)
up_mat<-res$remat

}











