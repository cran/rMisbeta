\name{RobMeanVar}
\alias{RobMeanVar}
\title{This function estimates the robust mean and variance using beta-divergence method to reconstruct the data matrix.}

\description{The RobMeanVar() function estimates the robust mean and variance using beta-divergence method. If the gene expression
             data corrupted with outliers or missing values then this function calculates the robust mean for the corresponding outliers or missing gene vector
             and if the gene expression data does not contain outliers or missing values then it calculates the classical mean and variance.The beta-weight
			 function confirms that, the data contain outliers or not. The larger weights indicate the good data points and the smaller weights (near to zero)
			 indicates the outlying data points.}
\usage{
RobMeanVar(xx)
}

\arguments{
  \item{xx}{xx denotes a vector of data matrix with missing values or outliers.}
}

\value{This function returns a data frame containing eight components
    \item{xx}{ Reconstructed data matrix by updating outlying or missing values using robust mean.}
    \item{mu }{Robust mean vector produced by beta-divergence method.}
    \item{Var}{Robust variance produced by beta-divergence method.}
	\item{sd}{Robust standard deviation sqrt(Var) produced by beta-divergence method.}
    \item{out}{Outlying indices produced by function RobMeanVar() using beta-divergence method.}
	\item{Wt}{Weights of the each data points produced by beta-divergence method using weight function.}
	\item{Wt.out}{Weights of the Outlier data points produced by beta-divergence method.}
	\item{out.Thr}{Outliers threshold.}
}
\references{Shahjaman M, Mollah MHM, Rahman MR, Islam SSM and Mollah NHM. Robust identification of differentially expressed genes from RNA-seq data.
 Genomics 2020; 112(2): 2000:2010.}

\author{Md.Shahjaman and Md.Nurul Haque Mollah; shahjaman_brur@yahoo.com}

\examples{
nG=1000
n1=n2=5
Simdat=Sim2Group(nG,n1,n2,var0=0.1,pde=0.1) 
xx=Simdat$outmat
Datao=xx
cl=rep(c(1,2),each=n1)
MisOutdat<-OutMisDat(xx,pctOut=0.1,pctMis=0.1)
res=remat(MisOutdat,cl)
betawt<-res$betawt
plot(betawt)
}










