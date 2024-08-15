library(quantmod)
uni = getSymbols('DEXJPUS',src='FRED',auto.assign = FALSE)
uni = na.omit(uni)
uni = uni['1979-12-31/2017-12-31']
uni = 1/uni
names(uni) = 'TR'

uni$LR = diff(log(uni$TR))
uni$DR = exp(uni$LR)-1

lrvec = uni$LR[-1]
mu = mean(lrvec)
s = sd(lrvec)

valueAtR = qnorm(0.01, mu, s)
dollarVaR = 1000*(exp(valueAtR)-1)

es = mu - s*dnorm(qnorm(0.01,0,1),0,1)/0.01
dollares = 1000*(exp(es)-1)

RNGkind(sample.kind='Rounding')
set.seed(123789)
rvec = rnorm(100000, mu, s)
simVar = quantile(rvec, 0.01)
simEs = mean(rvec[rvec<simVar])

RNGkind(sample.kind='Rounding')
set.seed(123789)
svec = sample(as.vector(lrvec),100000,replace = TRUE)
sampVar = quantile(svec, 0.01)
sampEs = mean(svec[svec<sampVar])

dollares = 1000*(exp(sampEs)-1)
