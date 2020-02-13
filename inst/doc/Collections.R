### R code from vignette source 'Collections.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: Collections.Rnw:32-43
###################################################
library(cheddar)

# Makes copy-paste much less painful
options(continue=' ')
options(prompt='> ')
options(width=90)

options(SweaveHooks = list(fig=function() par(mgp=c(2.5,1,0), 
                                              mar=c(4,4,2,1),
                                              oma=c(0,0,1,0),
                                              cex.main=0.8)))


###################################################
### code chunk number 2: Collections.Rnw:82-84
###################################################
data(pHWebs)
pHWebs


###################################################
### code chunk number 3: Collections.Rnw:88-103
###################################################
length(pHWebs)
is.list(pHWebs)
names(pHWebs)

# Access first community in the collection
pHWebs[[1]]

# Access a community by name
pHWebs[['Broadstone']]

# The number of trophic links in Broadstone
NumberOfTrophicLinks(pHWebs[['Broadstone']])

# The number of trophic links in each of the ten webs
sapply(pHWebs, 'NumberOfTrophicLinks')


###################################################
### code chunk number 4: Collections.Rnw:110-112 (eval = FALSE)
###################################################
## length(pHWebs) <- 2 # You can't do this
## pHWebs[1] <- "This will not work"


###################################################
### code chunk number 5: Collections.Rnw:117-118
###################################################
all(FALSE==duplicated(names(pHWebs)))


###################################################
### code chunk number 6: Collections.Rnw:128-136
###################################################
# Returns a new CommunityCollection that contains every other web
pHWebs[seq(1, 10, by=2)]

# Returns a new CommunityCollection with the order reversed
pHWebs[10:1]

# Returns a new CommunityCollection containing only these two webs
pHWebs[c('Old Lodge','Bere Stream')]


###################################################
### code chunk number 7: Collections.Rnw:142-143
###################################################
CollectionCPS(pHWebs)


###################################################
### code chunk number 8: Collections.Rnw:164-166
###################################################
res <- CollectionCPS(pHWebs, properties=c('pH', 'NumberOfNodes'))
res


###################################################
### code chunk number 9: Collections.Rnw:170-172
###################################################
model <- lm(NumberOfNodes ~ pH, data=res)
model


###################################################
### code chunk number 10: Collections.Rnw:175-176
###################################################
summary(model)


###################################################
### code chunk number 11: Collections.Rnw:185-187
###################################################
getOption("SweaveHooks")[["fig"]]()
with(res, plot(pH, NumberOfNodes, pch=19))
abline(model)


###################################################
### code chunk number 12: Collections.Rnw:197-202
###################################################
CollectionCPS(pHWebs, c('pH',
                        'NumberOfNodes',
                        'NumberOfTrophicLinks', 
                        'DirectedConnectance',
                        'NvMSlope'))


###################################################
### code chunk number 13: Collections.Rnw:205-210
###################################################
CollectionCPS(pHWebs, c('pH',
                        S='NumberOfNodes',
                        L='NumberOfTrophicLinks', 
                        C='DirectedConnectance',
                        Slope='NvMSlope'))


###################################################
### code chunk number 14: Collections.Rnw:217-223
###################################################
CollectionCPS(pHWebs, c('pH',
                        S='NumberOfNodes',
                        L='NumberOfTrophicLinks', 
                        C='DirectedConnectance',
                        Slope='NvMSlope',
                        'SumBiomassByClass'))


###################################################
### code chunk number 15: Collections.Rnw:227-233
###################################################
CollectionCPS(pHWebs, c('pH',
                        S='NumberOfNodes',
                        L='NumberOfTrophicLinks', 
                        C='DirectedConnectance',
                        Slope='NvMSlope',
                        B='SumBiomassByClass'))


###################################################
### code chunk number 16: Collections.Rnw:242-248
###################################################
CollectionCPS(pHWebs, list('pH',
                           S='NumberOfNodes',
                           L='NumberOfTrophicLinks', 
                           C='DirectedConnectance',
                           Slope='NvMSlope',
                           B=list('SumBiomassByClass', na.rm=TRUE)))


###################################################
### code chunk number 17: Collections.Rnw:251-255
###################################################
CollectionCPS(pHWebs, c(Basal='FractionBasalNodes', 
                        Intermediate='FractionIntermediateNodes', 
                        TopLevel='FractionTopLevelNodes', 
                        Isolated='FractionIsolatedNodes'))


###################################################
### code chunk number 18: Collections.Rnw:262-270
###################################################
getOption("SweaveHooks")[["fig"]]()
properties <- CollectionCPS(pHWebs, c(S='NumberOfNodes', 
                                      L='NumberOfTrophicLinks', 
                                      'LinkageDensity', 
                                      C='DirectedConnectance'))
par(mfrow=c(1,3))
with(properties, plot(S, L, pch=19))
with(properties, plot(S, LinkageDensity, pch=19))
with(properties, plot(S, C, pch=19))


###################################################
### code chunk number 19: Collections.Rnw:279-280
###################################################
head(CollectionNPS(pHWebs))


###################################################
### code chunk number 20: Collections.Rnw:284-292
###################################################
# A subset of first-class properties
head(CollectionNPS(pHWebs, 'M'))

# Several properties
head(CollectionNPS(pHWebs, c('M','N','Biomass','Degree','IsBasalNode')))

# Named properties
head(CollectionNPS(pHWebs, c('M','N',B='Biomass', 'Degree', Basal='IsBasalNode')))


###################################################
### code chunk number 21: Collections.Rnw:298-299
###################################################
head(CollectionTLPS(pHWebs))


###################################################
### code chunk number 22: Collections.Rnw:302-303
###################################################
head(CollectionTLPS(pHWebs, 'M'))


###################################################
### code chunk number 23: Collections.Rnw:306-307
###################################################
head(CollectionTLPS(pHWebs, c('M','N','Biomass','Degree','IsBasalNode')))


###################################################
### code chunk number 24: Collections.Rnw:310-311
###################################################
head(CollectionTLPS(pHWebs, c('M','N', B='Biomass', D='Degree', Basal='IsBasalNode')))


###################################################
### code chunk number 25: Collections.Rnw:322-323
###################################################
getOption("SweaveHooks")[["fig"]]()
plot(pHWebs)


###################################################
### code chunk number 26: Collections.Rnw:329-330
###################################################
getOption("SweaveHooks")[["fig"]]()
plot(pHWebs, xlim=c(-14,6), ylim=c(-3,13))


###################################################
### code chunk number 27: Collections.Rnw:338-339
###################################################
getOption("SweaveHooks")[["fig"]]()
plot(pHWebs, plot.fn=PlotWebByLevel)


###################################################
### code chunk number 28: Collections.Rnw:344-345
###################################################
getOption("SweaveHooks")[["fig"]]()
plot(pHWebs, plot.fn=PlotWebByLevel, ylim=c(1, 4.5))


###################################################
### code chunk number 29: Collections.Rnw:356-358
###################################################
getOption("SweaveHooks")[["fig"]]()
plot(pHWebs, plot.fn=PlotNPS, X='Log10M', Y='PreyAveragedTrophicLevel', 
     show.web=FALSE, highlight.nodes=NULL, xlim=c(-14,6), ylim=c(1,4.2))


###################################################
### code chunk number 30: Collections.Rnw:363-365
###################################################
getOption("SweaveHooks")[["fig"]]()
plot(pHWebs, plot.fn=PlotTLPS, X='consumer.Log10M', 
     Y='resource.Log10M', xlim=c(-2.5, 5.5), ylim=c(-13.8, 5.5))


###################################################
### code chunk number 31: Collections.Rnw:402-406
###################################################
# Bere Stream has some isolated nodes
CollectionCPS(pHWebs, 'FractionIsolatedNodes')
pHWebs.no.iso <- CollectionApply(pHWebs, RemoveIsolatedNodes)
CollectionCPS(pHWebs.no.iso, 'FractionIsolatedNodes')   # All 0


###################################################
### code chunk number 32: Collections.Rnw:410-414
###################################################
# The number of cannibals in each community
sapply(pHWebs, function(community) length(Cannibals(community)))
pHWebs.no.can <- CollectionApply(pHWebs, RemoveCannibalisticLinks)
sapply(pHWebs.no.can, function(community) length(Cannibals(community)))


###################################################
### code chunk number 33: Collections.Rnw:419-422
###################################################
head(CollectionNPS(pHWebs))
pHWebs.by.M <- CollectionApply(pHWebs, OrderCommunity, 'M')
head(CollectionNPS(pHWebs.by.M))


###################################################
### code chunk number 34: Collections.Rnw:425-427
###################################################
pHWebs.by.M <- CollectionApply(pHWebs, OrderCommunity, 'M', na.last=FALSE)
head(CollectionNPS(pHWebs.by.M))


###################################################
### code chunk number 35: Collections.Rnw:435-437
###################################################
pHWebs.decreasing.pH <- OrderCollection(pHWebs, 'pH', decreasing=TRUE)
CollectionCPS(pHWebs.decreasing.pH)


###################################################
### code chunk number 36: Collections.Rnw:440-442
###################################################
pHWebs.name <- OrderCollection(pHWebs, 'title')
CollectionCPS(pHWebs.name)


###################################################
### code chunk number 37: Collections.Rnw:445-447
###################################################
pHWebs.n.nodes <- OrderCollection(pHWebs, 'NumberOfNodes')
CollectionCPS(pHWebs.n.nodes, c('pH', 'lat', 'NumberOfNodes'))


###################################################
### code chunk number 38: Collections.Rnw:452-454
###################################################
pHWebs.n.nodes.and.lat <- OrderCollection(pHWebs, 'NumberOfNodes', 'lat')
CollectionCPS(pHWebs.n.nodes.and.lat, c('pH', 'lat', 'NumberOfNodes'))


###################################################
### code chunk number 39: Collections.Rnw:466-469
###################################################
data(Millstream)
Millstream
names(Millstream)


###################################################
### code chunk number 40: Collections.Rnw:473-475
###################################################
nps <- CollectionNPS(Millstream)
nps['Synorthocladius sp.'==nps$node,c('community','M','N')]


###################################################
### code chunk number 41: Collections.Rnw:479-483
###################################################
aggregation1 <- AggregateCommunities(Millstream, weight.by='N')

# Satisfy ourselves that each node has been included in the aggregated community
all(sort(unique(nps$node))==sort(NPS(aggregation1)$node))


###################################################
### code chunk number 42: Collections.Rnw:487-488
###################################################
NPS(aggregation1)['Synorthocladius sp.',c('M','N')]


###################################################
### code chunk number 43: Collections.Rnw:491-497
###################################################
# Arithmetic mean of N
mean(nps['Synorthocladius sp.'==nps$node,'N'])

# N-weighted mean of M
weighted.mean(nps['Synorthocladius sp.'==nps$node,'M'], 
              nps['Synorthocladius sp.'==nps$node,'N'])


###################################################
### code chunk number 44: Collections.Rnw:502-511
###################################################
aggregation2 <- AggregateCommunities(Millstream, weight.by=NULL)

NPS(aggregation2)['Synorthocladius sp.',c('M','N')]

# Arithmetic mean of M
mean(nps['Synorthocladius sp.'==nps$node,'M'])

# Arithmetic mean of N
mean(nps['Synorthocladius sp.'==nps$node,'N'])


###################################################
### code chunk number 45: Collections.Rnw:518-521
###################################################
tlps <- CollectionTLPS(Millstream)
tlps['Synorthocladius sp.'==tlps$resource | 
     'Synorthocladius sp.'==tlps$consumer,]


###################################################
### code chunk number 46: Collections.Rnw:524-525
###################################################
TrophicLinksForNodes(aggregation1, 'Synorthocladius sp.')


###################################################
### code chunk number 47: Collections.Rnw:531-534
###################################################
CollectionCPS(Millstream)

data.frame(CPS(aggregation1))


###################################################
### code chunk number 48: Collections.Rnw:543-544
###################################################
CollectionCPS(pHWebs[c('Duddon Pike Beck', 'Mosedal Beck')])


###################################################
### code chunk number 49: Collections.Rnw:548-549
###################################################
CollectionCPS(AggregateCommunitiesBy(pHWebs, 'lat'))


###################################################
### code chunk number 50: Collections.Rnw:564-580
###################################################
data(TL84, TL86)
TL <- CommunityCollection(list(TL84, TL86))
# TL.aggregated is a new Community object containing every species in the TL
all.TL <- AggregateCommunities(TL)    

# Generate a factor of categories
nps <- NPS(all.TL, c('node', 'category'))
categories <- factor(nps$category, levels=c('producer', 'invertebrate', 
                                            'vert.ecto'))

# Order all.TL by categories
all.TL <- OrderCommunity(all.TL, new.order=order(categories, nps$node))

# Create the mapping from node name to ID
map <- 1:NumberOfNodes(all.TL)
names(map) <- unname(NP(all.TL, 'node'))


###################################################
### code chunk number 51: Collections.Rnw:585-589
###################################################
data.frame(ID=1:NumberOfNodes(all.TL), 
           NPS(all.TL, c(Species='node', Category='category', 
                         'M', 'N', TL='PreyAveragedTrophicLevel')), 
           row.names=NULL)


###################################################
### code chunk number 52: Collections.Rnw:601-608
###################################################
getOption("SweaveHooks")[["fig"]]()
par(mfrow=c(1,2))
for(community in TL)
{
    PlotNvM(community, show.nodes.as='labels', show.web=FALSE, 
            node.labels=map[NP(community, 'node')], xlim=c(-14, 0), 
            ylim=c(-2, 10))
}


