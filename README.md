# NBA Player Survival Analysis

## Overview
This project analyzes the survival patterns of retired National Basketball Association (NBA) players and investigates factors associated with their mortality risk using survival analysis techniques. The study applies Kaplan-Meier estimation, Log-Rank tests, and Cox Proportional Hazards regression to examine the relationship between player characteristics and survival time.

## Objectives
- Analyze the survival patterns of retired NBA players.
- Compare survival probabilities across player characteristics.
- Identify factors associated with mortality risk after retirement.
- Develop a Cox Proportional Hazards model to investigate the relationship between player characteristics and survival outcomes.
- Evaluate the proportional hazards assumption to assess model suitability.

## Dataset
The dataset consists of 3,962 retired NBA players observed through July 31, 2019. The data were obtained from the research by Martínez et al. and include player characteristics, career statistics, and mortality information.

The dataset contains the following variables:

- **Survival Time:** Age at death or age at the end of the observation period.
- **Mortality Status:** Indicates whether a player died during the observation period or was still alive (right-censored).
- **Playing Position:** Player's position in the NBA.
- **Ethnicity:** Player's recorded ethnic category.
- **Career Length:** Duration of the player's NBA career.
- **NBA Debut Age:** Age when the player first entered the NBA.
- **Weight:** Player's body weight in kilograms.
- **Height:** Player's height in centimeters.
- **Games Played:** Total number of NBA games played.

## Methodology

### 1. Exploratory Data Analysis
Descriptive statistics and frequency distributions are used to examine player demographics, physical characteristics, career histories, and mortality status.

### 2. Kaplan-Meier Estimation
Kaplan-Meier survival curves are constructed to estimate survival probabilities over time and compare survival patterns across player groups.

### 3. Log-Rank Tests
Log-Rank tests are conducted to determine whether survival curves differ significantly between groups based on player characteristics.

### 4. Cox Proportional Hazards Regression
Cox regression is used to investigate the association between player characteristics and mortality risk. Model parameters are evaluated using overall and individual significance tests.

### 5. Model Selection and Diagnostics
Predictors are assessed through iterative model selection and likelihood ratio tests. The proportional hazards assumption is evaluated using graphical methods and Schoenfeld residual-based tests. Stratified Cox models are also considered when the assumption is violated.

### 6. Hazard Ratio Interpretation
Hazard ratios are used to interpret the relative change in mortality hazard associated with each predictor, holding other variables constant.

## Key Findings
- Playing position and career length show differences in survival patterns across groups based on the reported Log-Rank tests.
- Career length and age at NBA debut are identified as important predictors during the Cox regression analysis.
- Higher debut age is associated with a higher estimated mortality hazard in
