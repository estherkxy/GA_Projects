<img src="http://imgur.com/1ZcRyrc.png" style="float: left; margin: 20px; height: 55px">

# Project 1: Standardized Test Analysis



## Problem Statement

The new format for the SAT was released in March 2016. As an employee of the College Board - the organization that administers the SAT - you are a part of a team that tracks statewide participation and recommends where money is best spent to improve SAT participation rates. Your presentation and report should be geared toward non-technical executives with the College Board and you will use the provided data and outside research to make recommendations about how the College Board might work to increase the participation rate in a state of your choice.



## Data Dictionary: 

|Feature|Type|Dataset|Description|
|---|---|---|---|
|state|`object`|act_csv/sat_csv|Names of all US states|
|act_2017_rate|`int`|ACT 2017| The rate of 2017 graduating seniors who took the ACT as a percentage out of 100|
|act_2017_english|`float`|ACT 2017|Average english score on the ACT in 2017 (Min: 1, Max:36)|
|act_2017_math|`float`|ACT 2017|Average math score on the ACT in 2017 (Min: 1, Max:36)|
|act_2017_reading|`float`|ACT 2017|Average reading score on the ACT in 2017 (Min: 1, Max:36)|
|act_2017_science|`float`|ACT 2017|Average science score on the ACT in 2017 (Min: 1, Max:36)|
|act_2017_total|`float`|ACT 2017|Average total score derived as a composite of Math, Reading, English and Science scores on the ACT in 2017 (Min: 1, Max:36)|
|sat_2017_rate|`int`|SAT 2017| The rate of 2017 graduating seniors who took the SAT as a percentage out of 100|
|sat_2017_ebrw|`int`|SAT 2017|Average score for reading and writing on the SAT in 2017 (Min: 200, Max: 800)|
|sat_2017_math|`int`|SAT 2017|Average score for math on the SAT in 2017 (Min: 200, Max: 800)|
|sat_2017_total|`int`|SAT 2017|Average total score derived as a composite of Math and Reading and Writing scores on the SAT in 2017 (Min: 400, Max:1600)|
|act_2018_rate|`int`|ACT 2018| The rate of 2018 graduating seniors who took the ACT as a percentage out of 100|
|act_2018_total|`float`|ACT 2018|Average total score derived as a composite of Math, Reading, English and Science scores on the ACT in 2018 (Min: 1, Max:36)|
|sat_2018_rate|`int`|SAT 2018| The rate of 2018 graduating seniors who took the SAT as a percentage out of 100|
|sat_2018_ebrw|`int`|SAT 2018|Average score for reading and writing on the SAT in 2018 (Min: 200, Max: 800)|
|sat_2018_math|`int`|SAT 2018|Average score for math on the SAT in 2018 (Min: 200, Max: 800)|
|sat_2018_total|`int`|SAT 2018|Average total score derived as a composite of Math and Reading and Writing scores on the SAT in 2018 (Min: 400, Max:1600)|
|act_2019_rate|`int`|ACT 2019| The rate of 2019 graduating seniors who took the ACT as a percentage out of 100|
|act_2019_total|`float`|ACT 2019|Average total score derived as a composite of Math, Reading, English and Science scores on the ACT in 2019 (Min: 1, Max:36)|
|sat_2019_rate|`float`|SAT 2019| The rate of 2019 graduating seniors who took the SAT as a percentage out of 100|
|sat_2019_ebrw|`int`|SAT 2019|Average score for reading and writing on the SAT in 2019 (Min: 200, Max: 800)|
|sat_2019_math|`int`|SAT 2019|Average score for math on the SAT in 2019 (Min: 200, Max: 800)|
|sat_2019_total|`int`|SAT 2019|Average total score derived as a composite of Math and Reading and Writing scores on the SAT in 2019 (Min: 400, Max:1600)|

The SAT dataset contains the average SAT scores of students by state. All 51 states (Washington DC became a state in 2020) of the US are represented in the data, excluding non-state territories such as Puerto Rico and Virgin Islands. This particular dataset includes the two compulsory sections of the SAT, which are Math section and the Evidence Based Reading and Writing section. The dataset also has a record of average total scores by state, and participation rate by state.

The ACT dataset similarly consists of the average ACT scores of students by state, includes the average English, Math, Reading, Science and Composite of students. Unlike the SAT dataset, the ACT dataset includes a row with national averages. There are four columns indicating English, Math, Reading and Science scores. The ACT data also includes participation rates by state.

It's worth noting that the average total scores for both tests are derived from subject scores listed within the dataset, and do not include additional subjects outside the dataset.



### Data cleaning: 
Due to the incomplete nature of the dataset, some data cleaning processes were involved. 

Here were some issues identified with the datasets used:

- SAT 2017 dataset:
    - Abnormally low average Math Score of 52 when minimum is 200
    - The datatype of the participation rates column is a string `object` instead of an `int` or `float`

- ACT 2017 dataset:
    - Abnormally low average score of 2.3 (Maryland)
    - Extra row (National average) within dataset
    - Composite score column is a string `object` when it should be a `float` -- this is due to the '20.2x' string in Wyoming column

- SAT 2018
    - Nothing of significance to note
    
- ACT 2018
    - Duplicate entries for the state of Maine
    
- SAT 2019
    - Dataset included data for Puerto Rico and Virgin Islands which should not be included as they are not part of the states of America. 
        - Should also note that there are missing values for the participation rates that were highlighted out

- ACT 2019
    - Extra row (National average) within dataset

**It is also worth noting that only the ACT 2017 dataset had the individual subject test scores while the 2018 and 2019 dataset only conprised of the composite test score.**


General data cleaning processes:

- Checking of datatypes 
- Defining a function to rename and update columns using list comprehension
- Setting the State name as the index of the dataframes using `.set_index()`
- Merging dataframes into one combined dataframe using `.join()` 



### Brief Analysis:

**Exposing Selection Bias**

When looking at the SAT, we can see that only 4 states had participation rates of 100% in 2017. This increased to 5 states in 2018 and 8 states in 2019. In comparison, the ACT had 17 states with participation rates of 100% in 2017, with this number remaining unchanged in 2018 but with a slight decrease to 15 states in 2019. We can infer from this that the ACT has a larger baseline following than the SAT.

Delving further into the data, we can also observe a noticeable trend where mid-western/rural states like Kansas and Iowa seem to do better on the SAT as compared to urban states like Washington DC or coastal states like Delware. The opposite pattern seems true, where urban states like New York and DC do better than rural states like South Carolina on the ACT. **However, if we look closer, this is actually a case of selection bias.**

Students taking the SAT in states with extremely ACT dominant states (like Kansas or Iowa) are likely planning to apply to out of state universities that require the SAT. The ability to afford both the SAT and relocate to a geographically distant location suggests that these students are likely to be of an above average socioeconomic status, which makes them unrepresentative of the average population of students taking the SAT.


Colorado had a massive jump in their SAT participation rate from 11% in 2017 to 100% in 2018. Illinois also had a similar jump, from 9% in 2017 to 99% in 2018. In 2019, West Virginia also experienced a massive jump from 28% to 99%. This was also seen in Florida with an increase of 56% to 100%

**This was due to changes in state educational policy, which made the SAT compulsory in both Colorado and Illinois.**

DC's SAT participation rate dropped from 100% to 92% in 2018, while Idaho's SAT participation rate increased from 93% to 100% in 2018.



Colorado's ACT participation rate dropped massively from 2017 to 2018, while Nebraska and Ohio both increased their ACT participation rates from 2017 to 2018. In Nebraska, the ACT was made mandatory, leading to an increase in participation rate. In Ohio, standardized testing through the SAT or ACT also became mandatory -- despite being given a choice of which test to adopt, the majority of state districts (95%) chose the ACT over the SAT.

There were not any significant differences from 2018 to 2019 for the ACT dataset.


**Flordia, Hawaii and Georgia had greater than 50% participation rates for both tests in 2017, 2018 and 2019.** Hawaii is interesting as the state is rather unique in terms of its location and demographics. The majority of Hawaiians [live in urban areas](https://files.hawaii.gov/dbedt/census/Census_2010/Other/2010urban_rural_report.pdf), which seems to be contrary to the trend of urban/coastal states favoring the SAT test.

Both North and South Carolina both have more than 50% participation for the ACT and SAT tests. Interestingly, North Carolina, South Carolina, Florida and Georgia are in close geographic proximity, and are all officially recognised as part of the [Southern US region](https://www2.census.gov/geo/pdfs/maps-data/maps/reference/us_regdiv.pdf). These are generally considered to be highly conservative, republican states. We'll take a look later to see if political affiliation truly has anything to do with participation rates.




### Visualisation models used:

1. Heatmap between numeric features of ACT and SAT in 2017 - 2019
    - **ACT participation has a strong negative correlation with ACT subject scores and overall ACT scores**. This means that states with higher ACT participation tend to have lower ACT scores, and vice versa for states with low ACT participation rates. This is mirrored in SAT participation rates, where there is an equally strong negative correlation between participation rates and SAT scores.

    - **Subject and test scores from a year are strongly correlated with the same subject and test scores in the following years**. This means that states that did well in the previous year, are likely to do well in the following year. This is unsurprising as states are unlikely to dramatically go up or down in test scores over a single year, due to policies and institutions (e.g. state education departments) that work to maintain consistent educational results year-on-year. Barring dramatic policy changes like switching from one test to another, states are likely to produce to the same results.

    - **Test scores / participation rates for each are also negatively correlated with the other test**. This shows that it's pretty rare for a student to take both tests.
    

2. Histogram of SAT and ACT participation over the years 
    - **Overall, we can see that the ACT has a larger baseline following than the SAT.** The SAT has a large number of states with an extremely low participation rate, while the ACT has a large number of states with a extremely high participation rate.

    - **In 2018, SAT participation increased by 5.9%, while ACT participation decreased by 3.7% on average.** This suggests that some states are beginning to adopt the SAT test over the ACT test, with some states moving away from standardized testing altogether. The number of states with a 90% - 100% participation for the SAT increased in 2018, while ACT participation rates for states in the same range remained consistent.


3. Scatterplot of ACT/SAT scores over the three years
    - ACT and SAT test results year by year have a very strong correlation. **This means that states that did well in the last year are likely to do well in the next year.** This correlation is much stronger for the ACT test, meaning that ACT scores tend to remain static from one year to the next. This could actually be an incentive for high-scoring states to stay with the ACT, given that scores seem to less from one year to the next as compared to the SAT.
    
    
4. Boxplots of SAT/ACT participation rates
    - The ACT test has a higher median than the SAT test, indicating that the **ACT participation rates are generally higher than SAT participation rates.** The only exception was in 2019 where the median was the same.

    - The ACT participation rates are also skewed right, suggesting that **there is strong support for the ACT test throughout the US**. SAT participation rates are generally skewed left.

    - However, from 2017 to 2018, we can observe that the median for SAT participation has been increasing, while the median for ACT participation median dropped. Variance (as measured by the Interquartile range) also seems to have risen, leading to a decrease in skewness. **This could suggest that support for the SAT test is beginning to rise throughout the US**.


### Outside Research
Participation rates in the SAT and ACT are largely determined by state education policy. The largest jumps in SAT and ACT participation in 2018 were due to states like [Colorado switching from the SAT and ACT](https://www.coloradoindependent.com/2017/07/06/from-csap-to-parcc-heres-how-colorados-standardized-tests-have-changed-and-whats-next/), leading to a massive jump in their SAT participation rate from 11% to 100%. Accordingly, ACT participation rates dropped from 100% to 30%. Illinois also had a similar jump, from 9% in 2017 to 99% in 2018, due to the state [switching to the SAT in 2018](https://chicago.chalkbeat.org/2018/7/27/21105418/illinois-has-embraced-the-sat-and-the-act-is-mad-about-it).

Hawaii is particularly interesting as the state is unique in terms of its location and demographics. The majority of Hawaiians live in urban areas, which seems to be contrary to the trend of urban states favoring the SAT test. One of the reasons behind high SAT and ACT participation rates could be due to Hawaii's strong testing culture, which can be traced back to the federal 'No Child Left Behind' law, when Hawaii won a $75 million Race to the Top grant that [established performance outcomes tied to test scores](https://www.civilbeat.org/2018/04/hawaii-teachers-think-your-kids-are-taking-way-too-many-tests/). This suggests that schools are pushing for standardized testing beyond the norm. The ACT participation rate is greater than the SAT participation rate as public schools started made the [ACT mandatory for all Hawaii public school juniors starting from 2014](https://www.hawaiinewsnow.com/story/32835151/hawaii-students-perform-better-on-act-but-scores-still-lag-behind-nation/).

A common trend in states with above 50% participation for both the SAT and ACT has been the rise of a [counter-movement against standardized testing](https://www.edweek.org/teaching-learning/what-happens-when-states-un-standardize-tests/2018/10) in general. States like [Georgia and North Carolina](https://www.edweek.org/education/four-states-want-in-on-second-round-of-essas-innovative-assessment-pilot/2018/10?cmp=soc-edit-tw) signed on to the Innovative Assessment pilot launched by the US government in 2018, which is a programme that intends to use different assessment methods as an alternative to traditional standardized tests. [Hawaii and South Carolina](http://blogs.edweek.org/edweek/campaign-k-12/2018/10/essa-innovation-testing-georgia-kansas-south-carolina-hawaii.html) have also signalled interest in the program.

The high ACT/SAT participation rates in Florida is likely due to the [mandatory Florida Statewide Assessments (FSA)](http://www.flvs.net/student-resources/full-time/statewide-assessment-testing#:~:text=Florida%20Statewide%20Assessment%20Program,achievement%20of%20the%20Florida%20Standards). This means that students who want to apply to out of state universities still need to take the SAT and ACT. While some school officials have tried to push for the adoption of the SAT or ACT over local assessments and reduce standardized testing in general, the state has argued that the [ACT and SAT is unable to replace the FSA](http://www.fldoe.org/core/fileparse.php/5663/urlt/ACTSATFSA.pdf). There continues to be further pushback against standardized testing in Florida.


### Conclusion and Reccomendations

From the data, we know that states with a higher ACT participation rate tend to get lower ACT scores on average. The opposite is true for states that take the SAT. This could make a compelling argument for states that are looking to improve their position on the National Assessment of Educational Progress ([NAEP](https://www.ets.org/k12/assessments/federal/naep/?WT.ac=k12_36148_overwrite_naep_170105)).

Given that North Carolina falls into the above group (higher ACT participation and below average ACT scores) and has not yet committed to the Innovative Assessment pilot, I **recommend that the College Board work with North Carolina to work with to raise SAT participation rates**.

However, the College Board must take into account the growing movement against standardized testing. Instead of trying to pile on additional tests, the College Board must partner states in their effort to reduce over-testing and market the SAT as a tool to help with this process.

Beyond just signing a contract with a state, the College Board should also look to incorporate other forms of testing such as portfolio-based assessment or adaptive testing.

With COVID-19 heavily affecting standardized testing throughout the United States and further pushing states to consider the alternative means of assessment, the College Board must continue to adapt the SAT to fit the times that we are now in.












