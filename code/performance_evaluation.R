### the code for the performance function
### preds is a data.frame() with rownames==the sample ID
### 1st column is the score for cases/controls (higher scores mean more case-like)
### 2nd column is the prediction of YMRS
### 3rd column is the prediction of MADRS
### 'actual' is a data.frame() of the same format as preds, but contains the
### actual values for the set to be evaluated.  Note that for the first
### column of 'actual', the true labels must be 1=case, 0=control.
evaluateBD = function(preds,actual,plot.it=TRUE){
 require(ROCR)

 ## case control performance (AUC)
 pred = prediction(preds[,1],actual[[1]])
 case_ctl_auc = performance(pred,"auc")@y.values[[1]]

 ## YMRS performance (MSE)
 ymrs_mse = mean((preds[,2]-actual[,2])^2)
 ymrs_mse_null = mean((actual[,2]-mean(actual[,2]))^2)

 ## MADRS performance (MSE)
 madrs_mse = mean((preds[,3]-actual[,3])^2)
 madrs_mse_null = mean((actual[,3]-mean(actual[,3]))^2)
 ## plot if desired
 if(plot.it){
  par(mfrow=c(1,3))
  plot(performance(pred,'tpr','fpr'),main="case/control")
  rg1 = range(c(actual[,2],preds[,2]))
  rg2 = range(c(actual[,3],preds[,3]))
  plot(actual[,2],preds[,2],main="YMRS",xlab="actual",ylab="predicted",ylim=rg1,xlim=rg1)
  abline(0,1)
  plot(actual[,3],preds[,3],main="MADRS",xlab="actual",ylab="predicted",ylim=rg2,xlim=rg2)
  abline(0,1)
  
 }

 ## format and print output
 out = c(case_control_AUC=case_ctl_auc,ymrs_mse=ymrs_mse,madrs_mse=madrs_mse)
 cat(paste("Null MSE for YMRS is",ymrs_mse_null,"\n"))
 cat(paste("Null MSE for MADRS is",madrs_mse_null,"\n"))
 print(out)
 return(out)

}

