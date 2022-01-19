setwd("directory")
###### define input files here
dk<-read.table("FE_ID.txt")
df<-read.table("FE_FinalBaseCall.txt", header=T)
rownames(df)<-df[,1]
df<-df[,c(-1,-2,-3,-4)]
head(df)
ncol(df)

###### take subsets for your test of interest here
keyrows<-c(1:nrow(dk))		# samples to include, by row number in key file
key<-dk[keyrows,]			# as written, this includes all samples
key
subdf<-df[,min(keyrows):(max(keyrows)*2)]
head(subdf)
ncol(subdf)

###### apply max missing data filter
nrow(subdf)
subdf$na <- apply(is.na(subdf), 1, sum)
maxmd<-1	# this is the max number of samples allowed to have missing data
fsdf<-subdf[subdf$na<=(maxmd*2),]
fsdf<-fsdf[,-1*ncol(fsdf)]
head(fsdf)
nrow(fsdf)

# set up graphing parameters
par(mar=c(5,5,3,3))
par(las=1)
par(cex=1.2)

# run glm for each locus
pvec<-c()
colnos<-((1:nrow(key))*2)-1
ivec<-jvec<-rvec<-pvec<-adjvec<-c()
trts<-levels(factor(key$Trt))
trts

for (a in 1:nrow(fsdf))
#for (a in 1:1000)
	{
	dt<-cbind(key,"A"=t(fsdf[a,colnos])+1, "B"=t(fsdf[a,colnos+1])+1)
	names(dt)<-c("sample","trt","A","B")
	subi<-na.omit(dt[dt$trt==trts[1],])
	subj<-na.omit(dt[dt$trt==trts[2],])
	afi<-sum(subi$B)/sum(subi$A+subi$B) #allele counts to allele frequencies for sample i
	afj<-sum(subj$B)/sum(subj$A+subj$B) #allele counts to allele frequencies for sample j
	if (nrow(subi)<1 | nrow(subj)<1) {next;}

	mod<-glm(cbind(A,B) ~ trt, family=binomial(logit), data=dt)
	pi<-summary(mod)$coefficients[8]
	rvec<-append(rvec,a)
	pvec<-append(pvec,pi)
	ivec<-append(ivec,afi)
	jvec<-append(jvec,afj)
	}

# run Multiple Test Correction 
adjvec<-p.adjust(pvec)

# add raw p and adj p to dataframe
fsdf<-cbind(fsdf[rvec,],"pvalue"=pvec,"adjP"=adjvec)
fsdf<-cbind(fsdf[rvec,],"pvalue"=pvec)
fsdf<-cbind(fsdf,"af2"=jvec,"af1"=ivec)
head(fsdf)

nrow(fsdf)
covthd<-80 #coverage threshold
cvec<-c()
for (a in 1:nrow(fsdf))
	{
	numsams<-length(na.omit(t(fsdf[a,1:(ncol(fsdf)-3)])))/2
	rsi<-rowSums(fsdf[a,1:(ncol(fsdf)-3)], na.rm=T)
	covi<-rsi/numsams
	cvec<-append(cvec,covi)
	}

fsdf<-cbind(fsdf,"avgcov"=cvec)
fsdf<-fsdf[fsdf$avgcov>=covthd,]
adjvec<-p.adjust(fsdf$pvalue)
fsdf<-cbind(fsdf,"adjP"=adjvec)
nrow(fsdf)


#Run this code above for the final base call data for each cross

# make plot of all SNP data
par(cex=1.5)
plot(fsdf$af2~fsdf$af1, ylab="SNP frequency 35.5C", xlab="SNP frequency 27C")

# code point according to results from glm
for (a in 1:nrow(fsdf))
	{
	if (fsdf[a,]$adjP < 0.05)
		{
		points(fsdf[a,]$af2~fsdf[a,]$af1, pch=19, col="red")
		}
	}
nrow(fsdf[fsdf$adjP<0.05,]) 

library(xlsx)
write.xlsx(fsdf, "C:/Users/hollandelder/Documents/OregonStateUniversity/Coral_Projects/Thermal_Tolerance/Pacific/BSA_Computing/R/FinalBaseCallData/FE80_SNPs_Pval.xlsx")


#FA 40 sig SNPs 50X coverage
#FA 34 sig SNPs 80X coverage
#CD 388 sig SNPs 50X coverage
#CD 336 sig SNPs 80X coverage
#AC 84 sig SNPs 50X coverage
#AC 75 sig SNPs 80X coverage
#AB 108 sig SNPs 50X coverage
#AB 95 sig SNPs 80X coverage
#AF 139 sig SNPs 50X coverage
#AF 127 sig SNPs 80X coverage
#BA 88 sig SNPs 50X coverage
#BA 81 sig SNPs 60X coverage
#BA 76 sig SNPs 80X coverage
#BD 46 sig SNPs 70X coverage
#BD 44 sig SNPs 80X coverage
#CB 80 sig SNPs 50X coverage
#CB 69 sig SNPs 80X coverage
#CE 83 sig SNPs 50X coverage
#CE 77 sig SNPs 80X coverage
#FE 148 sig SNPs 50X coverage
#FE 124 sig SNPs 80X coverage

# Proportion of SNPs decreasing and increasing figure

library(ggplot2)

library(readxl)
ProportionInDe <- read_excel("OregonStateUniversity/Coral_Projects/GreatBarrierReef/Pdae_Project/AF_Computing/R/FinalBaseCallData/ProportionInDe.xlsx")
View(ProportionInDe)

#bar plot
ggplot(ProportionInDe, aes(x=Cross, y=Proportion, fill=Change)) + geom_bar(position = "dodge", colour = "black", stat = "identity") + scale_fill_manual(values = c("firebrick", "dodgerblue")) + labs(y="Proportion of Major Alleles Changing in Frequency", x="Cross", size = 20)

#box plot
ggplot(AllFamSigSNPs80X, aes(x=Cross, y=changeaf_maj, fill=Change)) + geom_boxplot() + scale_fill_manual(values = c("firebrick", "dodgerblue")) + labs(y="Change of Major Allele Frequency", x="Cross", size = 20)

