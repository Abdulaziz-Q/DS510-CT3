# compare max2 and max5 
plot(density(test_scores_1$max2),ylim= c(0.0,0.027), col='red')+ lines(density(test_scores_2$max5),col='green')+ 
  legend('topright',legend = c('max2','max5'),col = c('red','green'),lty = 1)                                                                                                                  )
