library(ggplot2)
ggplot(diamonds)  # if only the dataset is known.
ggplot(diamonds, aes(x=carat))  # if only X-axis is known. The Y-axis can be specified in respective geoms.
ggplot(diamonds, aes(x=carat, y=price))  # if both X and Y axes are fixed for all layers.
ggplot(diamonds, aes(x=carat, color=cut))  # Each category of the 'cut' variable will now have a distinct  color, once a geom is added.
ggplot(diamonds, aes(x=carat), color="steelblue")
ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point() + geom_smooth() 
# Adding scatterplot geom (layer1) and smoothing geom (layer2).

ggplot(diamonds) + geom_point(aes(x=carat, y=price, color=cut)) + geom_smooth(aes(x=carat, y=price, color=cut)) # Same as above but specifying the aesthetics inside the geoms.
ggplot(diamonds) + geom_point(aes(x=carat, y=price, color=cut)) + geom_smooth(aes(x=carat, y=price)) # Remove color from geom_smooth
ggplot(diamonds, aes(x=carat, y=price)) + geom_point(aes(color=cut)) + geom_smooth() # same but simpler
ggplot(diamonds, aes(x=carat, y=price, color=cut, shape=color)) + geom_point()


library(ggplot2)
gg <- ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point() + labs(title="Scatterplot", x="Carat", y="Price")  # add axis lables and plot title.
print(gg)

gg1 <- gg + theme(plot.title=element_text(size=30, face="bold"), 
                  axis.text.x=element_text(size=15), 
                  axis.text.y=element_text(size=15),
                  axis.title.x=element_text(size=25),
                  axis.title.y=element_text(size=25)) + 
  scale_color_discrete(name="Cut of diamonds")# add title and axis text, change legend title.

print(gg1)


scale_fill_continuous(name="legend title")

gg1 + facet_wrap( ~ cut, ncol=3)  
gg1 + facet_wrap(color ~ cut)
gg1 + facet_wrap(color ~ cut, scales="free") 
gg1 + facet_grid(color ~ cut) 


#it needs time variable in order to create a plot
library(ggfortify)
install.packages("ggfortify")
autoplot(AirPassengers) + labs(title="AirPassengers")# where AirPassengers is a 'ts' object
install.packages("zoo")



data(economics, package="ggplot2")
economics <- data.frame(economics)
ggplot(economics) + geom_line(aes(x=date, y=pce, color="pcs")) + geom_line(aes(x=date, y=unemploy, 
                                                                               col="unemploy")) + scale_color_discrete(name="Legend") + labs(title="Economics")










#CAN BE USEFUL FOR THE COURSEWORK###################################################
plot1 <- ggplot(mtcars, aes(x=cyl)) + geom_bar() + labs(title="Frequency bar chart")  # Y axis derived from counts of X item
print(plot1)



df <- data.frame(var=c("a", "b", "c"), nums=c(1:3))
plot2 <- ggplot(df, aes(x=var, y=nums)) + geom_bar(stat = "identity")  # Y axis is explicit. 'stat=identity'
print(plot2)


library(gridExtra)
grid.arrange(plot1, plot2, ncol=2)
#################################################################################








df <- data.frame(var=c("a", "b", "c"), nums=c(1:3))
ggplot(df, aes(x=var, y=nums)) + geom_bar(stat = "identity") + coord_flip() + labs(title="Coordinates are flipped")





ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point() + geom_smooth() + 
  coord_cartesian(ylim=c(0, 10000)) + labs(title="Coord_cartesian zoomed in!")


ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point() + geom_smooth() + ylim(c(0, 10000)) + 
  labs(title="Datapoints deleted: Note the change in smoothing lines!")
#> Warning messages:
#> 1: Removed 5222 rows containing non-finite values
#> (stat_smooth). 
#> 2: Removed 5222 rows containing missing values


ggplot(diamonds, aes(x=price, y=price+runif(nrow(diamonds), 100, 10000), color=cut)) + geom_point() + geom_smooth() + coord_equal()
#> (geom_point).

ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point() + geom_smooth() +theme_linedraw() + labs(title="LINEDRAW Theme")

p1 <- ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point() + geom_smooth() + theme(legend.position="none") + labs(title="legend.position='none'")  # remove legend
p2 <- ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point() + geom_smooth() + theme(legend.position="top") + labs(title="legend.position='top'")  # legend at top
p3 <- ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point() + geom_smooth() + labs(title="legend.position='coords inside plot'") + theme(legend.justification=c(1,0), legend.position=c(1,0))  # legend inside the plot.
grid.arrange(p1, p2, p3, ncol=3)  # arrange







ggplot(mtcars, aes(x=cyl)) + geom_bar(fill='darkgoldenrod2') +
  theme(panel.background = element_rect(fill = 'steelblue'),
        panel.grid.major = element_line(colour = "firebrick", size=3),
        panel.grid.minor = element_line(colour = "blue", size=1))


ggplot(mtcars, aes(x=cyl)) + geom_bar(fill="firebrick") + theme(plot.background=element_rect(fill="steelblue"),
                                                                plot.margin = unit(c(2, 4, 1, 3), "cm")) 


library(grid)
my_grob = grobTree(textGrob("This text is at x=0.1 and y=0.9, relative!\n Anchor point is at 0,0", x=0.1,  y=0.9, hjust=0,
                            gp=gpar(col="firebrick", fontsize=25, fontface="bold")))
ggplot(mtcars, aes(x=cyl)) + geom_bar() + annotation_custom(my_grob) + labs(title="Annotation Example")



plot1 <- ggplot(mtcars, aes(x=cyl)) + geom_bar()
ggsave("myggplot.png")  # saves the last plot.
ggsave("myggplot.png", plot=plot1)  # save a stored ggplot