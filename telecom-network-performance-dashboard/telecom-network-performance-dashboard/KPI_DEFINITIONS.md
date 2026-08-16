# KPI Definitions

- **RRC Success Rate (%)** — accessibility KPI.
- **ERAB Success Rate (%)** — bearer setup accessibility KPI.
- **Drop Call Rate (%)** — retainability KPI; lower is better.
- **DL Throughput (Mbps)** — user-plane performance KPI.
- **Congestion (%)** — capacity pressure indicator; lower is better.
- **CQx Score** — weighted composite health score:

`0.25 × RRC SR + 0.25 × ERAB SR + 0.15 × (100 − DCR) + 0.20 × Throughput + 0.15 × (100 − Congestion)`

Portfolio thresholds:
- CQx < 70: Red
- CQx 70–75: Yellow
- CQx > 75: Green

This project uses synthetic data and simplified portfolio logic for demonstration purposes.
