library(ggplot2)


dataset <- read.csv("dataset.csv")


ggplot(data = dataset) + geom_jitter(mapping = aes(x=Gender, y=sd, color=Age=="O", size=Age=="T"),alpha=1/10)#in alpha, 1 is 100 visible

#thick line it's a mediana 
ggplot(data=dataset) + geom_boxplot(mapping=aes(x=Gender, y=sj))


females <-dataset[dataset$Gender=="F",]
females <- as.factor(females)
barplot(females)
ggplot(data=dataset) + geom_point(mapping=aes(x=females, y=sj, shape=Age))

#ggplot(data=dataset) + geom_histogram(mapping=aes(x=sj), origin = 0)


ggplot(data = dataset) + geom_jitter(mapping = aes(x=Gender, y=sj, shape=Age, color=Age))




ggplot(data=dataset)+geom_line(mapping=aes(x=Location, y=so, color=Gender))



#Circle diagram try: 

library(tidyverse)

label_data = dataset
number_of_bar=nrow(label_data)
angle=90-360*(label_data$Location-0.5)/number_of_bar
label_data$hjust<-ifelse( angle < -90, 1, 0)
label_data$angle<-ifelse(angle < -90, angle+180, angle)


p = ggplot(dataset , aes(x= as.factor(Location), y= so)) +       
  geom_bar(stat="identity", fill=alpha("blue", 0.3)) + ylim(-100,120) +
  theme_minimal() +
  theme(
    axis.text = element_blank(),
    axis.title = element_blank(),
    panel.grid = element_blank(),
    plot.margin = unit(rep(-2,4), "cm")     
  ) +
  coord_polar(start = 0) + geom_text( aes(x=Location, y=so+1, 
                                                          label=Location, hjust=hjust), color="black", fontface="bold",alpha=0.6, size=2.5, angle= label_data$angle, inherit.aes = FALSE )
p






my_vector=c(3,12,5,18,45)
names(my_vector)=c("A","B","C","D","E")

# A basic barplot
barplot(my_vector, col=rgb(0.2,0.4,0.6,0.6), xlab="category" )



#LOCATION D MALES
ggplot(data=maleD) + geom_col(aes(x=Age, y=so))
ggplot(data=maleD) + geom_col(aes(x=Age, y=sd))
ggplot(data=maleD) + geom_col(aes(x=Age, y=st))
ggplot(data=maleD) + geom_col(aes(x=Age, y=sj))
ggplot(data=maleD) + geom_col(aes(x=Age, y=ss))
#LOCATION D FEMALES
ggplot(data=femaleD) + geom_col(aes(x=Age, y=so))
ggplot(data=femaleD) + geom_col(aes(x=Age, y=sd))
ggplot(data=femaleD) + geom_col(aes(x=Age, y=st))
ggplot(data=femaleD) + geom_col(aes(x=Age, y=sj))
ggplot(data=femaleD) + geom_col(aes(x=Age, y=ss))


#LOCATION C MALES
ggplot(data=maleC) + geom_col(aes(x=Age, y=so))
ggplot(data=maleC) + geom_col(aes(x=Age, y=sd))
ggplot(data=maleC) + geom_col(aes(x=Age, y=st))
ggplot(data=maleC) + geom_col(aes(x=Age, y=sj))
ggplot(data=maleC) + geom_col(aes(x=Age, y=ss))
#LOCATION C FEMALES
ggplot(data=femaleC) + geom_col(aes(x=Age, y=so))
ggplot(data=femaleC) + geom_col(aes(x=Age, y=sd))
ggplot(data=femaleC) + geom_col(aes(x=Age, y=st))
ggplot(data=femaleC) + geom_col(aes(x=Age, y=sj))
ggplot(data=femaleC) + geom_col(aes(x=Age, y=ss))


#LOCATION B MALES
ggplot(data=maleB) + geom_col(aes(x=Age, y=so))
ggplot(data=maleB) + geom_col(aes(x=Age, y=sd))
ggplot(data=maleB) + geom_col(aes(x=Age, y=st))
ggplot(data=maleB) + geom_col(aes(x=Age, y=sj))
ggplot(data=maleB) + geom_col(aes(x=Age, y=ss))
#LOCATION B FEMALES
ggplot(data=femaleB) + geom_col(aes(x=Age, y=so))
ggplot(data=femaleB) + geom_col(aes(x=Age, y=sd))
ggplot(data=femaleB) + geom_col(aes(x=Age, y=st))
ggplot(data=femaleB) + geom_col(aes(x=Age, y=sj))
ggplot(data=femaleB) + geom_col(aes(x=Age, y=ss))



#LOCATION A MALES
ggplot(data=maleA) + geom_col(aes(x=Age, y=so))
ggplot(data=maleA) + geom_col(aes(x=Age, y=sd))
ggplot(data=maleA) + geom_col(aes(x=Age, y=st))
ggplot(data=maleA) + geom_col(aes(x=Age, y=sj))
ggplot(data=maleA) + geom_col(aes(x=Age, y=ss))
#LOCATION A FEMALES
ggplot(data=femaleA) + geom_col(aes(x=Age, y=so))
ggplot(data=femaleA) + geom_col(aes(x=Age, y=sd))
ggplot(data=femaleA) + geom_col(aes(x=Age, y=st))
ggplot(data=femaleA) + geom_col(aes(x=Age, y=sj))
ggplot(data=femaleA) + geom_col(aes(x=Age, y=ss))


#VERY INTERESTING HERE - 
ggplot(data=teenagers) + geom_boxplot(aes(x=Location, y=sj, color=Gender))
ggplot(data=teenagers) + geom_boxplot(aes(x=Location, y=so, color=Gender))
ggplot(data=teenagers) + geom_boxplot(aes(x=Location, y=sd, color=Gender))
ggplot(data=teenagers) + geom_boxplot(aes(x=Location, y=ss, color=Gender))
ggplot(data=teenagers) + geom_boxplot(aes(x=Location, y=st, color=Gender))


ggplot(data=under25) + geom_boxplot(aes(x=Location, y=sj, color=Gender))
ggplot(data=under25) + geom_boxplot(aes(x=Location, y=so, color=Gender))
ggplot(data=under25) + geom_boxplot(aes(x=Location, y=sd, color=Gender))
ggplot(data=under25) + geom_boxplot(aes(x=Location, y=ss, color=Gender))
ggplot(data=under25) + geom_boxplot(aes(x=Location, y=st, color=Gender))


ggplot(data=late20) + geom_boxplot(aes(x=Location, y=sj, color=Gender))
ggplot(data=late20) + geom_boxplot(aes(x=Location, y=so))
ggplot(data=late20) + geom_boxplot(aes(x=Location, y=sd, color=Gender))
ggplot(data=late20) + geom_boxplot(aes(x=Location, y=ss, color=Gender))
ggplot(data=late20) + geom_boxplot(aes(x=Location, y=st, color=Gender))



ggplot(data=over30) + geom_boxplot(aes(x=Location, y=sj, color=Gender))
ggplot(data=over30) + geom_boxplot(aes(x=Location, y=so, color=Gender))
ggplot(data=over30) + geom_boxplot(aes(x=Location, y=sd, color=Gender))
ggplot(data=over30) + geom_boxplot(aes(x=Location, y=ss, color=Gender))
ggplot(data=over30) + geom_boxplot(aes(x=Location, y=st, color=Gender))

