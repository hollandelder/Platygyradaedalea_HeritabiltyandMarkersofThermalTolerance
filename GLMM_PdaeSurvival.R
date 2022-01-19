library(plyr)
library(ggplot2)
 
#GGPLOT2 PLOTS
#line plot All
ggplot(R_ReadyMortFamSpecific_MeanSE, aes(x=Time, y=Mean, colour=Family, linetype=Family)) + scale_linetype_manual(values = c("dashed", "solid", "dashed", "solid", "dashed", "solid", "dashed", "solid", "dashed", "solid", "dashed", "solid", "dashed", "solid", "dashed", "solid", "dashed", "solid", "dashed", "solid")) + scale_colour_manual(values = c("green3", "green3", "goldenrod", "goldenrod", "#109618", "#109618", "#990099", "#990099", "#0099c6", "#0099c6", "#dd4477", "#dd4477", "tan4", "tan4", "#3366cc", "#3366cc", "#e67300", "#e67300", "#6633cc", "#6633cc")) + ylab("Mean Proportion Surviving") + xlab("Hours") +geom_ribbon(aes(ymin=Mean-Stand.Err, ymax=Mean+Stand.Err, alpha=0.002)) + geom_line(size=1)

#line plot all families heated
ggplot(dhot, aes(x=Time, y=Mean, colour=Family, linetype=Family)) + scale_linetype_manual(values = c("solid", "solid", "solid", "solid", "solid", "solid", "solid", "solid", "solid", "solid")) + scale_colour_manual(values = c("green3", "goldenrod", "#109618", "#990099", "#0099c6", "#dd4477", "tan4", "#3366cc", "#e67300", "#6633cc")) + ylab("Mean Proportion Surviving") + xlab("Hours") +geom_ribbon(aes(ymin=Mean-Stand.Err, ymax=Mean+Stand.Err, alpha=0.002)) + geom_line(size=1)


#scatter plot All Data
plot<-ggplot(R_ReadyMortFamSpecific_MeanSE, aes(x=Time, y=Mean, shape=Family, fill=Family)) 
plot + geom_line(position=position_dodge(1)) + geom_point(position=position_dodge(1), size=4) + scale_shape_manual(values = c(21, 23, 21, 23, 21, 23, 21, 23, 21, 23, 21, 23, 21, 23, 21, 23, 21, 23, 21, 23)) + scale_fill_manual(values=c('green3', 'green3', 'goldenrod', 'goldenrod', '#109618', '#109618', '#990099', '#990099', "#0099c6", "#0099c6", "#dd4477", "#dd4477", "tan4", "tan4", "#3366cc", "#3366cc", "#e67300", "#e67300", "#6633cc", "#6633cc")) + geom_errorbar(aes(ymin=Mean-Stand.Err, ymax=Mean+Stand.Err),  width=2) + ylab("Mean Proportion Surviving") + xlab("Hours")

#scatter Plot All Families Just Heated
plot1<-ggplot(dhot, aes(x=Time, y=Mean, shape=Family, fill=Family)) 
plot1 + geom_line(position=position_dodge(1)) + geom_point(position=position_dodge(1), size=4) + scale_shape_manual(values = c(23, 23, 23, 23, 23, 23, 23, 23, 23, 23)) + scale_fill_manual(values=c('green3', 'goldenrod', '#109618', '#990099', "#0099c6", "#dd4477", "tan4", "#3366cc", "#e67300", "#6633cc")) + geom_errorbar(aes(ymin=Mean-Stand.Err, ymax=Mean+Stand.Err),  width=2) + ylab("Mean Proportion Surviving") + xlab("Hours")


#subset data
RReady_RawProp_Hot <- subset(RReady_RawProportion_MortalityCountsFamilySpecific, RReady_RawProportion_MortalityCountsFamilySpecific$Temp.C == 36)
head(RReady_RawProp_Hot)
summary(RReady_RawProp_Hot)

#MAKES CORRELATION PLOT for contol vs. treatment at hour 240
ggplot(RReady_RawProportion_MortalityCountsFamilySpecific_240, aes(x=ProportionCon, y=ProportionHot)) + geom_point() + xlab("Proportion Surviving Control") + ylab("Proportion Surviving Treatment")

#MAKES CORRELATION SCATTER TO LOOK AT PERFORMANCE VALUES FOR PARENTS
ggplot(AverageMortalityParents, aes(x=AveMortDad, y=AveMortMom)) + geom_point(size=4) + geom_errorbar(aes(ymin=AveMortMom-SEMortMom, ymax=AveMortMom+SEMortMom), width=.1) + geom_errorbarh(aes(xmin=AveMortDad-SEMortDad, xmax=AveMortDad+SEMortDad), height=0.1) +  geom_text(aes(label=Mom),hjust=1.5, vjust=1.5) + xlab("Dame Preformance Value") + ylab("Sire Preformance Value")


#MAKES A SCATTERPLOT COMPARING PERCENT SURVIVING TO PERCENT SIG SNPS

ggplot(PercentSig_V_PercentMortality, aes(x=PercentSig, y=AverageSurviving)) + geom_point(size=4) +  geom_text(aes(label=Sample),hjust=1.5, vjust=1.5) + xlab("Percent SNPs Significant") + ylab("Percent Surviving")
#No Trend

SNPsVSurv = lm(PercentSig ~ AverageSurviving, data = PercentSig_V_PercentMortality)
summary(SNPsVSurv)
#NOT SIGNIFICANT


# need a mixed model, because we must account for random effects of plate. Use lme4

library(MASS)
library(lme4)
library(Matrix)
library(car)
library(lmerTest)

#What distribution

RReady_RawProportion_MortalityCountsFamilySpecific$Proportion.t <- RReady_RawProportion_MortalityCountsFamilySpecific$Proportion + 1
qqp(RReady_RawProportion_MortalityCountsFamilySpecific$Proportion, "norm")
qqp(RReady_RawProportion_MortalityCountsFamilySpecific$Proportion.t, "lnorm")

RReady_RawProp_Hot <- subset(RReady_RawProportion_MortalityCountsFamilySpecific, RReady_RawProportion_MortalityCountsFamilySpecific$Temp.C == 36)

RReady_RawProportion_MortalityCountsFamilySpecific$Proportion <- RReady_RawProportion_MortalityCountsFamilySpecific$Proportion + 1
qqp(RReady_RawProportion_MortalityCountsFamilySpecific$Proportion, "norm")

qqp(RReady_RawProportion_MortalityCountsFamilySpecific$Proportion, "lnorm")


#DATA IS OVERDISPERSED

#Running Tank, Plate, and Well as a nested design (this is the most correct) 

#USING THE PQL CORRECTION

hist(RReady_RawProportion_MortalityCountsFamilySpecific$Proportion)
#super non-normal data

# Below is the correct model with penalized quassiliklihood (PQL) correction. 

RReady_RawProportion_MortalityCountsFamilySpecific$Proportion.100 <- RReady_RawProportion_MortalityCountsFamilySpecific$Proportion * 100
head(RReady_RawProportion_MortalityCountsFamilySpecific)

library(nlme)

PQL <- glmmPQL(Proportion.100 ~ Family + Time + Family*Time, ~1 | Tank/Plate/Well, family = gaussian(link = "log"),
               data = RReady_RawProportion_MortalityCountsFamilySpecific, verbose = FALSE)

summary(PQL)

PQL_hot <- glmmPQL(Proportion.100 ~ Family + Time + Family*Time, ~1 | Tank/Plate/Well, family = gaussian(link = "log"),
                   data = RReady_RawProportion_MortalityCountsFamilySpecific, verbose = FALSE)

summary(PQL_hot)

PQL_Full <- glmmPQL(Proportion.100 ~ Temp.C + Time + Family + Time*Family + Time*Temp.C + Family*Temp.C + Family*Temp.C*Time, ~1 | Plate/Well, family = gaussian(link = "log"), data = RReady_RawProportion_MortalityCountsFamilySpecific, verbose = FALSE)

summary(PQL_Full)
Anova(PQL_Full)


#> Anova(PQL_Full)
#Analysis of Deviance Table (Type II tests)

#Response: Proportion.100
#Chisq Df Pr(>Chisq)    
#Temp.C               85.777  1    < 2e-16 ***
#  Time               1305.097  1    < 2e-16 ***
#  Family               15.231  9    0.08479 .  
#Time:Family         103.667  9    < 2e-16 ***
#  Temp.C:Time         807.121  1    < 2e-16 ***
#  Temp.C:Family        21.194  9    0.01182 *  
#  Temp.C:Time:Family  193.050  9    < 2e-16 ***
  ---
