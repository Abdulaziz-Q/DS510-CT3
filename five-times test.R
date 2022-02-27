# create the five scores  
s1 = rnorm(n=1000,mean = 1200, sd = 30)
s2 = rnorm(n=1000,mean = 1200, sd = 30)
s3 = rnorm(n=1000,mean = 1200, sd = 30)
s4 = rnorm(n=1000,mean = 1200, sd = 30)
s5 = rnorm(n=1000,mean = 1200, sd = 30)
# create test scores dataframes 
test_scores_2 <- data.frame('score1'= s1, 'score2'=s2, 'socre3'=s3, 'score4'=s4, 'score5'=s5)
# create max, mean and recent scores for each observation for both dataframes 
test_scores_2 <- test_scores_2 %>% mutate( max5 = pmax(test_scores_2$score1,test_scores_2$score2,
                                                       test_scores_2$socre3,test_scores_2$score4,test_scores_2$score5))
test_scores_2 <- test_scores_2 %>% mutate( mean5 = (test_scores_2$score1+test_scores_2$score2+
                                                      test_scores_2$socre3+test_scores_2$score4+test_scores_2$score5)/5)
test_scores_2 <- test_scores_2 %>% mutate( recent5 = test_scores_2$score5)
# max= red, mean= blue, recent= green
plot(density(test_scores_2$max5),ylim= c(0.0,0.027),xlim=c(1080,1310), col='red')+
  lines(density(test_scores_2$mean5),col='blue')+lines(density(test_scores_2$recent5),col='green')+
  legend('topright',legend = c('max5','mean5','recent5'),col = c('red','blue','green'),lty = 1) 