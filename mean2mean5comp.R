# compare mean2 and mean5
plot(density(test_scores_1$mean2),ylim= c(0.0,0.027), col='red')+ lines(density(test_scores_2$mean5),col='green')+ 
  legend('topright',legend = c('mean2','mean5'),col = c('red','green'),lty = 1)                                                                                                                  )
