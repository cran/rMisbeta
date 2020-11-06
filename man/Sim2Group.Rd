\name{Sim2Group}
\alias{Sim2Group}
\title{This function Sim2Group() simulates the gene expression data for two groups using one-way ANOVA model}
\description{
Generates the gene expression data using one-way ANOVA model with two groups. The variance of both group should be same and 
the percentage of the DE genes will be given}
\usage{
Sim2Group(ng, n1, n2, var0 = 0.1, pde = 0.05)
}
\arguments{
  \item{ng}{The  total number of genes to be generated.}
  \item{n1}{Number of samples in the first group.}
  \item{n2}{Number of samples in the second group.}
  \item{var0}{The variance of the both group.}
  \item{pde}{The proportion of the differentially expressed(DE) genes.}
}
\value{This function returns the following components:
\item{outmat}{Simulated gene expression data for two groups.}
\item{DEtrue}{True DE index.}
}
\author{Md.Shahjaman; shahjaman_brur@yahoo.com}

\examples{
n1=10;n2=10;
nG=1000
TSimDat<-Sim2Group(ng=nG,n1,n2,var0=0.1,pde=0.1)
Simdat<-TSimDat[[1]]
TrueDE<-TSimDat[[2]]
}