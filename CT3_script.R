library(dplyr)
library(ggplot2)

# create the five scores  
s1 = rnorm(n=1000,mean = 1200, sd = 30)
s2 = rnorm(n=1000,mean = 1200, sd = 30)
s3 = rnorm(n=1000,mean = 1200, sd = 30)
s4 = rnorm(n=1000,mean = 1200, sd = 30)
s5 = rnorm(n=1000,mean = 1200, sd = 30)
# create test scores dataframes 
test_scores_1 <- data.frame('score1'= s1,'socre2'= s2)
test_scores_2 <- data.frame('score1'= s1, 'score2'=s2, 'socre3'=s3, 'score4'=s4, 'score5'=s5)
# create max, mean and recent scores for each observation for both dataframes 
test_scores_1 <- test_scores_1 %>% mutate( max2 = pmax(test_scores_1$score1,test_scores_1$socre2))
test_scores_1 <- test_scores_1 %>% mutate( mean2 = (test_scores_1$score1 + test_scores_1$socre2)/2)
test_scores_1 <- test_scores_1 %>% mutate(recent2 = test_scores_1$socre2)

test_scores_2 <- test_scores_2 %>% mutate( max5 = pmax(test_scores_2$score1,test_scores_2$score2,test_scores_2$socre3,test_scores_2$score4,test_scores_2$score5))
test_scores_2 <- test_scores_2 %>% mutate( mean5 = (test_scores_2$score1+test_scores_2$score2+test_scores_2$socre3+test_scores_2$score4+test_scores_2$score5)/5)
test_scores_2 <- test_scores_2 %>% mutate( recent5 = test_scores_2$score5)

# max= red, mean= blue, recent= green
plot(density(test_scores_1$max2),ylim= c(0.0,0.019), col='red')+ lines(density(test_scores_1$mean2),col='blue') + lines(density(test_scores_1$recent2),col='green')


# max score comparison. colors: red= score 1, blue= max of dataframe 1, green= max of dataframe2
plot(density(test_scores_1$score1),ylim= c(0.0,0.019), col='red')+ lines(density(test_scores_1$max2),col='blue') + lines(density(test_scores_2$max5),col='green')
# mean score comparison. colors: red= score 1, blue= mean of dataframe 1, green= mean of dataframe 2
plot(density(test_scores_1$score1), ylim= c(0.0,0.027),col='red')+ lines(density(test_scores_1$mean2),col='blue')+ lines(density(test_scores_2$mean5),col='green')
# recent score comparison. colors: red= score 1, blue= recent of dataframe 1, green= recent of dataframe 2
plot(density(test_scores_1$score1), ylim= c(0.0,0.015),col='red')+ lines(density(test_scores_1$recent2),col='blue')+ lines(density(test_scores_2$recent5),col='green')

