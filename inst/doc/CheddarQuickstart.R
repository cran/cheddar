### R code from vignette source 'CheddarQuickstart.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: CheddarQuickstart.Rnw:28-41
###################################################
options(warn=2)

library(cheddar)

# Makes copy-paste much less painful
options(continue=' ')
options(width=90)
options(prompt='> ')

options(SweaveHooks = list(fig=function() par(mgp=c(2.5,1,0), 
                                              mar=c(4,4,2,1),
                                              oma=c(0,0,1,0),
                                              cex.main=0.8)))


###################################################
### code chunk number 2: CheddarQuickstart.Rnw:61-65
###################################################
data(TL84)      # Load the dataset
print(TL84)     # A description of the data
NumberOfNodes(TL84)
NumberOfTrophicLinks(TL84)


###################################################
### code chunk number 3: CheddarQuickstart.Rnw:69-73
###################################################
head(NPS(TL84, c('category', 
                 'Log10MNBiomass', 
                 TS='TrophicSpecies', 
                 TL='PreyAveragedTrophicLevel')), 10)


###################################################
### code chunk number 4: CheddarQuickstart.Rnw:84-85
###################################################
getOption("SweaveHooks")[["fig"]]()
PlotNPS(TL84, 'Log10M', 'Log10N')


###################################################
### code chunk number 5: CheddarQuickstart.Rnw:94-98
###################################################
getOption("SweaveHooks")[["fig"]]()
PlotNvM(TL84)
models <- NvMLinearRegressions(TL84)
colours <- PlotLinearModels(models)
legend("topright", sapply(models, FormatLM), lty=1, col=colours)


###################################################
### code chunk number 6: CheddarQuickstart.Rnw:104-105
###################################################
getOption("SweaveHooks")[["fig"]]()
PlotNPS(TL84, 'Log10M', 'PreyAveragedTrophicLevel')


###################################################
### code chunk number 7: CheddarQuickstart.Rnw:114-115
###################################################
getOption("SweaveHooks")[["fig"]]()
PlotTLPS(TL84, 'resource.Log10M', 'consumer.Log10M')


###################################################
### code chunk number 8: CheddarQuickstart.Rnw:123-124
###################################################
getOption("SweaveHooks")[["fig"]]()
PlotPredationMatrix(TL84)


###################################################
### code chunk number 9: CheddarQuickstart.Rnw:133-146
###################################################
data(pHWebs)
CollectionCPS(pHWebs, 
              c('lat', 
                'long',
                'pH', 
                S='NumberOfNodes', 
                L='NumberOfTrophicLinks', 
                'L/S'='LinkageDensity',  
                C='DirectedConnectance', 
                Slope='NvMSlope', 
                B='FractionBasalNodes', 
                I='FractionIntermediateNodes', 
                T='FractionTopLevelNodes'))


