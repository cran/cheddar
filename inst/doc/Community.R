### R code from vignette source 'Community.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: Community.Rnw:28-41
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
### code chunk number 2: Community.Rnw:132-134
###################################################
data(TL84)  # Load the dataset
print(TL84) # A description of the data


###################################################
### code chunk number 3: Community.Rnw:141-142
###################################################
CommunityPropertyNames(TL84)


###################################################
### code chunk number 4: Community.Rnw:147-148
###################################################
CPS(TL84)


###################################################
### code chunk number 5: Community.Rnw:157-158
###################################################
CPS(TL84, c('lat', 'long'))


###################################################
### code chunk number 6: Community.Rnw:163-168
###################################################
NumberOfNodes(TL84)
NumberOfTrophicLinks(TL84)

# A list containing lat, long, number of nodes and number of trophic links
CPS(TL84, c('lat', 'long', 'NumberOfNodes', 'NumberOfTrophicLinks'))


###################################################
### code chunk number 7: Community.Rnw:171-172
###################################################
CPS(TL84, c('lat', 'long', S='NumberOfNodes', L='NumberOfTrophicLinks'))


###################################################
### code chunk number 8: Community.Rnw:176-178
###################################################
# Returns a list containing 'not a property'=NA
CPS(TL84, c('not a property'))


###################################################
### code chunk number 9: Community.Rnw:186-188
###################################################
NumberOfNodes(TL84)
NodePropertyNames(TL84)


###################################################
### code chunk number 10: Community.Rnw:196-197
###################################################
head(NPS(TL84))


###################################################
### code chunk number 11: Community.Rnw:204-209
###################################################
# Just body mass
head(NPS(TL84, 'M'))

# Body mass and numerical abundance.
head(NPS(TL84, c('M','N')))


###################################################
### code chunk number 12: Community.Rnw:219-220
###################################################
tail(NPS(TL84, c('Log10M', 'Log10N')))


###################################################
### code chunk number 13: Community.Rnw:223-224
###################################################
tail(NPS(TL84, c('Log10M', 'Log10N', 'category', 'phylum')))


###################################################
### code chunk number 14: Community.Rnw:230-231
###################################################
tail(NPS(TL84, c('Log10MNBiomass')))


###################################################
### code chunk number 15: Community.Rnw:237-242
###################################################
nps <- NPS(TL84, c('InDegree','OutDegree','Degree'))
head(nps)

# This is always true for all nodes
all(nps$Degree == nps$InDegree+nps$OutDegree)


###################################################
### code chunk number 16: Community.Rnw:251-255
###################################################
IsCannibal(TL84)['Umbra limi']
InDegree(TL84)["Umbra limi"]
OutDegree(TL84)["Umbra limi"]
Degree(TL84)["Umbra limi"]


###################################################
### code chunk number 17: Community.Rnw:262-263
###################################################
tail(NPS(TL84, c('Log10M', 'OutDegree', 'InDegree', 'Degree')))


###################################################
### code chunk number 18: Community.Rnw:273-275
###################################################
tail(NPS(TL84, c('Log10M', 'PreyAveragedTrophicLevel', 
                 'ChainAveragedTrophicLevel')))


###################################################
### code chunk number 19: Community.Rnw:279-281
###################################################
tail(NPS(TL84, c('Log10M', PATL='PreyAveragedTrophicLevel', 
                 CATL='ChainAveragedTrophicLevel')))


###################################################
### code chunk number 20: Community.Rnw:291-292
###################################################
tail(TrophicSpecies(TL84))


###################################################
### code chunk number 21: Community.Rnw:300-302
###################################################
head(NPS(TL84, list(TS.iso='TrophicSpecies', 
                    TS.no.iso=list('TrophicSpecies', include.isolated=FALSE))))


###################################################
### code chunk number 22: Community.Rnw:318-322
###################################################
head(NPS(TL84, list('category', BM='M', 'NA'='N', 
                    TS=list('TrophicSpecies', include.isolated=FALSE),
                    TH=list('TrophicHeight', include.isolated=FALSE))), 
     10)


###################################################
### code chunk number 23: Community.Rnw:338-339
###################################################
head(NPS(TL84, c('Not a property or function')))


###################################################
### code chunk number 24: Community.Rnw:346-347
###################################################
NumberOfTrophicLinks(TL84)


###################################################
### code chunk number 25: Community.Rnw:358-359
###################################################
head(TLPS(TL84))


###################################################
### code chunk number 26: Community.Rnw:365-368
###################################################
head(TLPS(TL84, node.properties='M'))
head(TLPS(TL84, node.properties=c('M','Biomass')))
head(TLPS(TL84, node.properties=c('M', B='Biomass')))


###################################################
### code chunk number 27: Community.Rnw:383-385
###################################################
data(SkipwithPond)
head(TLPS(SkipwithPond))


###################################################
### code chunk number 28: Community.Rnw:389-390
###################################################
TrophicLinkPropertyNames(SkipwithPond)


###################################################
### code chunk number 29: Community.Rnw:395-396
###################################################
head(TLPS(SkipwithPond, link.properties='link.evidence'))


###################################################
### code chunk number 30: Community.Rnw:407-408
###################################################
head(TLPS(TL84, link.properties='Log10RCMRatio'))


###################################################
### code chunk number 31: Community.Rnw:411-412
###################################################
head(TLPS(TL84, node.properties='Log10M', link.properties='Log10RCMRatio'))


###################################################
### code chunk number 32: Community.Rnw:419-420
###################################################
pm <- PredationMatrix(TL84)


###################################################
### code chunk number 33: Community.Rnw:425-427
###################################################
sum(pm)
NumberOfTrophicLinks(TL84)


###################################################
### code chunk number 34: Community.Rnw:432-434
###################################################
data(Benguela)
pm <- PredationMatrix(Benguela, weight='diet.fraction')


###################################################
### code chunk number 35: Community.Rnw:485-486
###################################################
IsolatedNodes(TL84)


###################################################
### code chunk number 36: Community.Rnw:490-495
###################################################
connectivity <- NPS(TL84, c(Basal='IsBasalNode', 
                            Isolated='IsIsolatedNode', 
                            Intermediate='IsIntermediateNode', 
                            TopLevel='IsTopLevelNode'))
connectivity


###################################################
### code chunk number 37: Community.Rnw:501-502
###################################################
all(1==apply(connectivity, 1, sum))


###################################################
### code chunk number 38: Community.Rnw:505-518
###################################################
sum(FractionBasalNodes(TL84), 
    FractionIntermediateNodes(TL84), 
    FractionTopLevelNodes(TL84), 
    FractionIsolatedNodes(TL84))

sum(FractionConnectedNodes(TL84), 
    FractionIsolatedNodes(TL84))

sum(FractionBasalNodes(TL84), 
    FractionNonBasalNodes(TL84))

sum(FractionTopLevelNodes(TL84), 
    FractionNonTopLevelNodes(TL84))


###################################################
### code chunk number 39: Community.Rnw:534-536
###################################################
tc <- TrophicChains(TL84)
dim(tc)


###################################################
### code chunk number 40: Community.Rnw:540-541
###################################################
head(tc, 20)


###################################################
### code chunk number 41: Community.Rnw:544-548
###################################################
BasalNodes(TL84)
# The first node in each chain
first <- tc[,1]
all(unique(first) %in% BasalNodes(TL84))  # TRUE


###################################################
### code chunk number 42: Community.Rnw:552-556
###################################################
TopLevelNodes(TL84)
# The last node in each chain
last <- apply(tc, 1, function(row) row[max(which(""!=row))])
unique(last)


###################################################
### code chunk number 43: Community.Rnw:562-563
###################################################
tc.with.log10M <- TrophicChains(TL84, node.properties='Log10M')


###################################################
### code chunk number 44: Community.Rnw:568-570
###################################################
data(Benguela)
TopLevelNodes(Benguela)


###################################################
### code chunk number 45: Community.Rnw:572-576
###################################################
tc <- TrophicChains(Benguela)
last <- apply(tc, 1, function(row) row[max(which(""!=row))])
unique(last)
IsIntermediateNode(Benguela)[unique(last)]


###################################################
### code chunk number 46: Community.Rnw:581-582
###################################################
chain.stats <- TrophicChainsStats(TL84)


###################################################
### code chunk number 47: Community.Rnw:585-587
###################################################
length(chain.stats$chain.lengths)    # 5,988 chains
summary(chain.stats$chain.lengths)


###################################################
### code chunk number 48: Community.Rnw:592-593
###################################################
dim(chain.stats$node.pos.counts)    # 56 nodes. Longest chain contains 8 nodes


###################################################
### code chunk number 49: Community.Rnw:596-597
###################################################
chain.stats$node.pos.counts[BasalNodes(TL84),]


###################################################
### code chunk number 50: Community.Rnw:600-601
###################################################
chain.stats$node.pos.counts[c(IntermediateNodes(TL84),TopLevelNodes(TL84)),]


###################################################
### code chunk number 51: Community.Rnw:604-605
###################################################
chain.stats$node.pos.counts[IsolatedNodes(TL84),]


###################################################
### code chunk number 52: Community.Rnw:610-612
###################################################
system.time(tc <- TrophicChains(TL84))
system.time(stats <- TrophicChainsStats(TL84))


###################################################
### code chunk number 53: Community.Rnw:622-649
###################################################
HighlyConnected <- function(n)
{
    # Returns a community containing a single producer and n consumers, all 
    # of whom eat everything else
    consumers <- paste('Consumer', 1:n)
    tl <- data.frame(resource=c(rep('Producer', n), rep(consumers, each=n)), 
                     consumer=consumers)
    return (Community(nodes=data.frame(node=c('Producer',consumers)), 
                      trophic.links=tl, 
                      properties=list(title='test')))
}

# A list of communities of between 1 and 8 consumers
n <- 8
communities <- lapply(1:n, HighlyConnected)

# A list of statistics about each community
stats <- lapply(communities, TrophicChainsStats)

# Extract the chain lengths
cl <- lapply(stats, '[[', 'chain.lengths')

# The number of chains
n.chains <- sapply(cl, length)

# The number of chains in each community
cbind(n.consumers=1:n, longest.chain=sapply(cl, max), n.chains=n.chains)


###################################################
### code chunk number 54: Community.Rnw:654-656
###################################################
cbind(n.consumers=1:n, longest.chain=sapply(cl, max), n.chains=n.chains, 
      factorial.n=factorial(1:n))


###################################################
### code chunk number 55: Community.Rnw:659-661
###################################################
n <- 20
cbind(n.consumers=1:n, longest.chain=1:n, factorial.n=factorial(1:n))


###################################################
### code chunk number 56: Community.Rnw:671-678
###################################################
# Set to a low number to illustrate the error
options(cheddarMaxQueue=10)
tryCatch(TrophicChains(TL84), error=print)

# Default value
options(cheddarMaxQueue=NULL)
chains <- TrophicChains(TL84)


###################################################
### code chunk number 57: Community.Rnw:703-704
###################################################
tail(NPS(TL84, c('PreyAveragedTrophicLevel', 'ChainAveragedTrophicLevel')), 10)


###################################################
### code chunk number 58: Community.Rnw:710-711
###################################################
tail(TrophicLevels(TL84), 10)


###################################################
### code chunk number 59: Community.Rnw:729-731
###################################################
data(Benguela)
head(TLPS(Benguela))


###################################################
### code chunk number 60: Community.Rnw:734-735
###################################################
pm <- PredationMatrix(Benguela)


###################################################
### code chunk number 61: Community.Rnw:738-739
###################################################
pm <- PredationMatrix(Benguela, weight='diet.fraction')


###################################################
### code chunk number 62: Community.Rnw:747-749
###################################################
cbind(PreyAveragedTrophicLevel(Benguela), 
      FlowBasedTrophicLevel(Benguela, weight.by='diet.fraction'))


###################################################
### code chunk number 63: Community.Rnw:756-765
###################################################
InteractionStrength <- function(community)
{
    tlps <- TLPS(community, node.properties='M')
    return ((tlps$consumer.M / tlps$resource.M)^3/4)
}

# The InteractionStrength() function can be used together with TLPS() to 
# compute the theoretical interaction strength between each resource-consumer pair
head(TLPS(Benguela, link.properties='InteractionStrength'))


###################################################
### code chunk number 64: Community.Rnw:769-772
###################################################
cbind(PreyAveragedTrophicLevel(Benguela), 
      FlowBasedTrophicLevel(Benguela, weight.by='diet.fraction'), 
      FlowBasedTrophicLevel(Benguela, weight.by='InteractionStrength'))


###################################################
### code chunk number 65: Community.Rnw:792-797
###################################################
TL84.increasing.M <- OrderCommunity(TL84, 'M', title='Increasing M')
head(NPS(TL84.increasing.M, c('M', 'Degree')))
TL84.increasing.degree <- OrderCommunity(TL84, 'Degree', 
                                         title='Increasing degree')
head(NPS(TL84.increasing.degree, c('M', 'Degree')))


###################################################
### code chunk number 66: Community.Rnw:802-804
###################################################
TL84.category.then.M <- OrderCommunity(TL84, 'category', 'M')
head(NPS(TL84.category.then.M, c('category', 'M')))


###################################################
### code chunk number 67: Community.Rnw:819-824
###################################################
# Increasing M
TL84.increasing.M <- OrderCommunity(TL84, 'M', title='Increasing M')
new.order <- order(PreyAveragedTrophicLevel(TL84), sample(1:56))
TL84.increasing.TL <- OrderCommunity(TL84, new.order=new.order, 
                                     title='Increasing TL')


###################################################
### code chunk number 68: Community.Rnw:833-836
###################################################
getOption("SweaveHooks")[["fig"]]()
par(mfrow=c(1,2))
PlotPredationMatrix(TL84.increasing.M)
PlotPredationMatrix(TL84.increasing.TL)


###################################################
### code chunk number 69: Community.Rnw:841-845
###################################################
SumDietGaps(TL84.increasing.M)
SumDietGaps(TL84.increasing.TL)
SumConsumerGaps(TL84.increasing.M)
SumConsumerGaps(TL84.increasing.TL)


###################################################
### code chunk number 70: Community.Rnw:855-859
###################################################
getOption("SweaveHooks")[["fig"]]()
par(mfrow=c(1,2))
PlotPredationMatrix(TL84.increasing.M, main=SumDietGaps(TL84.increasing.M))
res <- MinimiseSumDietGaps(TL84, n=10)
PlotPredationMatrix(res$reordered, main=SumDietGaps(res$reordered))


###################################################
### code chunk number 71: Community.Rnw:869-877
###################################################
getOption("SweaveHooks")[["fig"]]()
par(mfrow=c(1,2))
PlotPredationMatrix(TL84.increasing.M, 
                    main=paste('Ordered by M - sum consumer gaps', 
                               SumConsumerGaps(TL84.increasing.M)))
res <- MinimiseSumConsumerGaps(TL84, n=10)
PlotPredationMatrix(res$reordered, 
                    main=paste('Optimised - sum consumer gaps', 
                               SumConsumerGaps(res$reordered)))


###################################################
### code chunk number 72: Community.Rnw:885-893
###################################################
NumberOfNodes(TL84)
IsolatedNodes(TL84)
NumberOfTrophicLinks(TL84)

TL84.no.isolated <- RemoveIsolatedNodes(TL84)
NumberOfNodes(TL84.no.isolated)         # Six fewer species
IsolatedNodes(TL84.no.isolated)         # No isolated species
NumberOfTrophicLinks(TL84.no.isolated)  # Number of trophic links unchanged


###################################################
### code chunk number 73: Community.Rnw:897-925
###################################################
NumberOfNodes(TL84)
NumberOfTrophicLinks(TL84)

# Remove the first ten nodes
TL84.r <- RemoveNodes(TL84, 1:10)
NumberOfNodes(TL84.r)
NumberOfTrophicLinks(TL84.r)

# Remove producers
TL84.r <- RemoveNodes(TL84, 'producer'==NP(TL84, 'category'))
NumberOfNodes(TL84.r)
NumberOfTrophicLinks(TL84.r)

# Remove species by name
to.remove <- c("Cryptomonas sp. 1", "Chroococcus dispersus", 
               "Unclassified flagellates", "Chromulina sp.", 
               "Selenastrum minutum", "Trachelomonas sp.")
TL84.r <- RemoveNodes(TL84, to.remove)
NumberOfNodes(TL84.r)
NumberOfTrophicLinks(TL84.r)

# Three different ways of removing node 56 (Umbra limi)
TL84.ra <- RemoveNodes(TL84, 56)
TL84.rb <- RemoveNodes(TL84, 'Umbra limi')
TL84.rc <- RemoveNodes(TL84, c(rep(FALSE,55), TRUE))

identical(TL84.ra, TL84.rb)  # TRUE
identical(TL84.ra, TL84.rc)  # TRUE


###################################################
### code chunk number 74: Community.Rnw:937-945
###################################################
# The behaviours of the different methods
NumberOfNodes(TL84)         # 56 nodes in total
length(BasalNodes(TL84))    # 25 basal nodes
length(IsolatedNodes(TL84)) #  6 isolated nodes

RemoveNodes(TL84, BasalNodes(TL84)) # 56 - 25 = 31 nodes remain
RemoveNodes(TL84, BasalNodes(TL84), method='secondary') # 14 nodes remain
RemoveNodes(TL84, BasalNodes(TL84), method='cascade')   # The 6 isolated nodes remain


###################################################
### code chunk number 75: Community.Rnw:951-959
###################################################
NumberOfNodes(TL84)
Cannibals(TL84)         # 5 species
NumberOfTrophicLinks(TL84)

TL84.no.cannibals <- RemoveCannibalisticLinks(TL84)
NumberOfNodes(TL84.no.cannibals)         # Number of nodes unchanged
Cannibals(TL84.no.cannibals)             # No species
NumberOfTrophicLinks(TL84.no.cannibals)  # 5 fewer trophic links


###################################################
### code chunk number 76: Community.Rnw:970-976
###################################################
NumberOfNodes(TL84)

TL84.lumped <- LumpTrophicSpecies(TL84)

length(unique(TrophicSpecies(TL84)))    # 22 trophic species in TL84...
NumberOfNodes(TL84.lumped)              # ... and 22 nodes in the lumped web


###################################################
### code chunk number 77: Community.Rnw:984-987
###################################################
getOption("SweaveHooks")[["fig"]]()
par(mfrow=c(1,2))
plot(TL84)
plot(TL84.lumped, xlim=range(Log10M(TL84)), ylim=range(Log10N(TL84)))


###################################################
### code chunk number 78: Community.Rnw:995-1008
###################################################
length(which(IsIsolatedNode(TL84)))  # 6 isolated species
IsolatedNodes(TL84)                  # Names of isolated nodes

lump <- NP(TL84, 'node')             # Existing node names

# Give isolated nodes the same lump value
lump[IsolatedNodes(TL84)] <- 'Isolated nodes lumped together'
TL84.lumped <- LumpNodes(TL84, lump)

NumberOfNodes(TL84)         # 56 nodes in unlumped web
NumberOfNodes(TL84.lumped)  # 51 nodes in lumped web

IsolatedNodes(TL84.lumped)  # A single node


###################################################
### code chunk number 79: Community.Rnw:1014-1016
###################################################
lump <- NP(TL84, 'node')
identical(TL84, LumpNodes(TL84, lump, title=CP(TL84, 'title')))


###################################################
### code chunk number 80: Community.Rnw:1022-1040
###################################################
data(YthanEstuary)

# The names of nodes in YthanEstuary
lump <- NP(YthanEstuary, 'node')

# European flounder:
# "Platichthys flesus" and "Platichthys flesus (juvenile)"
# Lump these in to one node
lump["Platichthys flesus (juvenile)"==lump] <- "Platichthys flesus"

# Common eider:
# "Somateria mollissima" and "Somateria mollissima (juvenile)"
# Lump these in to one node
lump["Somateria mollissima (juvenile)"==lump] <- "Somateria mollissima"
YthanEstuary.lumped <- LumpNodes(YthanEstuary, lump)

NumberOfNodes(YthanEstuary)         # 92
NumberOfNodes(YthanEstuary.lumped)  # 90


###################################################
### code chunk number 81: Community.Rnw:1048-1058
###################################################
getOption("SweaveHooks")[["fig"]]()
# Plot the original and lumped communities
par(mfrow=c(1,2))
plot(YthanEstuary, highlight.nodes=c("Platichthys flesus", 
                                     "Platichthys flesus (juvenile)", 
                                     "Somateria mollissima", 
                                     "Somateria mollissima (juvenile)"), 
     show.web=FALSE)
plot(YthanEstuary.lumped, highlight.nodes=c("Platichthys flesus", 
                                            "Somateria mollissima"), 
     show.web=FALSE)


###################################################
### code chunk number 82: Community.Rnw:1065-1077
###################################################
NPS(YthanEstuary.lumped)["Platichthys flesus", c('M','N')]

# These values were computed as follows
nps <- NPS(YthanEstuary)
M <- nps[c("Platichthys flesus", "Platichthys flesus (juvenile)"), 'M']
N <- nps[c("Platichthys flesus", "Platichthys flesus (juvenile)"), 'N']

# Arithmetic mean of N
mean(N)

# N-weighted mean of M
weighted.mean(M, N)


###################################################
### code chunk number 83: Community.Rnw:1081-1088
###################################################
YthanEstuary.lumped2 <- LumpNodes(YthanEstuary, lump, weight.by=NULL)
NPS(YthanEstuary.lumped2)["Platichthys flesus", c('M','N')]

# Computed as the arithmetic means of M and N
mean(M)
mean(N)



