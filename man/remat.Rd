\name{remat}
\alias{remat}
\title{Reformulated data matrix after modification of outliers and missing imputation using beta divergence method}

\description{remat() function returns reformulated data matrix by modifying the outliers and missing value using the robust mean produced by RobMeanVar(). This 
function also produces the weights of each feature. The lower weights indicate that the corresponding feature is corrupted by the outliers.}
\usage{
remat(Datao,cl)
}

\arguments{
  \item{Datao}{Datao denotes a vector of data matrix with missing values and outliers.}
  \item{cl}{Binary class level. Usually 1 and 2.}
}

\value{This function returns the following two components
    \item{remat}{reformulated data matrix after modification of outliers and imputed the missing values}
	\item{betawt}{The weights of each feature. The lower weights indicate that the corresponding feature is corrupted by the outliers}
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
cl=rep(c(1,2),each=n1)
res=remat(MisOutdat,cl)
up_mat<-res$remat
}











