0.9.9001 (development version)
------

* `createAlleleTables` will create a class `allele_divtables` object from genotype data in a class `genalex` object, and will attempt to convert other objects to class `genalex` using `as.genalex` from the `readGenalex` package prior to creating the allele tables
* Diversity tests no longer compare log-likelihood values against an analytic &Chi;<sup>2</sup> distribution, which was almost always incorrect
* The calculation of distances for diversity tests is much more efficient in time and space, so tests may be performed on data with very high counts, such as diversity of OTUs quantified via read counts
* Diversity tests return class `diversity_test`, which has `print` and `plot` methods
* Gamma accumulation functions return class `gamma_accum`, which has a `plot` method
* `diversity`, `alleleDiversityTest`, `alleleContrastTest`, and `alleleContrastTest3` have methods for `divtable` and `allele_divtables`
* Lists of allele diversity tables have class `allele_divtables`
* Diversity site-by-source tables have class `divtable`, with methods to convert from `table`, `xtabs`, `matrix`, and `data.frame`
* `diversity` returns separate lists for diversity values calculated using the standard diversity calculations (`q`), classical corrections (`r`), and Nielsen et al. (2003 *Molecular Ecology*) corrections (`q.nielsen`).
* `nielsenTransform` is an exported function
* `membershipPlot` with `fill.method = "colour"` will use the `RColorBrewer` package if it is available; the default palette is `"Dark2"` and this can be changed with `fill.palette`.  Also, `"colour"` is a `fill.method` synonym for `"color"`.
* `membershipPlot` will on option write the plot to a PDF file; the option to write to an EPS file is removed
* `membershipPlot` drops the `method` argument along with the plotting of pie charts
* The datasets `granaries_2002_Qlob` and `granaries_2004_Qlob` are provided, which include assignments of *Quercus lobata* acorns harvested from acorn woodpecker granaries in 2002 and 2004 to seed source trees.
* Numerous functions have been renamed (e.g., `pmiDiversity` to `diversity`) and data structures reconfigured (e.g., the return value from `diversity`)


0.1
------

* Initial version available via Github.  This is tagged with `0.1` and a tarball is available as a release.
