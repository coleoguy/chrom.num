## This script will analyze the fit of a
## BM model to the evoltuion of chromosome number in
## each genera being studied using the Arbutrus approach. 
## Heath Blackmon
## 28 April 2015
## coleoguy@gmail.com

load("../results/genera.bm")
taxa   <- c('Bembidion', 'Calathus', 'Chrysolina', 
            'Cicindela', 'Cytronus', 'Dendroctonus', 
            'Diabrotica', 'Harpalus', 'Ips', 'Pimelia', 
            'Pterostichus', 'Timarcha')


plot(arbutus(results[[12]][[1]]))

# now lets loop through and combine 
# all the arbutus results across trees
for(i in 1:12){
  for(j in 1:100){
    
  }
}