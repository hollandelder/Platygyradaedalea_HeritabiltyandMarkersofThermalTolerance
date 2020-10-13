#Install packages and load them

install.packages("RColorBrewer")
install.packages('survival')
install.packages("survminer")
install.packages('tidyverse')
library(survival)
library(tidyverse)
library(survminer)
library(RColorBrewer)



#SURVIVAL ANALYSIS AND PLOTS
head(K_M_Pdae_Mortality)

K_M_Pdae_Mortality$SurvObj <- with(K_M_Pdae_Mortality, Surv(time, status == 2))
head(K_M_Pdae_Mortality)


#fits the temp data for all data and lumps them into two temperature groups
sfit_temp <- survfit(SurvObj ~ temp., data=K_M_Pdae_Mortality)
sfit_temp
summary(sfit_temp)

ggsurvplot(sfit_temp)

ggsurvplot(sfit_temp, conf.int=TRUE, pval=TRUE,  
           legend.labs=c("27C", "35.5C"), legend.title="Temperature",  
           palette=c("dodgerblue2", "firebrick2"), 
           main="Kaplan-Meier Curve for Temperature Mortality", font.xtickslab = c(15, "plain"), font.ytickslab = c(15, "plain"), font.x = c(20, "plain"), font.y = c(20, "plain"),
           ylim=c(0.55, 1.00))

fit_temp <- coxph(SurvObj~temp., data=K_M_Pdae_Mortality)
fit_temp
test.ph.temp <- cox.zph(fit_temp)
test.ph.temp
ggcoxzph(test.ph.temp)

#coef exp(coef) se(coef)  z      p
#temp. 0.2069    1.2298   0.0129 16 <2e-16

#Likelihood ratio test=365  on 1 df, p=0
#n= 2364, number of events= 566 


#FIT COXPH TO JUST THE CONTROLS. DO ANY OF THEM HAVE DIFFERENT MORTALITY?
K_M_Pdae_Mortality_Control$SurvObj <- with(K_M_Pdae_Mortality_Control, Surv(time, status == 2))
head(K_M_Pdae_Mortality_Control)


#fits the temp data for all data and lumps them into two temperature groups
sfit_controls <- survfit(SurvObj ~ family, data=K_M_Pdae_Mortality_Control)
sfit_controls
summary(sfit_controls)
#p<0.0001

ggsurvplot(sfit_controls)


fit_controls <- coxph(SurvObj~family, data=K_M_Pdae_Mortality_Control)
fit_controls

#fits the temp data with family for all data
sfit_temp_fam <- survfit(SurvObj ~ temp. + family, data=K_M_Pdae_Mortality)
sfit_temp_fam
summary(sfit_temp_fam)

ggsurvplot(sfit_temp_fam)


ggsurvplot(sfit_temp_fam, pval=TRUE, palette = c("dodgerblue", "dodgerblue1", "dodgerblue2", "dodgerblue3", "dodgerblue4", "royalblue", "royalblue1", "royalblue2", "royalblue3", "royalblue4", "indianred", "indianred1", "indianred2", "indianred3", "indianred4", "firebrick", "firebrick1", "firebrick2", "firebrick3", "firebrick4"),
           legend.labs=c("27C AB", "27C AC", "27C AF", "27C BA", "27C BD", "27C CB", "27C CD", "27C CE", "27C FA", "27C FE", "35.5C AB", "35.5C AC", "35.5C AF", "35.5C BA", "35.5C BD", "35.5C CB", "35.5C CD", "35.5C CE", "35.5C FA", "35.5C FE"), legend.title="Temperature and Family", 
           main="Kaplan-Meier Curve for Family Mortality", 
           ylim=c(0.40, 1.00))



fit_temp_fam <- coxph(SurvObj~temp.+family+temp.*family, data=K_M_Pdae_Mortality)
fit_temp_fam


test.ph <- cox.zph(fit_temp_fam)
test.ph
ggcoxzph(test.ph)


# mortality in control versus the mortality in heat stressed do end point mortality numbers
# BA
K_M_Pdae_Mortality_AB$SurvObj <- with(K_M_Pdae_Mortality_AB, Surv(time, status == 2))
head(K_M_Pdae_Mortality_AB)

sfit_temp_BA <- survfit(SurvObj ~ temp., data=K_M_Pdae_Mortality_AB)
sfit_temp_BA
summary(sfit_temp_BA)
#p<0.0001

ggsurvplot(sfit_temp_BA)

# no 95% confidence interval
ggsurvplot(sfit_temp_BA, pval=TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C AB", "35.5C AB"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00))

#with 95% confidence interval
ggsurvplot(sfit_temp_BA, pval=TRUE, conf.int = TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C BA", "35.5C BA"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00))

#CA
K_M_Pdae_Mortality_AC$SurvObj <- with(K_M_Pdae_Mortality_AC, Surv(time, status == 2))
head(K_M_Pdae_Mortality_AC)


sfit_temp_CA <- survfit(SurvObj ~ temp., data=K_M_Pdae_Mortality_AC)
sfit_temp_CA
summary(sfit_temp_CA)
#p<0.0001

ggsurvplot(sfit_temp_CA)

# no 95% confidence interval
ggsurvplot(sfit_temp_CA, pval=TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C CA", "35.5C CA"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00))

# with 95% confidence interval
ggsurvplot(sfit_temp_CA, pval=TRUE, conf.int=TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C CA", "35.5C CA"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00))


#FA
K_M_Pdae_Mortality_AF$SurvObj <- with(K_M_Pdae_Mortality_AF, Surv(time, status == 2))
head(K_M_Pdae_Mortality_AF)


sfit_temp_FA <- survfit(SurvObj ~ temp., data=K_M_Pdae_Mortality_AF)
sfit_temp_FA
summary(sfit_temp_FA)
#p<0.0001

ggsurvplot(sfit_temp_FA)

# no 95% confidence interval
ggsurvplot(sfit_temp_FA, pval=TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C AF", "35.5C AF"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00))

# with 95% confidence interval
ggsurvplot(sfit_temp_FA, pval=TRUE, conf.int=TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C FA", "35.5C FA"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00))


#AB
K_M_Pdae_Mortality_BA$SurvObj <- with(K_M_Pdae_Mortality_BA, Surv(time, status == 2))
head(K_M_Pdae_Mortality_BA)


sfit_temp_AB <- survfit(SurvObj ~ temp., data=K_M_Pdae_Mortality_BA)
sfit_temp_AB
summary(sfit_temp_AB)
#p<0.0001

ggsurvplot(sfit_temp_AB)

# no 95% confidence interval
ggsurvplot(sfit_temp_AB, pval=TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C BA", "35.5C BA"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00))

# with 95% confidence interval
ggsurvplot(sfit_temp_AB, pval=TRUE, conf.int=TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C AB", "35.5C AB"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00))


#DB
K_M_Pdae_Mortality_BD$SurvObj <- with(K_M_Pdae_Mortality_BD, Surv(time, status == 2))
head(K_M_Pdae_Mortality_BD)


sfit_temp_DB <- survfit(SurvObj ~ temp., data=K_M_Pdae_Mortality_BD)
sfit_temp_DB
summary(sfit_temp_DB)
#p<0.0001

ggsurvplot(sfit_temp_DB)

# no 95% confidence interval
ggsurvplot(sfit_temp_DB, pval=TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C BD", "35.5C BD"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00))

# with 95% confidence interval
ggsurvplot(sfit_temp_DB, pval=TRUE, conf.int=TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C DB", "35.5C DB"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00))


#BC
K_M_Pdae_Mortality_CB$SurvObj <- with(K_M_Pdae_Mortality_CB, Surv(time, status == 2))
head(K_M_Pdae_Mortality_CB)


sfit_temp_BC <- survfit(SurvObj ~ temp., data=K_M_Pdae_Mortality_CB)
sfit_temp_BC
summary(sfit_temp_BC)
#p<0.0001

ggsurvplot(sfit_temp_BC)

# no 95% confidence interval
ggsurvplot(sfit_temp_BC, pval=TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C CB", "35.5C CB"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00))

# with 95% confidence interval
ggsurvplot(sfit_temp_BC, pval=TRUE, conf.int=TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C BC", "35.5C BC"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00))


#DC
K_M_Pdae_Mortality_CD$SurvObj <- with(K_M_Pdae_Mortality_CD, Surv(time, status == 2))
head(K_M_Pdae_Mortality_CD)


sfit_temp_DC <- survfit(SurvObj ~ temp., data=K_M_Pdae_Mortality_CD)
sfit_temp_DC
summary(sfit_temp_DC)
#p<0.0001

ggsurvplot(sfit_temp_DC)

# no 95% confidence interval
ggsurvplot(sfit_temp_DC, pval=TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C CD", "35.5C CD"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00))

# with 95% confidence interval
ggsurvplot(sfit_temp_DC, pval=TRUE, conf.int=TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C DC", "35.5C DC"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00))


#EC
K_M_Pdae_Mortality_CE$SurvObj <- with(K_M_Pdae_Mortality_CE, Surv(time, status == 2))
head(K_M_Pdae_Mortality_CE)


sfit_temp_EC <- survfit(SurvObj ~ temp., data=K_M_Pdae_Mortality_CE)
sfit_temp_EC
summary(sfit_temp_EC)
#p<0.0001

ggsurvplot(sfit_temp_EC)

# no 95% confidence interval
ggsurvplot(sfit_temp_EC, pval=TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C CE", "35.5C CE"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00))

# with 95% confidence interval
ggsurvplot(sfit_temp_EC, pval=TRUE, conf.int=TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C EC", "35.5C EC"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00))


#AF
K_M_Pdae_Mortality_FA$SurvObj <- with(K_M_Pdae_Mortality_FA, Surv(time, status == 2))
head(K_M_Pdae_Mortality_FA)


sfit_temp_AF <- survfit(SurvObj ~ temp., data=K_M_Pdae_Mortality_FA)
sfit_temp_AF
summary(sfit_temp_AF)
#p<0.0001

ggsurvplot(sfit_temp_AF)

# no 95% confidence interval
ggsurvplot(sfit_temp_AF, pval=TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C AF", "35.5CAF"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00))

# with 95% confidence interval
ggsurvplot(sfit_temp_AF, pval=TRUE, conf.int=TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C AF", "35.5C AF"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00))


#EF
K_M_Pdae_Mortality_FE$SurvObj <- with(K_M_Pdae_Mortality_FE, Surv(time, status == 2))
head(K_M_Pdae_Mortality_FE)


sfit_temp_EF <- survfit(SurvObj ~ temp., data=K_M_Pdae_Mortality_FE)
sfit_temp_EF
summary(sfit_temp_EF)
#p<0.0001

ggsurvplot(sfit_temp_EF)

# no 95% confidence interval
ggsurvplot(sfit_temp_EF, pval=TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C FE", "35.5C FE"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00))

# with 95% confidence interval
ggsurvplot(sfit_temp_EF, pval=TRUE, conf.int=TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C EF", "35.5C EF"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00))


#Join All Individual Plots Together 95% conf. interval order by percent survival
splots3 <- list()
splots3[[1]] <- (fitBD<-ggsurvplot(sfit_temp_DB, pval=TRUE, conf.int = TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C DB", "35.5C DB"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00)))
splots3[[2]] <- (fitAB<-ggsurvplot(sfit_temp_BA, pval=TRUE, conf.int = TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C BA", "35.5C BA"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00)))
splots3[[3]] <- (fitCE<-ggsurvplot(sfit_temp_EC, pval=TRUE, conf.int = TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C EC", "35.5C EC"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00)))
splots3[[4]] <- (fitFE<-ggsurvplot(sfit_temp_EF, pval=TRUE, conf.int = TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C EF", "35.5C EF"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00)))
splots3[[5]] <- (fitBA<-ggsurvplot(sfit_temp_AB, pval=TRUE, conf.int = TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C AB", "35.5C AB"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00)))
splots3[[6]] <- (fitAF<-ggsurvplot(sfit_temp_FA, pval=TRUE, conf.int = TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C FA", "35.5C FA"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00)))
splots3[[7]] <- (fitFA<-ggsurvplot(sfit_temp_AF, pval=TRUE, conf.int = TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C AF", "35.5C AF"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00)))
splots3[[8]] <- (fitCD<-ggsurvplot(sfit_temp_DC, pval=TRUE, conf.int = TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C DC", "35.5C DC"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00)))
splots3[[9]] <- (fitCB<-ggsurvplot(sfit_temp_BC, pval=TRUE, conf.int = TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C BC", "35.5C BC"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00)))
splots3[[10]] <- (fitAC<-ggsurvplot(sfit_temp_CA, pval=TRUE, conf.int = TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C CA", "35.5C CA"), legend.title="Family", main="Kaplan-Meier Curve for Family Mortality", ylim=c(0.30, 1.00)))

arrange_ggsurvplots(splots3, print = TRUE, ncol = 5, nrow = 2)



splots4 <- list()
splots4[[1]] <- (fitBD<-ggsurvplot(sfit_temp_DB, pval=TRUE, conf.int = TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C", "35.5C"), legend.title="Family DB", main="Kaplan-Meier Curve for Family Mortality", font.xtickslab = c(10, "plain"), font.ytickslab = c(10, "plain"), font.x = c(15, "plain"), font.y = c(15, "plain"), ylim=c(0.30, 1.00)))
splots4[[2]] <- (fitAF<-ggsurvplot(sfit_temp_FA, pval=TRUE, conf.int = TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C", "35.5C"), legend.title="Family FA", main="Kaplan-Meier Curve for Family Mortality", font.xtickslab = c(10, "plain"), font.ytickslab = c(10, "plain"), font.x = c(15, "plain"), font.y = c(15, "plain"), ylim=c(0.30, 1.00)))
splots4[[3]] <- (fitAB<-ggsurvplot(sfit_temp_BA, pval=TRUE, conf.int = TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C", "35.5C"), legend.title="Family BA", main="Kaplan-Meier Curve for Family Mortality", font.xtickslab = c(10, "plain"), font.ytickslab = c(10, "plain"), font.x = c(15, "plain"), font.y = c(15, "plain"), ylim=c(0.30, 1.00)))
splots4[[4]] <- (fitFA<-ggsurvplot(sfit_temp_AF, pval=TRUE, conf.int = TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C", "35.5C"), legend.title="Family AF", main="Kaplan-Meier Curve for Family Mortality", font.xtickslab = c(10, "plain"), font.ytickslab = c(10, "plain"), font.x = c(15, "plain"), font.y = c(15, "plain"), ylim=c(0.30, 1.00)))
splots4[[5]] <- (fitCE<-ggsurvplot(sfit_temp_EC, pval=TRUE, conf.int = TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C", "35.5C"), legend.title="Family EC", main="Kaplan-Meier Curve for Family Mortality", font.xtickslab = c(10, "plain"), font.ytickslab = c(10, "plain"), font.x = c(15, "plain"), font.y = c(15, "plain"), ylim=c(0.30, 1.00)))
splots4[[6]] <- (fitCD<-ggsurvplot(sfit_temp_DC, pval=TRUE, conf.int = TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C", "35.5C"), legend.title="Family DC", main="Kaplan-Meier Curve for Family Mortality", font.xtickslab = c(10, "plain"), font.ytickslab = c(10, "plain"), font.x = c(15, "plain"), font.y = c(15, "plain"), ylim=c(0.30, 1.00)))
splots4[[7]] <- (fitFE<-ggsurvplot(sfit_temp_EF, pval=TRUE, conf.int = TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C", "35.5C"), legend.title="Family EF", main="Kaplan-Meier Curve for Family Mortality", font.xtickslab = c(10, "plain"), font.ytickslab = c(10, "plain"), font.x = c(15, "plain"), font.y = c(15, "plain"), ylim=c(0.30, 1.00)))
splots4[[8]] <- (fitCB<-ggsurvplot(sfit_temp_BC, pval=TRUE, conf.int = TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C", "35.5C"), legend.title="Family BC", main="Kaplan-Meier Curve for Family Mortality", font.xtickslab = c(10, "plain"), font.ytickslab = c(10, "plain"), font.x = c(15, "plain"), font.y = c(15, "plain"), ylim=c(0.30, 1.00)))
splots4[[9]] <- (fitBA<-ggsurvplot(sfit_temp_AB, pval=TRUE, conf.int = TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C", "35.5C"), legend.title="Family AB", main="Kaplan-Meier Curve for Family Mortality", font.xtickslab = c(10, "plain"), font.ytickslab = c(10, "plain"), font.x = c(15, "plain"), font.y = c(15, "plain"), ylim=c(0.30, 1.00)))
splots4[[10]] <- (fitAC<-ggsurvplot(sfit_temp_CA, pval=TRUE, conf.int = TRUE, linetype = c("solid", "solid"), palette = c("dodgerblue2", "firebrick2"), legend.labs=c("27C", "35.5C"), legend.title="Family CA", main="Kaplan-Meier Curve for Family Mortality", font.xtickslab = c(10, "plain"), font.ytickslab = c(10, "plain"), font.x = c(15, "plain"), font.y = c(15, "plain"), ylim=c(0.30, 1.00)))

arrange_ggsurvplots(splots4, print = TRUE, ncol = 5, nrow = 2)