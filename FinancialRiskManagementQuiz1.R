library(quantmod)
uni = getSymbols('DEXJPUS',src='FRED',auto.assign = FALSE)
uni = na.omit(uni)
uni = uni['1979-12-31/2017-12-31']
uni = 1/uni
names(uni) = 'TR'
uni$LR = diff(log(uni$TR))
uni$DR = exp(uni$LR)-1
uni$MLR = apply.monthly(uni$LR, sum)
uni$MDR = exp(uni$MLR)-1
uni$QLR = apply.quarterly(uni$LR, sum)
uni$QDR = exp(uni$QLR)-1
uni$YLR = apply.yearly(uni$LR, sum)
uni$YDR = exp(uni$YLR)-1