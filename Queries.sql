use Dialysis_project;
select * from Dialysis_project;
-- 1.Number of Patients across various summaries--
select sum(nPCR_summary) as nPCR_Summary,
sum(hypercalcemia_summary) as hypercalcemia_summary,
sum(Serum_phosphorus_summary) as Serum_phosphorus_summary,
sum(hospitalization_summary) as hospitalization_summary,
sum(hospital_readmission_summary) as hospital_readmission_summary,
sum(survival_summary) as survival_summary,
sum(fistula_summary) as fistula_summary,
sum(long_term_catheter_summary) as long_term_catheter_summary,
sum(patients_facility_for_SWR) as SWR_summary from dialysis_1;

-- 2.Profit Vs Non-Profit Stats--
SELECT
    `Profit_Non-Profit`,
    COUNT(*) AS Facilities
FROM
    dialysis_1
GROUP BY
    `Profit_Non-Profit`;
    
-- 3.Chain Organizations w.r.t. Total Performance Score as No Score--
select `Chain_Organization`,count(`Total_Performance_Score`) as total_performance_no_source from `dialysis_2` as d2 join `dialysis_1` as d1
on d1.`provider_number` = d2.`CMS_Certification_Number(CCN)`
where `Total_Performance_Score`="no score" group by `Chain_Organization` order by total_performance_no_source desc
limit 5;

-- 4.Dialysis Stations Stats--
SELECT count(Dialysis_Stations) as dialysis_station_stats, State
FROM dialysis_1
GROUP BY State
order by count(Dialysis_Stations) desc;

-- 5.# of Category Text  - As Expected--
select 'Patient_Transfusion' AS category_type,
Count(Patient_Transfusion_category_text) as '# of category text'
 from dialysis_1 where Patient_Transfusion_category_text = 'As expected'
 union all
 select 'Patient_hospitalization' AS category_type, 
 Count(Patient_hospitalization_category_text) 
 from dialysis_1 where Patient_hospitalization_category_text = 'As expected' 
 union all
 select 'Patient_Hospital_Readmission' AS category_type,
 Count(Patient_Hospital_Readmission_Category) 
 from dialysis_1 where Patient_Hospital_Readmission_Category = 'As expected' 
 union all
 select 'Patient_Survival' AS category_type, 
 Count(Patient_Survival_Category_Text) 
 from dialysis_1 where Patient_Survival_Category_Text = 'As expected' 
 union all
 select 'Patient_Infection' AS category_type,
 Count(Patient_Infection_category_text) 
 from dialysis_1 where Patient_Infection_category_text = 'As expected'
 union all
  select 'Fistula' AS category_type,
  Count(Fistula_Category_Text) 
 from dialysis_1 where Fistula_Category_Text = 'As expected'
 union all
  select  'SWR' AS category_type,
  Count(SWR_category_text) 
 from dialysis_1 where SWR_category_text = 'As expected'
 union all
  select 'PPPW' AS category_type,
  Count(PPPW_category_text) 
 from dialysis_1 where PPPW_category_text = 'As expected';


-- 6.Average Payment Reduction Rate--
SELECT ROUND(AVG(Payment_Reduction_Percentage) * 100, 3) AS Average_Payment_Reduction_Rate
FROM dialysis_2;