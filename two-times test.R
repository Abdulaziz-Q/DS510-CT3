# create the five scores
s1 = rnorm(n=1000,mean = 1200, sd = 30)
s2 = rnorm(n=1000,mean = 1200, sd = 30)
# create test scores dataframes 
test_scores_1 <- data.frame('score1'= s1,'socre2'= s2)
# create max, mean and recent scores for each observation for both dataframes 
test_scores_1 <- test_scores_1 %>% mutate( max2 = pmax(test_scores_1$score1,test_scores_1$socre2))
test_scores_1 <- test_scores_1 %>% mutate( mean2 = (test_scores_1$score1 + test_scores_1$socre2)/2)
test_scores_1 <- test_scores_1 %>% mutate(recent2 = test_scores_1$socre2)
# max= red, mean= blue, recent= green
plot(density(test_scores_1$max2),ylim= c(0.0,0.019), col='red')+ 
  lines(density(test_scores_1$mean2),col='blue')+
  lines(density(test_scores_1$recent2),col='green')+
  legend('topright',legend = c('max2','mean2','recent2'),col = c('red','blue','green'),lty = 1)         