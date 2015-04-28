## This script will analyze the fit of a
## BM model to the evoltuion of chromosome number in
## each genera being studied using the Arbutrus approach. 
## Heath Blackmon
## 28 April 2015
## coleoguy@gmail.com

load("../results/genera.bm")
arbutus(x = foo, nsim=10)



taxa   <- c('Bembidion', 'Calathus', 'Chrysolina', 
            'Cicindela', 'Cytronus', 'Dendroctonus', 
            'Diabrotica', 'Harpalus', 'Ips', 'Pimelia', 
            'Pterostichus', 'Timarcha')


for(j in 1:length(taxa)){
  data <- read.csv(paste("../data/genus.data.trees/",
                         taxa[j], 
                         "/data.csv", 
                         sep = ""))
  chrom <- as.numeric(data[,2])
  names(chrom) <- data[,1]

  
    tree <- read.tree(paste("../data/genus.data.trees/", 
                            taxa[j], 
                            "/", 
                            taxa[j], 
                            i,
                            ".tree", 
                            sep=""))
    foo <- fitContinuous(phy=tree, dat=chrom, model="BM")
  }
  results[[j]] <- group.results
}



test <- vector()
for(i in 1:40) {
  test[i] <- names.chrom[i] %in% names.tree
}


# this code just illustrates an issue that stumped me for a while
# it appears that arbutus function requires the tree$tip.label and
# data names to be in the same order even though the original model
# fitting approach may not.
data(finch)
phy <- finch$phy
data <- finch$data[,"wingL"]
# we create a second dataset with the order of taxa randomized
data2 <- sample(data, size=13)
# below we fit both sets of data and 
# fitContinuous performs the same in both cases
fit.bm1 <- fitContinuous(phy=phy, dat=data, model="BM", control=list(niter=10))
fit.bm2 <- fitContinuous(phy=phy, dat=data2, model="BM", control=list(niter=10))
# this one works fine
arbutus(fit.bm1, nsim=10)
# this one fails check.tree.data
arbutus(fit.bm2, nsim=10)


