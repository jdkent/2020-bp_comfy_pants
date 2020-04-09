# Quick Start

## Prerequisites

1. You have an [IDAS account](https://hpc.uiowa.edu/compute/interactive-data-analytics-service-idas)
2. you have signed into the [interactive research jupyter notebook](https://notebooks.hpc.uiowa.edu/research-interactive)
3. you have [git set up](http://swcarpentry.github.io/git-novice/02-setup/index.html) on your IDAS account

## Getting Started

1. open a terminal by clicking on "New" and selecting "Terminal"
2. clone (i.e., download) the repository containing the code
    - `git clone https://github.com/jdkent/2020-bp_comfy_pants.git`
3. change the directory you're in to get to `2020-bp_comfy_pants`
    - `cd 2020-bp_comfy_pants`
4. run the setup script.
    - `./setup.sh`
5. upload the data csvs shared on slack into the data folder.
6. reload the main jupyterhub page.
7. using the jupyterhub interface, open the notebook with your name.
8. also open the `model_example.ipynb` notebook to get inspiration on how to make models.

## Lessons from first Hackathon

1. data has way more cases than controls. (almost 2:1)
2. lots of missing data for the SPECT data.
3. PCA "appears" to be the best data reduction strategy (relative to selecting the most informative features,
   Factor Analysis, and several other data reduction methods)
4. maybe need to look into other datasets to improve classification
    - [schizconnect](http://schizconnect.org/)
    - [f con 1000](http://fcon_1000.projects.nitrc.org/)
    - [openneuro](https://openneuro.org/)

## Lessons/Suggestions during this hackathon

Biggest tips:
if estimator has a class_weight  parameter, set to "balanced".
There are outliers in the data, either use RobustScaler or QuantileTransformer to reduce influence of outliers.
There are columns with missing data, either do not use those columns or I've "potentially" had success with IterativeImputer
The best features appear to be dti and t1r if you want to select your features a bit.
If you need to reduce the dimensionality of your data, I have two suggestions:
- SelectKBest (chooses the features that maximize the difference between groups)
- PCA (chooses dimensions of the data that "varies" the most)

Some suggestions for choosing estimators:
- LogisticRegression : simple/interpretable/reliable, tune the C (i.e., 0.001, 0.01, 0.1, 1, 10, 100) parameter and penalty (i.e., l1, l2) parameter, set class_weight to "balanced"  and set solver to liblinear 
- RandomForestClassifier: robust, often gives good results. set n_estimators=2500, and set class_weight="balanced_subsample". tune max_depth (i.e., 5, 10, 15, 25), max_samples (i.e. 0.3, 0.5, 0.7), max_features (i.e., 0.3, 0.5, 0.7).
I will walk through what tuning/testing your model will look like during hacky hour. and have my code on github.
Keep it up!
