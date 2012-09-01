Dispersal Diversity : Statistics and Tests
------------------------------------------

R functions for calculating dispersal diversity statistics and making
comparisons involving dispersal diversity statistics (Scofield et al. in
review).  All functions take as input a simple data structure: a table of site
(rows) by source (columns) counts.  Though we originally developed the
diversity tests to understand seed dispersal in plant populations, the tests
themselves should be useful for any diversity data (such as biodiversity of
plant communities, etc.) that can be expressed with this same data structure.

The `pmiDiversity.R` and `diversityTest.r` source files are required for
performing diversity tests.  If all that is desired are PMI (Grivet et al.
2005, Scofield et al. 2010, Scofield et al.  2011) and diversity (Scofield et
al. _Am. Nat._) statistics (<i>q<sub>gg</sub></i>,
<i>&alpha;<sub>g</sub></i>, etc.) the source file `pmiDiversity.R` contains the
`pmiDiversity()` function that provides these and this can be used separately.

Put all the source files in the same directory, and within your R session
simply

    source("diversityTests.R")

An additional source file `plotPairwiseAndGamma.R` is available for plotting
pairwise divergence/overlap matrices, and for collecting gamma diversity
accumulation information and plotting this.  Examples can be seen in Figure 4
of Scofield et al. _Am.  Nat._.  This file requires the `pmiDiversity.R` source
file to be available within the same directory.  Then simply

    source("plotPairwiseAndGamma.R")


* * *

These statistical tools were developed in collaboration with Peter Smouse
(Rutgers University) and Victoria Sork (UCLA) and were funded by U.S. National
Science Foundation awards NSF-DEB-0514956 and NSF-DEB-0516529.

* * *

### pmiDiversity.R

Defines the R function `pmiDiversity()` which takes a site-by-source table and
produces statistics for Probability of Maternal Identity aka PMI (Grivet et al.
2005, Scofield et al. 2010, Scofield et al. 2011) and dispersal
diversity (Scofield et al. in review).  Three different PMI and diversity
statistics are calculated:

* <i>q<sub>gg</sub></i>-based, known to be biased (Grivet et al. 2005)

* <i>r<sub>gg</sub></i>-based, unbiased but poor performers at low sample sizes
  (Grivet et al. 2005, Scofield et al. in review)

* <i>q<sup>*</sup><sub>gg</sub></i>-based, which apply the transformation
  developed by Nielsen et al. (2003) to be unbiased and seem to perform well
(Scofield et al. 2010, Scofield et al. 2011, Scofield et al. in review).


### diversityTests.R

Defines several R functions which, like `pmiDiversity()`, take a site-by-source
table (one or more) and test diversity statistics within and among them.  See
Scofield et al. in review for methodological details.  The file `pmiDiversity.R`
(see above) is required to be in the same directory, as it provides functions
used here.

`alphaDiversityTest(tab)`
: Test for differences in alpha diversity among sites within a single dataset
 
`alphaContrastTest(tab.a, tab.b)`
: Test whether there is a difference in the alpha diversity between two datasets

`alphaContrastTest.3(tab.a, tab.b, tab.c)`
: Test whether there is a difference in the alpha diversity among three datasets

`plotAlphaTest(result)`
: Plot the list returned from `alphaDiversityTest()` or `alphaContrastTest()` for evaluation

`pairwiseMeanTest(tab)`
: Test whether mean pairwise divergence/overlap among sites is different from the null espectation

`plotPairwiseMeanTest()`
: Plot the list returned from the above test for evaluation

`gammaContrastTest(tab.a, tab.b)`
: Test whether there is a difference in the gamma diversity between two datasets

`gammaContrastTest.3(tab.a, tab.b, tab.c)`
: Test whether there is a difference in the gamma diversity among three datasets


### plotPairwiseMatrix.R

Provides a function for plotting pairwise diversity matrices as returned by the
`pmiDiversity()` function, examples of which can be seen in Figure 4A-C of
Scofield et al. _Am. Nat._.

`plotPairwiseMatrix()`
: Create a visual plot of pairwise divergence or overlap values as calculated by
`pmiDiversity()`.  For example, with `tab` defined as above, plot the divergence matrix 
based on <i>r<sub>gg</sub></i> calculations, labelling the axes "Seed Pool", using the 
following code: 

      pmiD = pmiDiversity(tab)
      plotPairwiseMatrix(pairwise.mat=pmiD$r.divergence.mat, 
                         pairwise.mean=pmiD$r.divergence, 
                         statistic="divergence", 
                         axis.label="Seed Pool")



### gammaAccum.R

Provides functions for calculating gamma accumulation across sites, and
plotting the result, examples of which can be seen in Figure 4D-F of Scofield
et al. _Am. Nat._.  The file `pmiDiversity.R` (see above) is required to be in
the same directory, as it provides functions used here.

`runGammaAccum(tab)`

: Perform a gamma diversity accumulation on the site-by-source data in `tab`.
Several arguments control the method of accumulation and value of gamma
calculated.  Only the defaults have been tested; the others were developed
while exploring the data and must be considered experimental.  The result is
returned in a list, which may be passed to plotGammaAccum() to plot the result.

           tab 
                 Site-by-source table, as passed to pmiDiversity()
           accum.method
                 "random" (default) or "proximity".  If "proximity" is used,
                 then distance.file must be supplied (see below)
           resample.method
                 "permute" (default) or "bootstrap"; whether to resample sites
                 without ("permute") or with ("bootstrap") replacement
           distance.file
                 A file or data.frame containing three columns of data, with
                 the header/column names being "pool", "X", and "Y",
                 containing the spatial locations of the seed pools named in
                 the row names of tab.  Only used if the
                 accum.method=="proximity"
           gamma.method
                 Calculate gamma using "r" (default) or "q" method (see paper).


`plotGammaAccum(rga.result)`
: Create a visual plot of gamma accumulation results from `runGammaAccum()`.

A typical workflow using these functions would be:

      rga.result = runGammaAccum(tab)
      plotGammaAccum(rga.result)


The following functions typically won't be used separately, use `runGammaAccum()`
instead.

`gammaAccum()`
: Workhorse function for gamma accumulation
`gammaAccumStats()`
: Extracts stats from the result of `gammaAccum()`
`runGammaAccumSimple()`
: Wrapper that runs and then returns stats from `gammaAccum()`



* * *

### References

Scofield, D. G., P. E. Smouse, J. Karubian and V. L. Sork.  Accepted.  Using
_&alpha;_, _&beta;_ and _&gamma;_ diversity to characterize seed dispersal by
animals.  _American Naturalist_.

Scofield, D. G., V. R. Alfaro, V. L. Sork, D. Grivet, E. Martinez, J. Papp, A.
R. Pluess et al. 2011. Foraging patterns of acorn woodpeckers (_Melanerpes
formicivorus_) on valley oak (_Quercus lobata_ Née) in two California oak
savanna-woodlands. _Oecologia_ 166:187-196.

Scofield, D. G., V. L. Sork, and P. E. Smouse. 2010. Influence of acorn
woodpecker social behaviour on transport of coast live oak (_Quercus agrifolia_)
acorns in a southern California oak savanna. _Journal of Ecology_ 98:561-572.

Grivet, D., P. E. Smouse, and V. L. Sork. 2005. A novel approach to an old
problem: tracking dispersed seeds. _Molecular Ecology_ 14:3585-3595.

Nielsen, R., D. R. Tarpy, and H. K. Reeve. 2003. Estimating effective paternity
number in social insects and the effective number of alleles in a population.
_Molecular Ecology_ 12:3157-3164.

