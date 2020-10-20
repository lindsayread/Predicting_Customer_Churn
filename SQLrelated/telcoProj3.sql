select * from churntable6 limit 10;

--how many customers churned and stayed in the last month?

select count(churn) from churntable6
where churn = 'No';

/* 5,174 */

select count(churn) from churntable6
where churn = 'Yes';

/* 1,869 */

/* imbalanced classes - will want to use class imbalance techniques */

select count(churn) from churntable6
group by churn;
--groupby customers that have both phone and internet service

select churn, count(churn) from churntable6
where phoneservice = 'Yes' and internetservice != 'No'
group by churn;

/* 3,249 stayed and 1,586 left */

--groupby customers that have only phone service (no internet service)

select churn, count(churn) from churntable6
where phoneservice = 'Yes' and internetservice = 'No'
group by churn;

/* 1413 stayed and 113 left. Good indicator that there is something with the internetservice that customers do not like */

-- groupby customers that have only internet service (no phone service)

select churn, count(churn) from churntable6
where phoneservice = 'No' and internetservice != 'No'
group by churn;

/* 512 stayed and 170 left */

select churn, internetservice ,count(churn) from churntable6
where phoneservice = 'Yes'
group by churn, internetservice;

/* 1450 with DSL stayed; 289 with DSL left.
1799 with Fiber Optic stayed; 1297 with Fiber Optic Left.
1413 with no internet stayed; 113 with no internet left. */

-- what do people with high tenure have in common?
--, phoneservice, paymentmethod,

select churn, internetservice, count(churn)
from churntable6
where tenure>=12
group by churn, internetservice;

/* high tenure with low rates of churn had either no internet or DSL */

select churn, internetservice, count(churn)
from churntable6
where tenure<12
group by churn, internetservice;

/* highest rates of churn for low tenure were Fiber Optic and then DSL */

--whats the average monthlycost of customers with different types of internet service?

select internetservice, avg(monthlycharges) as avgmonth
from churntable6
group by internetservice;

/* no internetservice: 21.08
DSL: 58.10
Fiber optic: 91 */

select internetservice, avg(monthlycharges) as avgmonth
from churntable6
where phoneservice != 'No'
group by internetservice;

/* no internetservice: 21.08
DSL: 64.4
Fiber Optic: 91.5 */

select internetservice, avg(monthlycharges) as avgmonth
from churntable6
where phoneservice = 'No'
group by internetservice;

/* DSL is the only internet service type where phoneservice='No'
DSL with no phoneservice: 42.03 */

select phoneservice, avg(monthlycharges) as avgmonth
from churntable6
where internetservice = 'No'
group by phoneservice;

/* avgmonth phone service only (no internetsevice): 21.08 */

-- does streaming tv and/or movies have an affect on churn?

select churn, streamingtv, streamingmovies, count(churn)
from churntable6
where internetservice != 'No'
group by churn, streamingtv, streamingmovies;

/* people that either did not get any type of streaming services or people that got both movies and tv appeared to be the most satified */

-- does paperless billing have an affect on churn?

select churn, paperlessbilling, count(churn)
from churntable6
group by churn, paperlessbilling;

/* paperlessbilling=no had much lower churn rate than paperlessbilling=yes */

--does auto payment methods have an affect on churn?

select churn, paymentmethod, count(churn)
from churntable6
group by churn, paymentmethod;
 /* automatic payment methods had much lower churn rate than non-automatic methods.
  * Electronic check method in particular, had the highest churn rate */

-- add feature engineered columns (separate payment method into autopayment (yes/no); longtermcontract (yes/no):

alter table churntable6 
	add column autopayment varchar(5),
	add column longtermcontract varchar(5);

update churntable6 
set autopayment = 'Yes'
where paymentmethod = 'Bank transfer (automatic)';

update churntable6 
set autopayment = 'Yes'
where paymentmethod = 'Credit card (automatic)';

update churntable6 
set autopayment = 'No'
where paymentmethod = 'Electronic check';

update churntable6 
set autopayment = 'No'
where paymentmethod = 'Mailed check';

-- update longtermcontract values:

update churntable6 
set longtermcontract = 'No'
where contract = 'Month-to-month';

update churntable6 
set longtermcontract = 'Yes'
where contract = 'One year';

update churntable6 
set longtermcontract = 'Yes'
where contract = 'Two year';

--check that columns are added correctly: 

select * from churntable6 limit 20;

select * from churntable6 
where contract != 'Month-to-month'
limit 10;

-- how does longtermcontract affect churn

select churn, longtermcontract, count(churn)
from churntable6
group by churn, longtermcontract;

/* customers with a longtermcontract had much lower churn rate than those with month-to-month contract */

-- how does autopayment affect churn

select churn, autopayment, count(churn)
from churntable6
group by churn, autopayment;

/* customers with autopayment methods had much lower churn rate than non-autopayment methods */
