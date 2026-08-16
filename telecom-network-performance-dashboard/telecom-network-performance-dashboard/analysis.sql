-- Telecom Network Performance Dashboard - example SQL
-- Synthetic portfolio data only.

-- 1) Latest KPI snapshot by site
WITH ranked AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY Market, Site ORDER BY Week DESC) AS rn
    FROM telecom_network_kpi
)
SELECT Market, Site, Week, RRC_SR_pct, ERAB_SR_pct, DCR_pct,
       DL_Throughput_Mbps, Congestion_pct, CQx_Score
FROM ranked
WHERE rn = 1
ORDER BY CQx_Score ASC;

-- 2) Chronic offenders: sites below CQx 75 for 3+ weeks
SELECT Market, Site,
       COUNT(*) AS Weeks_Below_75,
       AVG(CQx_Score) AS Avg_CQx,
       AVG(DCR_pct) AS Avg_DCR,
       AVG(Congestion_pct) AS Avg_Congestion
FROM telecom_network_kpi
WHERE CQx_Score < 75
GROUP BY Market, Site
HAVING COUNT(*) >= 3
ORDER BY Weeks_Below_75 DESC, Avg_CQx ASC;

-- 3) Market-level executive KPI summary
SELECT Market,
       AVG(CQx_Score) AS Avg_CQx,
       AVG(RRC_SR_pct) AS Avg_RRC_SR,
       AVG(ERAB_SR_pct) AS Avg_ERAB_SR,
       AVG(DCR_pct) AS Avg_DCR,
       AVG(DL_Throughput_Mbps) AS Avg_DL_Throughput,
       AVG(Congestion_pct) AS Avg_Congestion
FROM telecom_network_kpi
GROUP BY Market
ORDER BY Avg_CQx ASC;
