#  Cheddar release history

## 0.1-622 Released 2013-03-19
#### Improvements
* [Issue 15](https://github.com/quicklizard99/cheddar/issues/21)
  Some units tests are testing equality of computed values

#  Cheddar release history

## 0.1-621 Released 2013-03-09

#### Improvements
* [Issue 15](https://github.com/quicklizard99/cheddar/issues/21)
  Some units tests are testing equality of computed values

## 0.1-620 Released 2013-01-22
#### Bugs fixed
* [Issue 17](https://github.com/quicklizard99/cheddar/issues/17)
  The title for PlotAuppervAlower plots is odd

#### Improvements
* [Issue 15](https://github.com/quicklizard99/cheddar/issues/15) 
  MinimiseSumDietGaps and MinimiseSumConsumerGaps do not replicate
* [Issue 16](https://github.com/quicklizard99/cheddar/issues/16) 
  PlotPredationMatrix does not permit different resource and consumer orderings
* [Issue 18](https://github.com/quicklizard99/cheddar/issues/18)
  A function to calculate log N versus log M convex hull
* [Issue 19](https://github.com/quicklizard99/cheddar/issues/19)
  Pyramid functions lack flexibility
* [Issue 20](https://github.com/quicklizard99/cheddar/issues/20)
  PlotNvM() and friends always shows nodes that lack X and/or Y

#### Miscellaneous
* Fixed some typos in vignettes

## 0.1-619 Released 2012-11-22
**Available on CRAN**

#### Miscellaneous
* Fixed problem with example code in help pages LoadCommunity / SaveCommunity 
and LoadCollection / SaveCollection

## 0.1-618 Released 2012-11-20
**Available on CRAN**

#### Bugs fixed
* [Issue 13](https://github.com/quicklizard99/cheddar/issues/13) 
  Plot pyramid functions fail for some communities

#### Improvements
* [Issue 11](https://github.com/quicklizard99/cheddar/issues/11)
  PredationMatrixToLinks requires a square predation matrix with 
  ncol=nrow=number of nodes enhancement
* [Issue 12]() Improvements to enumerating trophic chains
* [Issue 14]() LoadCommunity and SaveCommunity restrict options

## 0.1-617 Released 2012-10-25

#### Bugs fixed
* [Issue 10](https://github.com/quicklizard99/cheddar/issues/10)
  AggregateCommunities fails for certain communities

## 0.1-616 Released 2012-09-24
**Available on CRAN**

#### Miscellaneous
* Fixed some minor mistakes in help files
* Added some missing journal names in vignette references

## 0.1-615 Released 2012-09-24

#### Bugs fixed
* [Issue 2](https://github.com/quicklizard99/cheddar/issues/2)
  MinimiseSumDietGaps and MinimiseSumConsumerGaps returns community with 
  incorrect title
* [Issue 4](https://github.com/quicklizard99/cheddar/issues/4) 
  Graph legend produced by FormatLM() does not show r squared correctly on a Mac
* [Issue 5](https://github.com/quicklizard99/cheddar/issues/5)
  Columns returned by CollectionCPS() show empy categories as 'V1'
* [Issue 6](https://github.com/quicklizard99/cheddar/issues/6)
  NvMSlopeByClass() and friends should give NA for categories where all nodes 
  have N and/or M of NA

#### Improvements
* [Issue 3](https://github.com/quicklizard99/cheddar/issues/3)
  Inconsistent references style in vignettes
* [Issue 7](https://github.com/quicklizard99/cheddar/issues/7)
  ImportExport vignette needs more export examples enhancement
* [Issue 8](https://github.com/quicklizard99/cheddar/issues/8)
  SumMByClass(), SumNByClass() and SumBiomassByClass() do not allow 
  user-control of NA behaviour
* [Issue 9](https://github.com/quicklizard99/cheddar/issues/9)
  PlotNPS() always shows nodes that lack X and/or Y

#### Miscellaneous
* Added information about link strengths to PlotsAndStats vignette
* Added genus and species node properties to communities that have 
  classification: Broadstone, Millstream, SkipwithPond, TL84, TL86 and 
  YthanEstuary
* Citeable sources for classification for Broadstone, Millstream, SkipwithPond, 
  TL84, TL86 and YthanEstuary

## 0.1-614 Released 2012-07-23
**First release available on CRAN**

#### Bugs fixed
* [Issue 1](https://github.com/quicklizard99/cheddar/issues/1)
  Does not build on Solaris - C99 function isfinite() not present

## 0.1-613 Released 2012-07-16
**First release submitted to CRAN**
