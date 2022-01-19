#import the correlation data form excel 

#install ggpubr

library("ggpubr")

head(GenotypedCorrelationData)

#### Scatter plots 

ggscatter(GenotypedCorrelationData, x = "Sig_Mark", y = "Geno_Mark", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Significant Markers", ylab = "Markers Genotyped")

ggscatter(GenotypedCorrelationData, x = "Sig_Mark", y = "Parental_dist", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Significant Markers", ylab = "Parental Genetic Distance")

ggscatter(GenotypedCorrelationData, x = "Sig_Mark", y = "surv_10days", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Significant Markers", ylab = "Survival 10 days of Heat Stress")

#### Correlation coefficient calculator

sigtogeno <- cor.test(GenotypedCorrelationData$Sig_Mark, GenotypedCorrelationData$Geno_Mark, 
                method = "pearson")
sigtogeno

sigtopardist <- cor.test(GenotypedCorrelationData$Sig_Mark, GenotypedCorrelationData$Parental_dist, 
                      method = "pearson")
sigtopardist

sigtosurv <- cor.test(GenotypedCorrelationData$Sig_Mark, GenotypedCorrelationData$surv_10days, 
                      method = "pearson")
sigtosurv