# Wombat - 2016 
Dr Zoe van Havre  










## Who am I?

- PhD in statistics, from QUT \& Paris-Dauphine
- I live in Brisbane, by way of Canada, New Zealand, and various places in between.
- *Key areas*:
    - <img style="width: 18px; height: 18px; margin: 0; vertical-align: center;" src="http://i.stack.imgur.com/DSxUV.png" alt="" scale="0"> Bayesian statistics
    - Mixture and hidden Markov models, 
    - Bio-statistics/informatics/security,
- *Research interests*
    - data driven, accessible, intuitive tools
    - **making data analysis easier**


## What drives me?

The most common question asked since I started to pursue Statistics has been

<div class="centered">
**"Why...?"**
</div>

- I have three reasons:

1. A sense of urgency,
2. tantalizing hope,
3. boundless excitement.



# Urgency?

## Can we keep up?

- The exponential growth of computing has not slowed down.
- New types of data and new challenges require new approaches
- in 10 years, expecting to see 1000 times growth
 
------
to do: DIAGRAM 1
-------
to do: DIAGRAM 2
----------------




# Hope...


## Not all change is bad
- Everyone is coming onboard! amazing advances
- Data-science is a thing now
- We are standing on a methodological goldmine...
    - **the traditional way**: 
        - Adapt methods based on large sample theory for realistic sample sizes
    - **the future...?** 
        - Rework common methods to be closer to underlying theory
        - This might mean going Bayesian, yes. Sorry. 

-----

</div>
<div align="center">
<img height="600" src="Images/Mammoth.png" frameborder="0" ></img>

</div>
            
<!--We don't need to rework the wheel, just take off the tread.-->
<!--Asymptotic theory $\rightarrow$ Methods $\rightarrow$ Big Data  $\rightarrow$ Theoretically Supported Results-->
    

# Excitement!

## Better tools make data analysis easier
Amazing things happen when data analysis combines clear research questions,  appropriate data, and suitable, accessible tools.

* Accessibility: usability, and understanding what the tool does.  
     _Hammers and nails do not come with instruction manuals._
* People can sometimes do more with less.
* Simple models are less likely to be wrongly used. 

> It doesnt have to be just "analysis", it can be exploration, discovery, and a little bit magical. 



# A short story about Alzheimer's Disease| featuring... overfitted mixture models!



## Key background

Alzheimer's Disease (AD) currently affects over 342,800 Australians, and this number is expected to rise to 900,000 by 2050.

Cognitive changes indicate something is amiss, but these occur late in the disease ($\geq$ 20 years).

During this time, AD causes irreversible damage to the brain:

> - accumulation of **amyloid $\beta$**,
> - neurofibrillary tangles, 
> - overall atrophy.

To better research and treat AD, we need to be able to treat it earlier.


## How can we help improve early detection

To better tackle AD, we need to be able to treat it earlier.

__Goal: identify individuals likely to be in the early stage of AD.__

* Large repository of data exists thanks to AIBL study  (REF)
* SUVR available for 393 individuals, for a set of _brain regions_ (pre-processed)
    * 290 HC, 103 AD 
* Traditionally first thing to do is compare AD to HC, of course
* But some of the clinically "Healthy" HC individuals these must be in _early stage AD_

-------


<div align="center">
<img height="600" src="Images/FarSidePenguin.jpg" frameborder="0" allowfullscreen></img>


-----------

* If different types of individuals are present and not modelled, any conclusion drawn from comparing AD to HC may be skewed or entirely invalid. 
* Our research problem is causing a problem...  
* Assume distribution of SUVR in each region _may_ depend on unknown number of groups
* Assume these are normally distributed
* Assume nothing about how AD develops spatially and longitudinally
    * Model each region separetely.
* We want to know if there are subgroups in the HC irrespective of AD results
    * Model HC and AD seperately.
* this leads to several, relatively simple models, but with a lot of unknowns
    * number of groups, all group parameters
* Overfitted mixture models can be useful here.

## The Data

The study consists of 507 individuals, composed of Healthy Controls (HC), MCI, and AD patients.


```
## 
##  AD MCI  HC 
## 103 114 290
```

------

![](ZvH_WombatSlides_files/figure-html/unnamed-chunk-4-1.png)

# Overfitting with Zmix

## Overfitted mixture models
We can model an unknown number of groups using **overfitted mixture models**, a Bayesian method found in the R package "Zmix".

  * too many groups are included in a mixture model
  * extra groups __empty out__
  * probability of number of occupied groups  
  * data driven and fully parametric
  * Bayesian, but straightforward 
  * Assumes only that up to $K$ groups are normally distributed with an unknown mean and variance. 

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


--------------

![](ZvH_WombatSlides_files/figure-html/unnamed-chunk-8-1.png)


--------------

![](ZvH_WombatSlides_files/figure-html/unnamed-chunk-9-1.png)![](ZvH_WombatSlides_files/figure-html/unnamed-chunk-9-2.png)![](ZvH_WombatSlides_files/figure-html/unnamed-chunk-9-3.png)![](ZvH_WombatSlides_files/figure-html/unnamed-chunk-9-4.png)

-----------

![](ZvH_WombatSlides_files/figure-html/unnamed-chunk-10-1.png)![](ZvH_WombatSlides_files/figure-html/unnamed-chunk-10-2.png)![](ZvH_WombatSlides_files/figure-html/unnamed-chunk-10-3.png)![](ZvH_WombatSlides_files/figure-html/unnamed-chunk-10-4.png)



----------
![](ZvH_WombatSlides_files/figure-html/unnamed-chunk-11-1.png)

-----------

![](ZvH_WombatSlides_files/figure-html/unnamed-chunk-12-1.png)

## Results overview

* Zmix found either __one__ or __two__ groups 
* Majority of regions result in two clusters, 
* Prevalence of 2nd group similar across regions, 
* Allocations to 2nd group highly correlated (across individuals)
* The HC clusters with larger means resemble the distribution of SUVR in AD, shifted to a lower mean, (as would be expected in early stages of the disease).
* They also follow a similar pattern across regions to AD 

-------

![](ZvH_WombatSlides_files/figure-html/unnamed-chunk-13-1.png)

-------------


![](ZvH_WombatSlides_files/figure-html/unnamed-chunk-14-1.png)


---  
<img class="fill" src="Images/hc_diff_means.png" style="width: 800px"/>

<div class="notes">
This is my *note*.

- It can contain markdown
- like this list

</div>



------
<div align="center">
<iframe width="560" height="315" src="http://www.youtube.com/embed/9bZkp7q19f0?rel=0" frameborder="0" allowfullscreen></iframe>
   </iframe>
</div>
