library(survival)
library(ggsurvfit)
library(survminer)
library(glue)
library(readxl)

df = read_excel("D:/smt 4/pengantar ansur/datanba.xlsx")
df
str(df)
names(df)

df$Survival <- as.numeric(round(df$Survival,digits = 0))
y <- Surv(df$Survival, df$cens)
kmfit <- survfit(y~1)
kmfit %>%
  ggsurvfit() +
  labs(
    x = "years",
    y = "Overall survival probability") +
  add_confidence_interval()

df$pos <- as.factor(df$pos)
df$etni <- as.factor(df$etni)
df$ageleft_cat <- as.factor(df$ageleft_cat)
df$Carlengthcat <- as.factor(df$Carlengthcat)
df$gamescat <- as.factor(df$gamescat)


cph_all = coxph(y ~ posn + etnin + CareerLength + ageleft + kilos + cms + g, data = df)
summary(cph_all)
step(cph_all)
cox.zph(cph_all)

cph_2 = coxph(y ~ posn + etnin + CareerLength + ageleft + kilos + cms, data = df)
summary(cph_2)
cox.zph(cph_2)

chisq_stat1 <- -2*(cph_2$loglik[2] - cph_all$loglik[2])
ncoef.dif1 <- length(cph_all$coefficients) - length(cph_2$coefficients)
pvalue1 <- pchisq(chisq_stat1 , df = ncoef.dif1,lower.tail = FALSE)
cat("LRT =", round(chisq_stat1, 2), ", df =", ncoef.dif1, ", p-value =", round(pvalue1, 4))
-2*cph_2$loglik[2]
-2*cph_all$loglik[2]


cph_3 = coxph(y ~ posn + etnin + CareerLength + ageleft + kilos, data = df)

chisq_stat2 <- -2*(cph_3$loglik[2] - cph_2$loglik[2])
ncoef.dif2 <- length(cph_2$coefficients) - length(cph_3$coefficients)
pvalue2 <- pchisq(chisq_stat2 , df = ncoef.dif2,lower.tail = FALSE)
cat("LRT =", round(chisq_stat2, 2), ", df =", ncoef.dif2, ", p-value =", round(pvalue2, 4))
-2*cph_3$loglik[2]
-2*cph_2$loglik[2]


cph_4 = coxph(y ~ posn + CareerLength + ageleft + kilos, data = df)

chisq_stat3 <- -2*(cph_4$loglik[2] - cph_3$loglik[2])
ncoef.dif3 <- length(cph_3$coefficients) - length(cph_4$coefficients)
pvalue3 <- pchisq(chisq_stat3 , df = ncoef.dif3,lower.tail = FALSE)
cat("LRT =", round(chisq_stat3, 2), ", df =", ncoef.dif3, ", p-value =", round(pvalue3, 4))
-2*cph_4$loglik[2]
-2*cph_3$loglik[2]


cph_5 = coxph(y ~ CareerLength + ageleft + kilos, data = df)
cox.zph(cph_5)

chisq_stat4 <- -2*(cph_5$loglik[2] - cph_4$loglik[2])
ncoef.dif4 <- length(cph_4$coefficients) - length(cph_5$coefficients)
pvalue4 <- pchisq(chisq_stat4 , df = ncoef.dif4,lower.tail = FALSE)
cat("LRT =", round(chisq_stat4, 2), ", df =", ncoef.dif4, ", p-value =", round(pvalue4, 4))
-2*cph_5$loglik[2]
-2*cph_4$loglik[2]


cph_s1 <- coxph(y ~ strata(Carlengthcatn)+ ageleft + kilos , data = df)

chisq_stats1 <- -2*(cph_s1$loglik[2] - cph_5$loglik[2])
ncoef.difs1 <- (length(unique(df$Carlengthcat))-1) * length(cph_5$coefficients)
pvalues1 <- pchisq(chisq_stats1 , df = ncoef.difs1,lower.tail = FALSE)
cat("LRT =", round(chisq_stats1, 2), ", df =", ncoef.difs1, ", p-value =", round(pvalues1, 4))
-2*cph_s1$loglik[2]
-2*cph_5$loglik[2]

names(df)
cph_s2 <- coxph(y ~ strata(ageleft_catn)+ CareerLength + kilos , data = df)
chisq_stats2 <- -2*(cph_s2$loglik[2] - cph_5$loglik[2])
ncoef.difs2 <- (length(unique(df$ageleft_catn))-1) * length(cph_5$coefficients)
pvalues2 <- pchisq(chisq_stats2 , df = ncoef.difs2,lower.tail = FALSE)
cat("LRT =", round(chisq_stats2, 2), ", df =", ncoef.difs2, ", p-value =", round(pvalues2, 4))
-2*cph_s2$loglik[2]
-2*cph_5$loglik[2]


#UJI LOG RANK
survdiff(Surv(Survival, cens) ~ pos, data = df)
