-- change from text to date
ALTER TABLE bank_full.prosperloandata
MODIFY LoanOriginationDate DATE;



-- Track loan book performance - Distursements, amount paid, returns, debt to income ratio, loss rate
SELECT 
	-- LoanOriginationDate,
    DATE_FORMAT(LoanOriginationDate, '%Y-%m-01 00:00:00') AS month, 
    DATE_FORMAT(LoanOriginationDate, '%Y') AS year,
	SUM(LoanOriginalAmount) AS total_dis,
    ROUND(SUM(LP_CustomerPayments),0) AS total_paid,
    ROUND(AVG(EstimatedReturn),2) AS profit,
    ROUND(AVG(EstimatedLoss),2) AS lossrate,
    ROUND(AVG(DebtToIncomeRatio),2) AS debtincome
FROM prosperloandata
WHERE LoanOriginationDate > '2009-12-31'
GROUP BY 1,2
ORDER BY 1;