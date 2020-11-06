\name{performance.eval}
\alias{performance.eval}
\title{This function estimates the different performance indices like, TPR,TNR,FPR,FNR,AUC etc. for number of top genes}
\description{
This function estimates the different performance indeces,like TPR,TNR,FPR,FNR,AUC etc. to asses the performance of the method
}
\usage{
performance.eval(PostP, de.true, TopG, decreasing = TRUE)
}
\arguments{
  \item{PostP}{p-values should be given to identify the different performance index.}
  \item{de.true}{The true DE information should be given to calculates the performance index.}
  \item{TopG}{How many Top DE genes will be used to calculate the performance indices.}
  \item{decreasing}{Is the p-values decreasing or increasing order.}
}

\value{The following performance indices are produced by performance.eval():
\item{TP}{Number of True positive.}
\item{TN}{Number of True negative.}
\item{FP}{Number of False positive.}
\item{FN}{Number of False negative.}
\item{R1}{Specificity.}
\item{TPR}{True positive rate.}
\item{TNR}{True negative rate.}
\item{FPR}{False positive rate.}
\item{FNR}{False negative rate.}
\item{FDR}{False discovery rate.}
\item{ER}{Error rate.}
\item{AUC2}{Area under the curve of ROC.}
\item{pAUC2}{Partial Area under the curve of ROC with FDR controlled at 0.2.}
}
\author{Md.Shahjaman and Md. Nurul Haque Mollah shahjaman_brur@yahoo.com}

\examples{
# Performance evaluation in presence of outliers and missing values
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









