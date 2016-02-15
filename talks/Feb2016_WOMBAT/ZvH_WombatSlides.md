# Wombat - 2016 
Dr Zoe van Havre  
`r Sys.Date()`  












## Who am I?

- PhD in statistics, from QUT \& Paris-Dauphine
    - Honours in Bioinformatics (Griffith), BSc in Statitics (Otago)
- I now live in Brisbane, by way of a few places 
  <div align="center">
  <img height=300 style=" margin: 0; vertical-align: center;" src="Images/ZoesWorld.png"> 
  </div>


## Who am I?

- *Key areas*
    - <img style="width: 18px; height: 18px; margin: 0; vertical-align: center;" src="http://i.stack.imgur.com/DSxUV.png" alt="" scale="0"> Bayesian statistics
    - Mixture and hidden Markov models, 
      <div align="center">
      <img height=100 style=" margin: 0; vertical-align: center;" src="Images/img2.png"> 
      </div>
    - Bio-statistics/informatics/security,
- *Research interests*
    - Data driven, accessible, intuitive tools.
    - **Making data analysis easier!**


## What drives me?

The most common question asked since I started to pursue Statistics has been:

<div class="centered" >
**"Why...?"**
</div>

I can share my three reasons!

1. A sense of urgency,
2. tantalizing hope, and
3. boundless excitement.



## Urgency | Race against inexorable growth

* The exponential growth of computing is not slowing down!

* It is notoriously hard for our brain to really comprehend what this means. 

* If we symbolise ALL of our computational advances to date by this dot $\rightarrow \cdot$

 *  In 10 years this is what we will be dealing with:
 * <img src="Images/1000-dots.png" width=900 alt="1000 dots">



## Hope 
* Opinions are changing fast, and everyone is coming onboard 
* There are low hanging fruits to make better, easier tools.
    * __the traditional way__: adapt asymptotic theory to small sample sizes.
    * __the future__: to take advantage of the _features_ of Big Data (i.e. closer to the underlying truth).

## "Big" data
<div align="center">
<img height="500" src="Images/Mammoth.png" frameborder="0" ></img>
</div>




## Excitement | Better tools make data analysis easier

* Amazing things happen when data analysis combines clear research questions,  appropriate data, and suitable, accessible tools.
      * __Accessibility__: easy to use and to understand what the tool does.
* People can often do more with less. 
* Simple models are less likely to be wrongly used. 
* It doesnt have to be just "analysis"! It can be exploration, discovery, and more than a little exciting. 


## Excitement
* <div align="center">
  <img height="500" src="Images/good_hands.png" frameborder="0" ></img>
  </div>



# A short story about Alzheimer's Disease| featuring... overfitted mixture models!



## Key background

* Alzheimer's Disease (AD) currently affects over 342,800 Australians, and this number is expected to rise to 900,000 by 2050.
* Cognitive changes occur late in the disease ($\geq$ 20 years).
* During this time, AD causes irreversible damage to the brain:
    - accumulation of **amyloid $\beta$**,
    - neurofibrillary tangles, 
    - overall atrophy.
* To better research and treat AD, we need to be able to treat it earlier.


## How?

__Aim: identify individuals likely to be in the early stage of AD.__

* Best detection tool we have:  imaging of __amyloid $\beta$__  
* Data is procesed and aggregated for a set of regions (__"SUVR"__)
  <div align="center">
  <img height="200" src="Images/hc_brain_low.png" frameborder="0" ></img>
  </div>
* SUVR available for 393 individuals
    * 290 HC, and 103 AD 
    
## Data overview |  Histograms of Healthy Controls (HC)

<img src="ZvH_WombatSlides_files/figure-html/unnamed-chunk-4-1.png" title="" alt="" style="display: block; margin: auto;" />


## "Healthy" control...? 

* Traditionally, we compared AD to HC, and so on...
* If all HC are truly healthy, that's great, but some might have the disease.
    - they did not look normally distributed!
* If different types of individuals are present and not modelled specifically, any conclusion drawn from comparing AD to HC may be skewed or entirely invalid. 
  - comparisons are blurred, inference limited
* Our main research interest is causing a problem!



## Undetected things can cause problems...
<div align="center">
<img height="500" src="Images/FarSidePenguin.png" frameborder="0" allowfullscreen></img>


## Modelling hidden subgroups with mixtures
 
 If the distribution of SUVR in each region depends on some unknown number of groups, we can use _overfitted mixture models_, with the package __Zmix__, to model these.
 
* Assumes only that groups are normally distributed.
* Want to explore use of many, simple models 
    * Fit univariate, Normal mixture models with unknown means and variances
    * Assumes nothing about how AD develops, spatially or longitudinally
    * Run HC and AD data separetely too

* This leads to several, relatively simple models, with results we can explore and potentially use for further analyses.


# Overfitting with Zmix

## Overfitted mixture models

We can model an unknown number of groups using **overfitted mixture models**, a Bayesian method found in the R package "Zmix".

* _Model Assumptions_: an unknown number of groups are normally distributed with an unknown mean and variance.   
* _Prior_:  
    * All conditionally conjugate, and $\approx$  non-informative. 
    * __Prior weight of groups is $\approx$ zero.__
    * i.e. If there is no data to support a group, it will be assigned a weight close to zero.
* extra groups __empty out__ of observations, interpretation straightforward
* Bayesian, but not hard, and quite robust.  

## How it's done

Install the package

```r
install_github('zoevanhavre/Zmix') # Thank you Hadley!
library(Zmix)
```

Run the model with $K=5$ groups


```r
### <b> 
Zmix.Y<-Zmix_univ_tempered (Y, iter=50000, k=5)  
### </b>
```

Process the results

```r
Proc.Zmix.Y<-Process_Output_Zmix(Zmix.Y, Burn=25000)
```


[Check out the README for more examples](https://github.com/zoevanhavre/Zmix)


# Results

## Initial results

All regions were found to contain __one or two__ normally distributed groups.

 * We chose to reduce results to the best model for each Region
      * (model averaging is an easy alternative)
 * We also named the groups by increasing mean

------

<slide class="segue dark background">
<hgroup class="auto-fadein">
<h2> What do these groups look like? </h2>
</hgroup>
<article id="sets-article-class" class="h1_class">
</article>
</slide>

## Mixture models: HC data 
<img src="ZvH_WombatSlides_files/figure-html/unnamed-chunk-8-1.png" title="" alt="" style="display: block; margin: auto;" />

## Mixture models: HC and AD data
<img src="ZvH_WombatSlides_files/figure-html/unnamed-chunk-9-1.png" title="" alt="" style="display: block; margin: auto;" />

-----
<slide class="segue dark background">
<hgroup class="auto-fadein">
<h2> OK, let's zoom out </h2>
</hgroup>
<article id="sets-article-class" class="h1_class">
</article>
</slide>


## SUVR by group: HC

<img src="ZvH_WombatSlides_files/figure-html/unnamed-chunk-10-1.png" title="" alt="" style="display: block; margin: auto;" />


## SUVR by group: HC and AD
<img src="ZvH_WombatSlides_files/figure-html/unnamed-chunk-11-1.png" title="" alt="" style="display: block; margin: auto;" />



## Weight of second cluster

<img src="ZvH_WombatSlides_files/figure-html/unnamed-chunk-12-1.png" title="" alt="" style="display: block; margin: auto;" />


------

<slide class="segue dark background">
<hgroup class="auto-fadein">
<h2> Looking at individuals </h2>
</hgroup>
<article id="sets-article-class" class="h1_class">
</article>
</slide>


## Structure of results
<img src="ZvH_WombatSlides_files/figure-html/unnamed-chunk-13-1.png" title="" alt="" style="display: block; margin: auto;" />

------------

<slide class="segue dark background">
<hgroup class="auto-fadein">
<h2> What about other variables? </h2>
</hgroup>
</slide>


HC: "Memory Complainers" by Group
------------------------------

<img src="ZvH_WombatSlides_files/figure-html/unnamed-chunk-14-1.png" title="" alt="" style="display: block; margin: auto;" />


## Genotype by Group

<img src="ZvH_WombatSlides_files/figure-html/unnamed-chunk-15-1.png" title="" alt="" style="display: block; margin: auto;" />




## Summary

* __one__ or __two__ Normal groups likely to be present. 
* Prevalence of 2nd group similar across regions, 
* Allocation to 2nd group highly correlated across individuals,
* Distribution of HC clusters suggests
    - SURV dist uniformly if you remove high mean group
    - high mean groups closely resembles the distribution of SUVR in AD, but shifted to a lower mean




## overview

- data-driven subgroups show a group of individuals appear to be on track to AD
- this can be corroborated with additional comparisons
- could compute aggregate posterior probabilities across models
    - i.e. cummulative probability of being allocated to a larger group for each individuals 
- but locating second groups also allows us to proceed with more elaborate analyses
- more importantly, it allows us to improve metrics which target the early stages of the diease 
    - Can focus on prediction for putative __early AD__ group, etc
    - _Easier_: metrics derived from __AD VS HC__ comparisons can be updated to use  __early AD__ instead of  AD
    


------
<div align="center">
<iframe width="560" height="315" src="http://www.youtube.com/embed/9bZkp7q19f0?rel=0" frameborder="0" allowfullscreen></iframe>
   </iframe>
</div>




------

<slide class="segue dark background">
<hgroup class="auto-fadein">
<h2>Light Fade</h2>
</hgroup>
<article id="sets-article-class" class="h1_class">
</article>
</slide>
