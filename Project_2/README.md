<img src="http://imgur.com/1ZcRyrc.png" style="float: left; margin: 20px; height: 55px">

# Project 2: Ames Housing Data and Kaggle Challenge

-----

## Introduction
-----
With the large number of variables that can potentially affect housing prices, it is often a very complicated process to determine the sale price of a house. Fortunately, with sufficient data, a linear regession model can be created to help accurately predict house sale prices and to also determine which are the features that are more significant in the differentiation of house sale prices. 

This information can then be used by property owners to assist them in deciding what features to focus on in order to most effectively increase the value of their house sale price. Likewise, this information can also be used by potential property buyers to more efficiently determine what kind of houses to look for based on their budget or to help them set a reasonable budget based on the features they are looking for in their potential future house. 


#### Problem Statement:
Create the best linear regression model that is both high performing and generalisable in order to best predict sale prices of houses in Ames. 

The dataset used is the Ames housing dataset from [Kaggle](https://www.kaggle.com/c/dsi-us-11-project-2-regression-challenge/data) and a detailed data dictionary can be found [here](http://jse.amstat.org/v19n3/decock/DataDocumentation.txt).

-----
## Executive Summary:
-----
The Ames housing dataset from Kaggle was already separated into training and testing datasets based on a 70:30 split. 

1. In the first notebook, a preliminary EDA was done to determine the extensiveness of data cleaning/ modifications. Through the EDA done, it was determined that in order to create a feasible linear regression model, some work had to be done to reduce multicollinearity and skewness. 

2. The second notebook looks at data cleaning and modifications done to both datasets. First to treat null/zero values in the datasets and then to identify and then treat or remove the outliers. Both ordinal and and nominal variables were also encoded as part of data modifications.

3. After encoding the variables, in the third notebook we now have 228 variables, up from the initial 81. This increased the dimensionality of the data which may be partially due to the introduction of noise features. This results in an overfitted model. While some of our new features may be relevant, the variance incurred in fitting their coefficients may outweigh the reduction in bias that they bring. This third notebook looks to reduce some of these redundant features through dimensionality reduction techniques such as correlation and variance analysis, and recursive feature elimination. 

Within this notebook, we reduced our overall number of features down to around 120, as anything above this resulted in poor results from our model. Feature engineering was done here to create interaction features that may have an improved correlation to our target variable `SalePrice`. Redundant features identified from high pairwise correlations and low variance were also dropped. Lastly, Recursive Feature Elimination (RFE) was done to further reduce the number of features by removing the weakest features. Some experimentation was done to determine the specified number of features to retain. It was found that retaining ~120 features provided the best amount of data to generate a better performing model. 

This was done to both the train and test datasets. It was also noted that the test datasets had an additional number of features not found in the cleaned train dataset. These were dropped. 

4. The last notebook looks at creating, evaluation and selecting the best performing model. For experimentation purposes, four types of linear regression models were used. Namely, the standard linear regression model, the Ridge regression model, the Lasso regression model and the ElasticNet regression model. The models were evaluated based on comparing their train and test R2 and RSME scores. It was noted that in the notebook, the Ridge model had the best performance. 

However, based on the scores returned from Kaggle, the Lasso model was the most successful in predicting housing sale prices. On the dataset comprising of 30% of the test data, the model achieved an RMSE of 33859.87. On the dataset comprising of the other 70% of the test data, the model performed within expectations, returning an RMSE of 25979.44. 

Either way, the scores achieved were a strong improvement over the baseline score (~181,000) generated by using the mean of all sale prices as predictions. This answers our problem statement of how we can best predict housing prices using the values to determine the linear regression model equation.
$$   y =  \beta_0 +  \beta_1 x_1 + \epsilon $$

-----
### Recommendations:
-----
Based on the model, there are several ways to increase the value of a house in Ames (for sellers):
- Renovate to improve the overall, basement and exterior quality of the house
- Improve grade of the bathrooms
- Increase the number of Fireplaces
- Increase the garage size to fit more than one car
- If using a hard board exterior, switch to cement or brick instead

Based on the model, there are several ways to efficiently look for a lower value house in Ames (for buyers):
- Avoid neighbourhood such as Northridge Heights, Stone Brook and Northridge.
- Instead go for neighbourhood such as Gilbert. 
- Look for 1 story houses built in 1946 and after, as part of a planned unit development
- Houses with a split level style of dwelling

-----
### Model Limitations:
-----
While this model generalizes well to the city of Ames, it's probably not generalizable to other cities, given that each city tends to differ greatly in terms of external factors like geographical features, seasonal weather or the economic climate of that particular city.

It is also to be noted that further preprocessing of the target variable could be done. For example, we can consider adding a log function to it. This will mostly likely assist in reducing the variability of the data to one that is more normally distributed. However, this was not done here due to time constraints and can be considered if time permits in the future for further finetuning of the model. 

#### Tradeoffs between interpretability and accuracy
A key consideration in this project was whether to create a more interpretable model which had a total of 30 or less features. Ultimately, I decided against this as this led to a significant tradeoff in accuracy. Using RFE to select 30 features greatly reduced my model's R2 and greatly increased RMSE. Therefore in this case, I believe that it's not worth trading off model complexity for accuracy, given the model's current performance with less than 100 features.

However, this does create some limitations. For example, some of the negative predictors are hard to interpret without extensive domain knowledge. For example, on the surface, it doesn't seen logical for the number of kitchens or bedrooms to be negative predictors for price. This can be explained by the fact that these features are acting as a proxy for other features.






