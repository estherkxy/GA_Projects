<img src="http://imgur.com/1ZcRyrc.png" style="float: left; margin: 20px; height: 55px">

# Project 4: West Nile Virus Prediction

## Introduction

### Problem Statement

According to the [CDC]( https://www.cdc.gov/westnile/index.html#:~:text=About%201%20in%205%20people,pants%20to%20prevent%20mosquito%20bites), West Nile virus (WNV) is the leading cause of mosquito-borne disease in the continental United States. It is acknowledged as the leading cause of mosquito-borne disease in the continental United States. According to the CDC, 1 in 5 people who are infected develop a fever and other symptoms, while 1 out of 150 infected people develop a serious, sometimes fatal, illness. 

In Illinois, West Nile virus was [first identified in September 2001](https://dph.illinois.gov/topics-services/diseases-and-conditions/west-nile-virus.html) when laboratory tests confirmed its presence in two dead crows found in the Chicago area. The following year, the state's first human cases and deaths from West Nile disease were recorded and all but two of the state's 102 counties eventually reported a positive human, bird, mosquito or horse. By the end of 2002, Illinois had counted more human cases (884) and deaths (64) than any other state in the United States.

To date, there have been no licensed vaccines for humans to prevent or treat WNV, although there are vaccines developed and approved for use in [horses](https://www.niaid.nih.gov/diseases-conditions/wnv-vaccines#:~:text=Currently%2C%20there%20is%20no%20licensed,approved%20for%20use%20in%20horses.) in 2005.

In view of this, our project aims to predict occurrence of WNV given time, location, and mosquito species. This will help the City of Chicago and Chicago Department of Public Health (CDPH) more efficiently allocate resources towards preventing transmission of this potentially deadly virus. 

We will also aim to determine where and when to deploy pesticides throughout the city, to maximise pesticide effectiveness and minimise spending.


## Executive Summary

Our top-performing model was a Logistic Regression model (Lasso (L2) Regularization with an &alpha; of 0.1), which achieved an AUC score of <b>0.700</b> on Kaggle. In order to achieve these results, we used a range of feature engineering, selection techniques including adjusting for imbalanced data by using balanced class weightage. This was chosen over the Synthetic Minority Over-Sampling (SMOTE) oversampling technique as it produced a better Test AUC score as well as a better recall score. This indicated that the class weightage method was deemed to be more effective than SMOTE as it produced a model with a better model fit and less false negatives produced. 

We also noted that the time lag features created seem to have the strongest in predicting if there is presence of west nile virus or not. The other strong predictors seem to be related to temperature, which corroborates with our findings during EDA. For example, after looking at the coefficients of the features, we noted that a good number of our top predictors were temperature-related features such as `templag2`, `tavg` and `cool`. In addition, weather-related features such as `rel_humidity` and `rainlag2`. There were also some time-based features that seem to be of importance when attempting to predict the presence of the WNV such as `week`. 

With the created time lag features from the temperature, rainfall and humidity features showing more predictive power, it is then possible to assume that the mentioned features can be viewed as potential lead indicators of the virus occurrence. A lead indicator shows a change in direction before a corresponding change in the target variable. This assists in anticipating when the virus occurrences are on the rise before it even happens. 


### Model Evluation

<table class="dcf-table dcf-table-responsive dcf-table-bordered dcf-table-striped dcf-w-100%">
	<caption>Model Results (Sorted by Test AUC)</caption>
	<thead>
		<tr>
			<th class="dcf-txt-center" data-label="Model" scope="col">Model</th>
			<th class="dcf-txt-center" data-label="Train AUC" scope="col">Train AUC</th>
			<th class="dcf-txt-center" data-label="Test AUC" scope="col">Test AUC</th>
			<th class="dcf-txt-center" data-label="Precision" scope="col">Precision</th>
			<th class="dcf-txt-center" data-label="Specificity" scope="col">Specificity</th>
			<th class="dcf-txt-center" data-label="Recall" scope="col">Recall</th>
			<th class="dcf-txt-center" data-label="F-score" scope="col">F-score</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="dcf-txt-center" data-label="Model">Logistic Regression</td>
			<td class="dcf-txt-center" data-label="Train AUC">0.844</td>
			<td class="dcf-txt-center" data-label="Test AUC">0.827</td>
			<td class="dcf-txt-center" data-label="Precision">0.134</td>
			<td class="dcf-txt-center" data-label="Specificity">0.722</td>
			<td class="dcf-txt-center" data-label="Recall">0.775</td>
			<td class="dcf-txt-center" data-label="F-score">0.228</td>
		</tr>
		<tr>
			<td class="dcf-txt-center" data-label="Model">Ada Boosting</td>
			<td class="dcf-txt-center" data-label="Train AUC">0.891</td>
			<td class="dcf-txt-center" data-label="Test AUC">0.834</td>
			<td class="dcf-txt-center" data-label="Precision">0.750</td>
			<td class="dcf-txt-center" data-label="Specificity">0.999</td>
			<td class="dcf-txt-center" data-label="Recall">0.021</td>
			<td class="dcf-txt-center" data-label="F-score">0.042</td>
		</tr>
		<tr>
			<td class="dcf-txt-center" data-label="Model">XGBoost</td>
			<td class="dcf-txt-center" data-label="Train AUC">0.942</td>
			<td class="dcf-txt-center" data-label="Test AUC">0.827</td>
			<td class="dcf-txt-center" data-label="Precision">0.134</td>
			<td class="dcf-txt-center" data-label="Specificity">0.806</td>
			<td class="dcf-txt-center" data-label="Recall">0.615</td>
			<td class="dcf-txt-center" data-label="F-score">0.241</td>
		</tr>
		<tr>
			<td class="dcf-txt-center" data-label="Model">Gradient Boosting</td>
			<td class="dcf-txt-center" data-label="Train AUC">0.992</td>
			<td class="dcf-txt-center" data-label="Test AUC">0.799</td>
			<td class="dcf-txt-center" data-label="Precision">0.301</td>
			<td class="dcf-txt-center" data-label="Specificity">0.979</td>
			<td class="dcf-txt-center" data-label="Recall">0.159</td>
			<td class="dcf-txt-center" data-label="F-score">0.208</td>
		</tr>
		<tr>
			<td class="dcf-txt-center" data-label="Model">Random Forest</td>
			<td class="dcf-txt-center" data-label="Train AUC">0.937</td>
			<td class="dcf-txt-center" data-label="Test AUC">0.822</td>
			<td class="dcf-txt-center" data-label="Precision">0.162</td>
			<td class="dcf-txt-center" data-label="Specificity">0.840</td>
			<td class="dcf-txt-center" data-label="Recall">0.557</td>
			<td class="dcf-txt-center" data-label="F-score">0.252</td>
		</tr>
		<tr>
			<td class="dcf-txt-center" data-label="Model">Extra Trees</td>
			<td class="dcf-txt-center" data-label="Train AUC">0.917</td>
			<td class="dcf-txt-center" data-label="Test AUC">0.817</td>
			<td class="dcf-txt-center" data-label="Precision">0.142</td>
			<td class="dcf-txt-center" data-label="Specificity">0.778</td>
			<td class="dcf-txt-center" data-label="Recall">0.666</td>
			<td class="dcf-txt-center" data-label="F-score">0.235</td>
		</tr>
		<tr>
			<td class="dcf-txt-center" data-label="Model">Decision Trees</td>
			<td class="dcf-txt-center" data-label="Train AUC">0.855</td>
			<td class="dcf-txt-center" data-label="Test AUC">0.771</td>
			<td class="dcf-txt-center" data-label="Precision">0.143</td>
			<td class="dcf-txt-center" data-label="Specificity">0.793</td>
			<td class="dcf-txt-center" data-label="Recall">0.623</td>
			<td class="dcf-txt-center" data-label="F-score">0.233</td>
		</tr>
		<tr>
			<td class="dcf-txt-center" data-label="Model">SVC</td>
			<td class="dcf-txt-center" data-label="Train AUC">0.874</td>
			<td class="dcf-txt-center" data-label="Test AUC">0.759</td>
			<td class="dcf-txt-center" data-label="Precision">0.000</td>
			<td class="dcf-txt-center" data-label="Specificity">1.000</td>
			<td class="dcf-txt-center" data-label="Recall">0.000</td>
			<td class="dcf-txt-center" data-label="F-score">0.000</td>
		</tr>
		<tr>
			<td class="dcf-txt-center" data-label="Model">KNearestNeighbor</td>
			<td class="dcf-txt-center" data-label="Train AUC">0.933</td>
			<td class="dcf-txt-center" data-label="Test AUC">0.714</td>
			<td class="dcf-txt-center" data-label="Precision">0.333</td>
			<td class="dcf-txt-center" data-label="Specificity">0.990</td>
			<td class="dcf-txt-center" data-label="Recall">0.086</td>
			<td class="dcf-txt-center" data-label="F-score">0.137</td>
		</tr>
	</tbody>
</table>

As mentioned earlier, one of the reasons we chose the Logistic Regression model was due to its high recall score. As the West Nile Virus can potentially lead to fatalities, it is of utmost importance that we aim to minimize our false negatives. Our Logistic Regression model has the best recall score of 0.775. It however, has slightly weaker precision and specificity scores as compared to the rest and in terms of Test AUC scoring, it was outperformed by the AdaBoost and XGBoost models. However the AdaBoost and XGBoost models have poor recall scores and as mentioned earlier, it is imperative that the false negatives are minimized to prevent cases from going undetected which may increase the probabilty of an outbreak which may then potentially have a snowball effect on the hosopitalisation rates. As such, we have determined that the Logistic Regression model is a fair trade-off where the model produced less false negative results without too much overfit and did not compromise too much on the specificity and precision scores.


## Cost Benefit Analysis

Comparing the cost to spray and the medical costs incurred because of WNV cases in a year, it is clear that the medical costs required to cover the WNV cases far exceed the costs to spray:

#### Cost of spraying

The cost of Zenivex E4 is about \\$80 per gallon ([North Dakota Department of Health, 2013](http://www.gfmosquito.com/wp-content/uploads/2013/06/2013-North-Dakota-Bid-Tabulation.pdf)). Given the current rate of spraying and assuming a total spray duration of 5 hours, the cost of pesticides for each sprayer truck is \\$843.76 - \\$1687.50. Given that the total area of Chicago is 606.1 km2, it would take about 1000 trucks at the same time to cover the entire area. This brings the cost of spraying to be around <b>\$843,760 - \$1,687,500</b>.

#### Medical Costs
	
A rough estimate puts cost per WNV case at approximately \$33,143 per inpatient and approximately \$6,317 per outpatient for all treatments. Cost for each WNV patient estimated to have spent time in a nursing home was around \$18,097. Productivity loss during symptomatic WNND cost \\$10,800 per patient <60 years of age and \$7,500 per patient >60 years of age (Table 3). Total medical costs accrued by all WNND patients was around \$2,791,838; total costs for all cases (medical cost plus productivity loss) was much higher approximating at \$3,710,006. 
([Barber LM, Schleier JJ 3rd, Peterson RK, 2010](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3322011/))


As such, it seems that it is more cost-efficient to conduct more mosquito spraying in an attempt to lower medical costs incurred. However, we also looked into analysing the spray efficacy in order to determine if it is indeed a more cost efficient method to reduce costs incurred or whether a more effective alternative solution should be pursued further. While the data received for the spraying was only data for 2 years, we can see that spraying actually helped in curbing WNV occurences. 

To conclude our cost-benefit analysis, we have evidence that despite some inadequate sprayings done in terms of location, overall, we can still see that spraying does in fact still help curb WNV in general. Considering the fact that medical costs are much higher than spraying costs, and that there are currently no specific medications to treat patients with WNV, it is thus important to make sure spraying operations are carried out at critical locations. Even though there will be higher spendage in spraying operations, increased spraying operations would most likely reduce the number of WNV occurences and patients, which would ultimately reduce medical costs and therefore overall costs.

However, after more analysis, we realised that while it is economically beneficial to spray as a preventive measure, the way it was conducted was not the most cost efficient. This is because some areas were inadequately sprayed.

We will next proceed with recommendations based on our cost benefit analysis and predictive model.

## Recommendations

As mentioned earlier, it seems to be economically beneficial to increase the spray frequencies/area of spraying as it helps to reduce the probability of the presence of the virus. However, we concluded that the method used was not cost efficient as there were outbreak areas that were still inadequately sprayed and areas that did not require a higher frequency of spraying. As such, we then dove deeper to try to determine which areas were predicted to have a large outbreak of the virus. This can then assist in evaluating and determining the need for an increased frequency of targeted spraying. 


## Model Limitations

As with any other models, our model does have some limitations which may affect our ability to generate a model with more ideal results. 

For starters, our dataset is limited to Chicago and it may not be as relevant to other cities/countries. This is especially so with cities/ countries with very different climates. This is because the mosquito behaviour may not be the same as adaptation could have occurred which may then produce poor results as our model is highly dependent on the temperature and weather features. 

In addition, the dataset received for the trap locations was only limited to alternate years betwwen 2007 - 2014. The dataset received for the spray information was even more limited with only 2 years worth of data received (2011 & 2013). Having consecutive years for training the model may produce one with more well rounded results. 



## Data Dictionary
| Name                   | Dataset    | Type     | Description                                                                                                                                                                                                                                                  |
|------------------------|------------|----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Id                     | train/test | int      | ID number of the record                                                                                                                                                                                                                                      |
| Date                   | train/test | datetime | Date the WNV test was performed                                                                                                                                                                                                                              |
| Address                | train/test | datetime | Approximate trap address retrieved from   GeoCoder                                                                                                                                                                                                           |
| Species                | train/test | str      | Mosquito species in trap                                                                                                                                                                                                                                     |
| Block                  | train/test | str      | Block Number of address                                                                                                                                                                                                                                      |
| Street                 | train/test | str      | Street of address                                                                                                                                                                                                                                            |
| Trap                   | train/test | str      | ID number of the trap                                                                                                                                                                                                                                        |
| AddressNumberAndStreet | train/test | str      | Approximate address retrieved from   GeoCoder                                                                                                                                                                                                                |
| Latitude               | train/test | float    | Latitude retrieved from GeoCoder                                                                                                                                                                                                                             |
| Longitude              | train/test | float    | Longitude retrieved from GeoCoder                                                                                                                                                                                                                            |
| AddressAccuracy        | train/test | int      | Accuracy of information returned from   GeoCoder                                                                                                                                                                                                             |
| NumMosquitos           | train      | int      | Number of mosquitoes in a sample                                                                                                                                                                                                                             |
| WnvPresent             | train      | int      | Whether or not WNV is present in a sample   (1 = present; 0 = absent)                                                                                                                                                                                        |
| Station                | weather    | str      | Station 1 or 2                                                                                                                                                                                                                                               |
| Date                   | weather    | datetime | Date of measurement (YY/MM/DD)                                                                                                                                                                                                                               |
| Tmax                   | weather    | float    | The highest temperature for the day in   degrees Fahrenheit (F).                                                                                                                                                                                             |
| Tmin                   | weather    | float    | The lowest temperature for the day in   degrees Fahrenheit (F).                                                                                                                                                                                              |
| Tavg                   | weather    | float    | The average temperature for the day in degrees Fahrenheit (F).                                                                                                                                                                                               |
| Depart                 | weather    | float    | Departure from normal temperature. The difference between column 4 and   the 30 year normal temperature for this date. A minus (-) is number of   degrees below normal. A zero (0) indicates that the average for that day was   the normal temperature. (F) |
| DewPoint               | weather    | float    | Average Dew Point temperature (F)                                                                                                                                                                                                                            |
| WetBulb                | weather    | float    | Average Wet Bulb temperature (F)                                                                                                                                                                                                                             |
| Heat                   | weather    | float    | Heating Degree Days base 65F, season begins with July.                                                                                                                                                                                                       |
| Cool                   | weather    | float    | Cooling Degree Days base 65F, season begins with January.                                                                                                                                                                                                    |
| Sunrise                | weather    | float    | Time of sunrise                                                                                                                                                                                                                                              |
| Sunset                 | weather    | float    | Time of sunset                                                                                                                                                                                                                                               |
| CodeSum                | weather    | str      | Significant weather phenomena                                                                                                                                                                                                                                |
| Depth                  | weather    | float    | Snow depth on the ground to the nearest inch                                                                                                                                                                                                                 |
| Water1                 | weather    | float    | Water Equivalent in inches                                                                                                                                                                                                                                   |
| SnowFall               | weather    | float    | Total snowfall for the day to the nearest tenth of an inch.                                                                                                                                                                                                  |
| PrecipTotal            | weather    | float    | Total  precipitation for the day to the nearest hundredth of an   inch. This includes all forms of precipitation, both liquid and water   equivalent of any snow or ice that occurred                                                                        |
| StnPressure            | weather    | float    | Average station pressure in hg (inches)                                                                                                                                                                                                                      |
| SeaLevel               | weather    | float    | Average sea level pressure in hg (inches)                                                                                                                                                                                                                    |
| ResultSpeed            | weather    | float    | Resultant Wind Speed - Vector sum of wind speeds divided by number of   observations (MPH)                                                                                                                                                                   |
| ResultDir              | weather    | float    | Resultant Wind Direction - Vector sum of wind divided by number of   observations (in tens of degrees)                                                                                                                                                       |
| AvgSpeed               | weather    | float    | Average wind speed (MPH)                                                                                                                                                                                                                                     |
|        Date            | spray      | datetime | The date the pesticide was sprayed (YY/MM/DD)                                                                                                                                                                                                                |
| Time                   | spray      | datetime | Time of spray                                                                                                                                                                                                                                                |
| Latitude               | spray      | float    | The latitude of the location sprayed.                                                                                                                                                                                                                        |
| Longitude              | spray      | float    | The longitude of the location sprayed.                        
