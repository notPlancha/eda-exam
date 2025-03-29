#import "@preview/sourcerer:0.2.1": code


#set text(font: "Stix Two Text", size: 16pt, weight: "medium")

// #grid(columns: (1fr, 1fr), [MALMÖ UNIVERSITY \ Plancha, André \ #text(size:7pt)[andre.plancha\@hotmail.com] \ CS: Applied DS (TACAS)], align(right, [Written Exam \ Statistical Methods \ MA660E, Autumn 2024]))
#let today = datetime.today()
#align(center)[Exploratory Data Analysis - Written Exam]
#set text( size: 14pt)
#grid(columns: (2fr, 1fr), 
  [André Plancha \ #text(size:7pt)[andre.plancha\@hotmail.com] \ Computer Science: Applied Data Science],
  [MALMÖ UNIVERTITY \ #text(size:7pt)[Spring 2025] \ #today.display("[month repr:long] [day], [year]")]
)
#v(-6pt)
#line(length: 100%)
#set text(size: 12pt, weight: "regular")
#set par(justify: true)
#set table(stroke: none)
// #show table: set block(fill: none, width: auto)
#let question(it) = {
  show heading: itt => text(size: 12pt)[#itt.body]
  block(fill: luma(220), inset: 8pt, width: 100%, radius: 1pt, it)
}
#show table: set align(center)

/*
MALM? UNIVERSITY

Technology and society

Written Exam
Exploratory Data Analysis
MA661E, Spring 2025

Solutions should be in reasonably details, and be written in Word/Latex

The codes in Python / Matlab should be attached as appendix
Dead line for hand-in is 2025-03-29, 23:59 via Canvas.

1. Due to large sizes of data sets in practice one need to do dimension reduction thereafter study the pattern by various clusterings techniques. Dimension reduction means lost of certain information whence less accuracy of clustering results in general. In this question, we consider the Iris data set as four dimensional data set with the ground truce label: setosa, versicolor, virginica and use the k-means for clustering.

a) First determine three clusters of Iris data set by k-means, and even compute the percentage of correct classi?ed observations.
(4p)

b) Now apply ?rst the factor analysis method to reduce the Iris data set to two dimensional, then determine three clusters of the reduce data set by k-means. What is then the percentage of correct classi?ed observations ? Even visualize the reduced data set with original label respectively by the clustering.
(8p)

2. Consider the minimum spanning trees method (MST) and lung cancer data set LungA.

a) First apply MST to ?nd two clusters, then ?nd the percentage of correct clustered genes using the original label of cancer cell: Normal, Cancer (Small-cell lung carcinomas, Nonsmall cell lung carcinomas) as ground truth.
(4p)

b) Apply MST once again to ?nd three clusters, then compare the correct clustered genes using the original label: Nonsmall cell lung carcinomas, Normal, Small-cell lung carcinomas as ground truth.
(3p)

c) Finally, test to ?nd ?ve clusters comparing the correct clustered genes using the label: AD, COID, SQ, NL, SCLC as ground truth. Even comment on these clustering results. (4p)

3. Model based clustering in chapter 6 (section 6.5) is based on geometrical properties of clusters, e.g. balls and ellipsoids in 3-dim. In this question, you are asked to randomly generate data sets to check the capability of MBC: two balls of di?erent sizes, two ellipsoids of di?erent size with symmetry axis parallel with coordinates axis, three ellipsoids also di?erent sizes with arbitrary symmetry axis.

a) Randomly generate those sub data sets so that they are disjoint (far away from each other), then apply model based clustering to ?n clusters even compare the estimated clusters with original labels.
(7p)

b) Randomly generate those sub data sets so that they are overlap partly, then apply model based clustering to ?nd clusters even compare the associated clusters with original labels. (5p)

4. Find the datasets about in?ation, unemployment in member countries of European union during the last ten years (2015 - 2024). Your dataset should contains at least 20 countries. Denote the in?ation dataset by EUin and the unemployment dataset by EUun and EU = [EUin,EUun].

Hint You may check the database at the websites: https://european-union.europa.eu or https://ec.europa.eu/eurostat/data/database or

a) Study the unemployment pattern by looking at clusters of EUun using one proper hierarchical methods and evaluate the result by Silhouette plot.
(5p)

b) Study the joint pattern of unemployment and in?ation by looking at clusters of EU using k-means method and evaluate the result by using Dunn index.
(6p)

⎛ 3 1 1 4 1.5 0.12 0 0.03 0.1 ⎞ 5. Consider the dataset X T = ⎝ 1 4 1 1 3 2 6 0.5 4 ⎠ 0.1 0.02 0 0.1 0 1.9 3.5 1 3

a) Visualize the dataset X via scatter3.
(2p)

b) It's obvious that X contains two clusters: one is on xy-plane and another one is on the yz-plane. Please check if hierarchical Ward's method, spectral method are able to recover these two clusters.
(8p)

6. Consider again the dataset X given in the previous question.

a) Determine the non-negative factorization matrices W,H of X, i.e., X = WH, by Multiplicative update algorithm(MULT).
(3p)

b) In this question, we study the convergence of MULT. Let the maximum number of iterations be K and the error function f be ||X − WH|| 2 , then f is a function of K. Modify the Matlab EDA toolbox routine nnmf or any your Python library such that MULT terminates whenever the number of iterations has reach the maximum number of iterations K.

i) Plot the error term f as an function of K.
(5p)

ii) For what integers K is the error f less than the tolerance ε = 10 −4 ?
(2p)
Hint The Frobenius norm ||A|| for matrix A = (aij) is ||A|| 2 = ∑︁ i,j a 2 ij .

7. In the study of dimension reduction by Principle Component Analysis (PCA), one of PCA is based on covariance matrix, and another one is based on correlation matrix. The covariance matrix based PCA has a property: all the PC:scores are uncorrelated, i.e., the correlation coe?cient between any pair of PC:scores is zero. Please give a short proof of this property.
(6p)

8. Consider the Sierpinski triangle, which is a fractal set and is of Hausdor? dimension log3 , roughly 1.585.
log2

a) Please make samplings of points from the above Sierpinski triangle of sizes: a) 10000 points, b) 100000 points.
(2p)

b) Estimate the intrinsic dimensionality of the above Sierpinski triangle by the nearest neighbor method idpettis
(4p)

c) The number of neighbors K in the above EDA toolbox idpettis is by default 5, study the sensitivity of the above estimations with respect to K. Plot these estimates as function of K, where 5 ≤ K ≤ 15 and even comment on the behaviors of these curves.
(4p) Hint: You may check the ?le: sierpinski.m, which is available in Canvas.

9. Consider the bended tube and also the cutted tube (see the ?gure below). These two surfaces are topologically very di?erent.

a) Generate 20000 and 10000 sample points from the bended respectively the cutted tubes, and denote them by X, and Z.
(2p) Hint: You may check the ?le: tube.m, which is available in Canvas.

b) Apply the nonlinear dimension reduction method LLE to these datasets X,Z. How does this method work for the bended tube respectively the cutted tube? (4p)

c)

Apply even the reduction method HLLE to these datasets X,Z. Does HLLE work

better/worse than LLE?
(4p)

10. Consider the SMACOF method (see the description in the separated page ).

a) First implement the SMACOF algorithm in Matlab or Python.
(4p)

b) Test your code for Leukemia dataset as in example 3.2 in the textbook for the

choices of parameter p = 1.5,
2,
7. Are there some essential di?erences in the

results for di?erent values of p in Minkowski distance ?
(6p)

Good luck !

Grade

0 − 49p: F
50 − 59p: E
60 − 69p: D

70 − 79p: C
80 − 89p: B
90 − 100p: A

*/

#question[
  = 1. 
  Due to large sizes of data sets in practice one need to do dimension reduction thereafter
  study the pattern by various clusterings techniques. Dimension reduction means lost
  of certain information whence less accuracy of clustering results in general. In this
  question, we consider the Iris data set as four dimensional data set with the ground
  truce label: setosa, versicolor, virginica and use the k-means for clustering. 
  
  == a)
  First determine three clusters of Iris data set by k-means, and even compute the percentage of correct classified observations.
]

K-means clustering is an iterative algorithm that aims to partition n observations into k clusters in which each observation belongs to the cluster with the nearest mean. Using scikit-learn's `KMeans`, the following was obtained:

#table(
  columns: 4,
  rows:5,
  align: (x, y) => {
    if (x == 0) {right}
    else if (y == 0) {left}
    else {right}
  },
  [], table.vline(), [Cluster 1], [Cluster 2], [Cluster 3],
  table.hline(),
  [setosa], [0 (0%)], [50 (100%)], [0 (0%)],
  [versicolor], [47 (77%)], [0 (0%)], [3 (8%)],
  [virginica], [14 (23%)], [0 (0%)], [36 (92%)],
  [Total], [61], [50], [39]
)

From this, we can see that the clusters obtained are able to separate the classes quite well, with 100% of setosa on one cluster, 77% of versicolor on another, and 92% of virginica on the last one. This leads us to a total of #{(50 + 37 + 36)*100/150}% of correct classified observations.

#question[
  == b)
  Now apply first the factor analysis method to reduce the Iris data set to two dimensional, then determine three clusters of the reduce data set by k-means. What is then the percentage of correct classified observations? Even visualize the reduced data set with original label respectively by the clustering.
]

Factor analysis uses the correlation structure amongst observed variables to model a smaller number of unobserved, latent variables known as factors. Using scikit-learn's `FactorAnalysis` and scikit-learn's `KMeans`, the following was obtained (the color in the background represents the cluste division):

#image("images/fa.png")

#table(
  columns: 4,
  rows:5,
  align: (x, y) => {
    if (x == 0) {right}
    else if (y == 0) {left}
    else {right}
  },
  [], table.vline(), [Cluster 1], [Cluster 2], [Cluster 3],
  table.hline(),
  [setosa], [0 (0%)], [50 (100%)], [0 (0%)],
  [versicolor], [15 (38%)], [0 (0%)], [35 (57%)],
  [virginica], [24 (62%)], [0 (0%)], [26 (43%)],
  [Total], [39], [50], [61]
)

From this, we can clearly see that the algorithm was able to separate setosas from the other classes, but it had a hard time separating versicolors from virginicas. This leads us to a total of #sym.approx #calc.round({(50 + 35 + 24)*100/150}, digits:2)% of correct classified observations. This is a decrease in the accuracy of the classification, which is expected when reducing the dimensionality of the data.

#question[
  = 2. 
  Consider the minimum spanning trees method (MST) and lung cancer data set `LungA`.
  
  == a)
  First apply MST to find two clusters, then find the percentage of correct clustered genes using the original label of cancer cell: `Normal, Cancer (Small-cell lung carcinomas, Nonsmall cell lung carcinomas)` as ground truth.
]
As I interpreted it, this questions asks us to:

1. Transform `LungA` into a undirected weighted complete graph, where the weight of the edge between two nodes is the euclidean distance between them;
2. Transform that graph into its minimum spanning tree, using for example Kruskal's algorithm;
3. Remove the longest edge from the tree, thus dividing it into two clusters;
4. Compare the clusters obtained with the original labels.

`LungA` is a dataset that seems to have 203 observations and 3312 unnamed numerical features, and each obsevration has a label between `AD`, `SQ`, `COID`, `NL`, and `SCLC`. Grouping `AD`, `SQ`, `COID` and `SCLC` as "Cancer", using the described steps above and using SciPy's `minimum_spanning_tree` and `connected_components`, the following was obtained:

#table(
  columns: 3,
  rows: 4,
  align: (x, y) => {
    if (x == 0) {right}
    else if (y == 0) {left}
    else {right}
  },
  [], table.vline(), [Cluster 1], [Cluster 2],
  table.hline(),
  [Cancer], [185 (92%)], [1 (100%)],
  [Normal], [17 (8%)], [0 (0%)],
  [Total], [202], [1]
)

From this, we can see that the algorithm was not able to separate the normal cells from the cancer cells, since the smaller cluster has only one observation Cancer observation. Because of the nature of this algorithm, we can conclude that this observation might be an outlier, showing the method's robustness in outlier detection. // TODO make percentage of correct

#question[
  == b)
  Apply MST once again to find three clusters, then compare the correct clustered genes using the original label: `Nonsmall cell lung carcinomas, Normal, Small-cell lung carcinomas` as ground truth.
]

This time, `AD`, `SQ` and `COID` were grouped as "Nonsmall cell lung carcinomas", `SLC` as "Small-cell lung carcinomas", and `NL` as "Normal". Using the same steps as before, the following was obtained:

#table( 
  columns: 4,
  rows: 4,
  align: (x, y) => {
    if (x == 0) {right}
    else if (y == 0) {left}
    else {right}
  },
  [], table.vline(), [Cluster 1], [Cluster 2], [Cluster 3],
  table.hline(),
  [Nonsmall cell lung carcinomas], [178 (89%)], [1 (100%)], [1 (100%)],
  [Normal], [17 (8%)], [0 (0%)], [0 (0%)],
  [Small-cell lung carcinomas], [6 (3%)], [0 (0%)], [0 (0%)],
  [Total], [201], [1], [1]
)

The same conclusion can be drawn from this result, where the algorithm was not able to separate the observations based on the labels given, reinforcing the idea that the algorithm is robust to outliers. Aditionally, it's important to note that, since the method is a divise clustering method, cluster 3 is a subset of the previous cluster 1, and increasing the number of clusters will result in this cluster 1 being divided into smaller clusters.

#question[
  == c)
  Finally, test to find five clusters comparing the correct clustered genes using the label: `AD, COID, SQ, NL, SCLC` as ground truth. Even comment on these clustering results.
]

This time, `AD`, `COID`, `SQ`, `NL` and `SCLC` were used as labels. Using the same steps as before, the following was obtained:

#table( 
  columns: 5,
  rows: 5,
  align: (x, y) => {
    if (x == 0) {right}
    else if (y == 0) {left}
    else {right}
  },
  [], table.vline(), [Cluster 1], [Cluster 2], [Cluster 3], [Cluster 4],
  table.hline(),
  [AD], [138 (70%)], [1 (100%)], [0 (0%)], [0 (0%)],
  [COID], [16 (8%)], [0 (0%)], [3 (100%)], [1 (100%)],
  [NL], [17 (9%)], [0 (0%)], [0 (0%)], [0 (0%)],
  [SMCL], [6 (3%)], [0 (0%)], [0 (0%)], [0 (0%)],
  [SQ], [21 (11%)], [0 (0%)], [0 (0%)], [0 (0%)],
  [Total], [198], [1], [3], [1]
)

As in a) and b), the algorithm was not able to separate the observations based on the labels given. This might also be because there's a big imbalance between the number of `AD` observations, which make up a grand majority of the dataset, making the division difficult to obtain from the data.

#question[
  = 3. 
  Model based clustering in chapter 6 (section 6.5) is based on geometrical properties of clusters, e.g. balls and ellipsoids in 3-dim. In this question, you are asked to randomly generate data sets to check the capability of MBC: two balls of different sizes, two ellipsoids of different size with symmetry axis parallel with coordinates axis, three ellipsoids also different sizes with arbitrary symmetry axis.
  
  == a)
  Randomly generate those sub data sets so that they are disjoint (far away from each other), then apply model based clustering to fin clusters even compare the estimated clusters with original labels.
]

For this question, 1000 points of every shape were generated, with the following properties:


#table(
  columns: 10,
  rows: 8,
  [], table.vline(), $x_c$, $y_c$, $z_c$, $x_r$, $y_r$, $z_r$, $alpha$, $beta$, $gamma$,
  table.hline(),
  [Ball 1], $10$, $10$, $10$, $2$, $2$, $2$, $0 degree$, $0 degree$, $0 degree$,
  [Ball 2], $-10$, $-10$, $-10$, $1$, $1$, $1$, $0 degree$, $0 degree$, $0 degree$,
  [Ellipsoid 1], $0$, $0$, $0$, $3$, $2$, $1$, $0 degree$, $0 degree$, $0 degree$,
  [Ellipsoid 2], $10$, $0$, $0$, $1$, $1.5$, $1$, $0 degree$, $0 degree$, $0 degree$,
  [Ellipsoid 3], $0$, $10$, $0$, $4$, $5$, $1$, $30 degree$, $45 degree$, $30 degree$,
  [Ellipsoid 4], $0$, $0$, $10$, $2$, $2$, $1$, $60 degree$, $0 degree$, $0 degree$,
  [Ellipsoid 5], $0$, $10$, $10$, $3$, $1$, $1$, $60 degree$, $20 degree$, $45 degree$
)

#image("images/balls_far.png")

Model based clustering is a clustering method based on a finite mixutre probability model, using the EM algorithm // TODO might change