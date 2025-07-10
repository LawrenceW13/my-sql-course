SELECT 
    ps.PatientId
    , ps.Hospital
    , ps.Ward
    , DATEADD(WEEK,-2,ps.AdmittedDate) AS ReminderDate
    , ps.AdmittedDate 
    , ps.DischargeDate
    , DATEDIFF(DAY, ps.AdmittedDate, ps.DischargeDate) AS LengthOfStay
    , ps.Ethnicity
    , ps.Tariff
FROM PatientStay ps
WHERE ps.Hospital IN ('Kingston', 'PRUH')
and ps.Ward LIKE '%surgery'
order by 
    ps.AdmittedDate DESC
    , ps.PatientId DESC