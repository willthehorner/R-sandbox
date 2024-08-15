library(quantmod)
library(moments)
library(MASS)
library(metRology)
uni = getSymbols('WILL5000IND',src='FRED',auto.assign = FALSE)
uni = na.omit(uni)
uni = uni['1979-12-31/2017-12-31']
names(uni) = 'TR'
uni$LR = diff(log(uni$TR))

load('C:/Users/willi/Downloads/qjzU8SH6Ro-81PEh-maPtg_0c46ff6057ab4ab2a4482e18632530f1_FRED_gold.gz')
lr = diff(log(gold))[-1]
dr = exp(lr)-1

wlr = apply.weekly(lr, sum)
mlr = apply.monthly(lr, sum)
qlr = apply.quarterly(lr, sum)
ylr = apply.yearly(lr, sum)

wdr = exp(wlr)-1
mdr = exp(mlr)-1
qdr = exp(qlr)-1
ydr = exp(ylr)-1

mu = mean(lr)
s = sd(lr)

valueAtR = qnorm(0.05, mu, s)
dollarVaR = 1000*(exp(valueAtR)-1)

es = mu - s*dnorm(qnorm(0.05,0,1),0,1)/0.05
dollares = 1000*(exp(es)-1)

normal = FALSE
set.seed(123789)
rvec = rnorm(100000, mu, s)
if (normal == FALSE){
  rvec = sample(as.vector(lr),100000,replace = TRUE)}
simVar = quantile(rvec, 0.05)
simEs = mean(rvec[rvec<simVar])

veclr = as.vector(lr)
ke = skewness(lr)
ku = kurtosis(lr)
jarque.test(veclr)
skewness(uni$LR[-1])
kurtosis(uni$LR[-1])

teefit = fitdistr(veclr, 't')
teefit$estimate

a = 0.05
set.seed(123789)
fitvec = rt.scaled(100000,mean = teefit$estimate[1],sd=teefit$estimate[2],df=teefit$estimate[3])
fitVaR = quantile(fitvec,a)
fitE = mean(fitvec[fitvec<fitVaR])