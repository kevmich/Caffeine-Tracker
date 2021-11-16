library(jsonlite)
library(plumber)
library(ggplot2)
library(dplyr)

#* Health Check - Is the API running 
#* @post /caffeine-formula 

CurrentCaffeineLevels <- function(mg, star, en){
  mg <- as.numeric(mg)
  start <- (as.numeric(star) + as.numeric(21600))
  end <- (as.numeric(en) + as.numeric(21600))
  n <- 12
  n <- as.numeric(n)
  currentTime <- as.numeric(Sys.time())
  timeElapsed <<- (as.numeric(currentTime) - as.numeric(end))/3600
  print("Time Elapsed")
  print(timeElapsed)
 ## hours <- as.numeric(format(as.POSIXct(currentTime), format = "%H"))
  
##  minutes <- (as.numeric(format(as.POSIXct(currentTime), format = "%M"))/60)
  
  if((timeElapsed) > 6){
    return("to much time has pasted since you drank the caffeine")
    break
 }
  
  caffeine <- ((as.numeric(mg)/as.numeric(n)))
  print(caffeine)
  data <- c(caffeine)
  print(data)
  
  timelist <- c(0)
  
  stepSize <- ((as.numeric(end)-as.numeric(start))/3600)/n
  
  for(i in seq(from = 1, to = n-1, by=1)){
    
    caffeine <- (mg/n)+(caffeine*exp(-.11*(stepSize)))
    print(caffeine)
    
    data <- append(data, caffeine)
    timelist <- append(timelist, as.numeric(i*stepSize))
  }
  
  print(data)
  
  
  
  
  ## currentTime <- hours + minutes
  
  t <- (as.numeric(currentTime) - as.numeric(end))/3600
  newt <- (as.numeric(currentTime)- as.numeric(start))/3600
  print(stepSize)
  print(t)
  
  numSteps <- (as.integer(as.numeric(t)/as.numeric(stepSize)))
  print(numSteps)
  
  for(j in seq(from = 1, to = numSteps+1, by=1)){
    print(j)
    currentCaffeine <- caffeine * exp(-.11*stepSize*j)
    print(currentCaffeine)
    data <- append(data, currentCaffeine)
    timelist <- append(timelist, as.numeric(as.numeric(timelist[i+1])+(j*stepSize)))
  }
  
  caffeine <- caffeine * exp(-.11*t)
  data <- append(data, caffeine)
  #print(data)
  timelist <- append(timelist, newt)
  #print(timelist)
  
  frame <- data.frame(timelist, data)
  #print(frame)
  x <- toJSON(frame)
  
  print(x)
  
  return(x)
  
}
