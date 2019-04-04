library(ggplot2)
dataset <- read.csv("dataset.csv")
dataset$Age <-ordered(dataset$Age,levels = c("T", "U", "L", "O"))
females <-dataset[dataset$Gender=="F",]
males <-dataset[dataset$Gender=="M",]
locationA <-dataset[dataset$Location=="A",]
locationB <-dataset[dataset$Location=="B",]
locationC <-dataset[dataset$Location=="C",]
locationD <-dataset[dataset$Location=="D",]
locationE <-dataset[dataset$Location=="E",]
maleE <-dataset[dataset$Location=="E" & dataset$Gender=="M",]
femaleE <-dataset[dataset$Location=="E" & dataset$Gender=="F",]
maleD <-dataset[dataset$Location=="D" & dataset$Gender=="M",]
femaleD <-dataset[dataset$Location=="D" & dataset$Gender=="F",]
maleC <-dataset[dataset$Location=="C" & dataset$Gender=="M",]
femaleC <-dataset[dataset$Location=="C" & dataset$Gender=="F",]
maleB <-dataset[dataset$Location=="B" & dataset$Gender=="M",]
femaleB <-dataset[dataset$Location=="B" & dataset$Gender=="F",]
maleA <-dataset[dataset$Location=="A" & dataset$Gender=="M",]
femaleA <-dataset[dataset$Location=="A" & dataset$Gender=="F",]
teenagers  <-dataset[dataset$Age=="T",]
under25  <-dataset[dataset$Age=="U",]
late20  <-dataset[dataset$Age=="L",]
over30  <-dataset[dataset$Age=="O",]
AC <-dataset[dataset$Location=="A" || dataset$Location=="C",]
ACmaleAC <-AC[AC$Gender=="M",]


#RELATIONSHIP 1 - IN OVERALL LOCATION D HAS THE HIGHEST SCORES, WITH PERFECT 100
ggplot(data=dataset)+geom_boxplot(aes(x=Location, y=so))

#RELATIONSHIP 2 - IN JUMPING IN ALL LOCATIONS, FEMALES ARE GRADUALLY GETTING BETTER WITH TEENAGERS WITH THE LOWEST SCORES AND OVER 30S AT THE HIGHEST
ggplot(data=dataset) + geom_jitter(aes(x=Age, y=sj, color=Gender)) 
ggplot(data=females)+geom_boxplot(aes(x=Age, y=sj, color=Location)) + labs(title="Comparison of female scores in jumping, in all locations and all ages")

#RELATIONSHIP 3 - IN DISTANCE RUNNING IN ALL LOCATIONS, PEOPLE OVER 30S HAVE THE HIGHEST SCORES
ggplot(data=dataset) + geom_boxplot(aes(x=Age, y=sd))
ggplot(data=dataset) + geom_jitter(aes(x=Age, y=sd))

#RELATIONSHIP 4 - TEENAGE FEMALES IN LOCATION E HAVE MOSTLY SAME SCORES IN SPRINTING WHAT IN JUMPING
ggplot(data=females[females$Location == "E",])+geom_point(aes(x=ss, y=sj,color=Age))
ggplot(data=females[females$Location == "E",])+geom_smooth(position=position_jitter(0.08),se=FALSE, aes(x=ss, y=sj, col=Age))+ facet_wrap(Location~Gender)

#RELATIONSHIP 5 - IN LOCATION A&C APPEARS PERFECT LINE WHEN SCORES IN THROWING AND SPRINTING ARE COMPARED 
ggplot(data=dataset) + geom_smooth(se=FALSE, aes(x=ss, y=st, color=Location))+ facet_wrap(Location~Gender)
ggplot(data=AC) + geom_smooth(position=position_jitter(0.8),se=FALSE, aes(x=ss, y=st, color=Location))

#RELATIONSHIP 6 - MALES IN LOCATIONS A AND C CREATES WITH THEIR SCORESC PERFECT LINE WHEN THEIR OVERAL SCORES ARE COMPARED WITH THEIR JUMPING SCORES
ggplot(data=males)+geom_point(aes(x=sj, y=so, color=Location)) + geom_smooth(aes(x=sj, y=so, color=Location)) + facet_wrap(Location~Gender)
ggplot(data=males)+geom_smooth(position=position_jitter(0.8),se=FALSE,aes(x=sj, y=so)) 

#RELATIONSHIP 7 - IN LOCATION B, CURVE APPEARS WHEN FOR MALES ARE COMPARED SCORES IN DISTANCE RUNNING AND JUMPING
ggplot(data=males) + geom_smooth(position=position_jitter(0.8),se=FALSE, aes(x=sj, y=sd, col=Location))+ facet_wrap(Location~Gender)
ggplot(data=maleB) + geom_point(position=position_jitter(0.9),aes(x=sd, y=sj, color=Age))






