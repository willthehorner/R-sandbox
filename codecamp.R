
get_slope = function(sdate, edate){
  file = 'C:/Users/willi/Documents/R/fake_data.csv'
  data = read.csv(file, row.names = 1)
  barometric = data$bar_pre
  coeff = line(barometric)
  coeff = coeff$coefficients[2]
  return(coeff)
}
get_slope(as.Date('1999/09/05'),as.Date('1999/09/30'))