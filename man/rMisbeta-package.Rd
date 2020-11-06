\name{rMisbeta-package}
\alias{rMisbeta-package}
\docType{package}
\title{A Robust Missing Imputation Method for Gene Expression and Metabolomics Data Analysis}
\description{We developed a robust missing value imputation approach for gene expression and metabolomics data analysis using 
			 minimum beta-divergence method. This approach capable of handling both missing values and outliers, simultaneously.}
\details{
  \tabular{ll}{
        Package: \tab rMisbeta\cr
        Type: \tab Package\cr
        Version: \tab 1.0\cr
        Date: \tab 2020-10-03\cr
        License: \tab GPL (>=2.0)\cr
    }
	
	Package rMisbeta has the six following functions:
    \tabular{ll}{
	Sim2Group(): \tab This function generates the data from the one way ANOVA model for two groups.\cr
	OutMisDat(): \tab This function returns the outliers and missing value incorporated data.\cr
	CalcMeanVar(): \tab This function calculates the robust mean and variance from the the matrix in presence \cr\tab
                		of outliers and missing values for function RobMeanVar().\cr
	RobMeanVar(): \tab This function calculates the robust mean and variance from the the matrix in presence \cr\tab
                	   of outliers and missing values. The function RobMeanVar() also produces a \cr\tab
					   weight called beta-weights for each of the values to detect the outliers in the dataset.\cr
	remat(): \tab This function returns reconstructed data matrix by modifying the outliers and missing value \cr\tab
	              using beta divergence method.\cr					
						
    performance.eval(): \tab This is the performance evaluation function. Which calculates TPR,TNR,FPR,PNR,AUC\cr\tab
                        	 etc. as a measure of performance index.\cr	
     
	
	   
    }
}
\author{Md Shahjaman and Md. Nurul Haque Mollah; Maintainer: Md Shahjaman, shahjaman_brur@yahoo.com}

\examples{
nG=1000
n1=n2=5
pde=0.1
Simdat=Sim2Group(nG,n1,n2,var0=0.1,pde=0.1) 
xx=Simdat$outmat
TrueDE=Simdat$DEtrue
MisOutdat<-OutMisDat(xx,pctOut=0.1,pctMis=0.1)
misdat_zero<-MisOutdat
misdat_zero[is.na(misdat_zero)]<-0
cl=rep(c(1,2),each=n1)

res=remat(MisOutdat,cl)
up_mat<-res$remat


pTtest_zero<-pTtest_beta<-NULL
for (j1 in 1:dim(xx)[1])
{
DataYY <- data.frame(YY =misdat_zero[j1,], FactorLevels = factor(cl))
DataYY2 <- data.frame(YY2=up_mat[j1,], FactorLevels2 = factor(cl))
pTtest_zero[j1] <-  t.test(YY~FactorLevels,data=DataYY, paired=FALSE)[[3]]
pTtest_beta[j1] <-  t.test(YY2~FactorLevels2,data=DataYY2, paired=FALSE)[[3]]
} 

TopDEn<-seq(nG*pde/10, pde*nG, length=10)

performance_zero<-performance.eval(pTtest_zero,TrueDE,TopDEn,decreasing=FALSE);
performance_beta<-performance.eval(pTtest_beta,TrueDE,TopDEn,decreasing=FALSE);
plot(performance_zero$FPR,performance_zero$TPR,type="o",
xlab="False Positive Rate",ylab="True Positive Rate",ylim=c(0,1))
points(performance_beta$FPR,performance_beta$TPR,type="o",col=2)
legend("bottomright", c('t_test_zero','t_test_rMisbeta'),lwd=1,cex=0.8,col=c(1,2))
}
