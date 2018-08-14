
1+3 # Run: cmd + enter
# Comment: cmd + shift + C

# Common functions
# log2(4)
# cos(2)

# Two ways of help
?log # Help of ?
help(log) # Help of ?

??sin
log() # Auto-complete: Tab

# Quick R, Cookbook for R
# https://www.r-graph-gallery.com/
# https://www.rstudio.com/wp-content/uploads/2016/10/r-cheat-sheet-3.pdf

# Comparison
1 == 2
1 < 2
1 <= 2
1 > 2;

# Variables
x = 10 # inside/outside of functions
y <- 10 # Assign operators: only outside of functions
x+y
# 1variable # Not allowed

#Vectorisation
vector = c(10,20,35)
log(vector)
logical_vector = c(TRUE,FALSE,TRUE)
chr_vector = c("cat","dog","chair")
ls() #list all variables
rm(chr_vector) #remove variables
