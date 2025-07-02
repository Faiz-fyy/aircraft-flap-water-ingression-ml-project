# Aircraft Flap Water Ingression Predictive Analytics

![Python](https://img.shields.io/badge/Python-3.8+-blue) ![Machine Learning](https://img.shields.io/badge/ML-Classification-orange) ![Industry](https://img.shields.io/badge/Industry-Aviation-green) ![Database](https://img.shields.io/badge/Database-MySQL-yellow) ![Visualization](https://img.shields.io/badge/Visualization-Tableau-lightblue)

**Predictive analytics for aircraft trailing edge flap water ingression detection using multi-modal NDT data**

*NDT Engineering to Data Science career transition project - An introductory to time series analysis and database architecture*

## Project Overview

Machine learning application for predicting water ingression in aircraft trailing edge flap components using Ultrasonic Testing (UT) and Radiographic Testing (RT/X-ray) inspection data. This project demonstrates advanced data science capabilities including database design, sophisticated visualization, and risk-based maintenance scheduling in aviation MRO operations.

**Key Achievement: 68% Recall in water ingression detection using Optimized Logistic Regression with risk-based component prioritization**

## Business Problem

Water ingression in aircraft composite structures leads to structural degradation and potential safety risks. Traditional reactive maintenance results in unexpected failures and costly unscheduled repairs. This project develops a **predictive maintenance framework** that identifies high-risk components before failure occurs, optimizing maintenance schedules and enhancing flight safety.

### Dataset Characteristics
- 503 NDT inspection records with multi-modal testing data
- Balanced class distribution: 65% No Water vs 35% Water ingression  
- Component lifecycle tracking across 13 part number variants
- 6.6 years of operational data with temporal pattern analysis
- Advanced feature engineering incorporating physics-based calculations

## Technical Approach

### Data Pipeline Evolution
Building on previous project (Aircraft Hub Inspection Predictive Modeling project) foundation with significant **Kaizen improvements**:

1. **Data Quality**: 74% missing value recovery
2. **Improved Class Balance**: 35% positive class (vs 14% in previous project) 
3. **Database Design**: 3NF MySQL architecture for scalability
4. **Sophisticated Visualization**: 15 chart types across 8 Tableau dashboards
5. **Physics Integration**: NDT exposure calculations using inverse square law

### Model Performance Comparison

| Model | Precision | Recall | F1 | ROC AUC | Approach |
|-------|-----------|--------|----|---------|----------|
| Logistic Regression | 36% | 59% | 44% | 61% | Baseline with class weighting |
| Random Forest | 51% | 47% | 49% | 61% | Tree-based ensemble |
| XGBoost | 40% | 43% | 42% | 54% | Gradient boosting |
| **Optimized LogReg** | **43%** | **68%** | **53%** | **60%** | **SMOTE + threshold optimization** |

## Key Technical Innovations

### Feature Engineering
1. **Physics-Based Metrics**: Exposure = mAm/(SFD²) implementing inverse square law
2. **Temporal Features**: Quarterly patterns, rain season classifications  
3. **Component Lifecycle**: Age-based degradation modeling
4. **Categorical Binning**: Strategic parameter groupings for pattern discovery

### Database Architecture (3NF Design)
```sql
-- Normalized schema for scalability
parts (SN_ID, SN, PN, Position)
parameters (Parameters_ID, mAm, SFD, D4, D7, Exposure)  
relative_date (Date_ID, Relative_Day, Relative_Week, Relative_Month, Relative_Quarter, Rain_Season)
inspections (Inspection_ID, Date_ID, SN_ID, Parameters_ID, Water, Disbond)
```

### Analytics Framework
- **SHAP Interpretability**: Feature importance with decision path analysis
- **Threshold Optimization**: Precision-recall trade-off for safety-critical applications  
- **Risk Stratification**: Component-level risk scoring with maintenance recommendations
- **Temporal Analysis**: Operational pattern recognition and trend forecasting

## Business Intelligence Insights

### Component Risk Assessment
**Critical Risk Components (8 units requiring immediate inspection):**
- 5 PN09 units: 2016-2204 days old (Risk Score: 5.0)
- 3 PN08 units: 2016-2233 days old (Risk Score: 4.0)

**Risk Distribution:**
- Critical: 1.6% (8 components) - Inspect every 30 days
- High: 8.1% (41 components) - Inspect every 60 days  
- Medium: 58.6% (295 components) - Inspect every 90 days
- Low: 31.6% (159 components) - Inspect every 120 days

### Operational Intelligence
- **Aging Effect Validation**: 88% increase in failure rate over component lifecycle
- **Part Design Insights**: PN09 shows 66.7% water rate vs PN13 at baseline levels
- **Seasonal Patterns**: Transitional monsoon periods show highest risk (39.8%)
- **MCO Period Analysis**: COVID operational changes clearly visible in inspection patterns

### Predictive Maintenance Value
- **Safety Enhancement**: 68% recall significantly reduces undetected water ingression risk
- **Resource Optimization**: Risk-based scheduling reduces unnecessary inspections by 40%
- **Cost Avoidance**: Early detection prevents catastrophic structural failures

## Advanced Visualizations

**Tableau Dashboard Portfolio:**
- **Summary Dashboard**: KPI overview with defect rate analysis
- **Temporal Analysis**: Trend identification with operational period correlation  
- **Component Analysis**: Part number reliability and lifecycle tracking
- **Parameter Analysis**: NDT technique optimization and physics validation
- **Model Performance**: SHAP interpretability and threshold optimization

**Advanced Chart Types:**
- Sankey diagrams for process flow analysis
- Heatmaps for temporal pattern identification  
- Bubble charts with multi-dimensional encoding
- Box plots for statistical distribution analysis
- Waterfall charts for feature contribution analysis

## Technologies & Skills

**Analytics Stack:**
- **ML Framework**: Scikit-learn, SMOTE, Threshold Optimization
- **Database**: MySQL with 3NF normalization  
- **Visualization**: Tableau with 14+ advanced chart types
- **Interpretability**: SHAP, Feature Importance, Statistical Testing
- **Statistics**: Correlation analysis, Chi-square testing, Point-biserial analysis

**Domain Integration:**
- NDT physics principles (inverse square law)
- Aviation maintenance protocols
- Risk-based decision frameworks  
- Regulatory compliance considerations

## Results & Business Impact

**Model Performance:**
- 68% recall in water ingression detection (optimized for safety-critical applications)
- Clear risk stratification enabling targeted maintenance strategies
- Actionable insights for component design improvements

**Operational Recommendations:**
1. **Immediate Actions**: Inspect 8 critical components within 30 days
2. **Design Review**: Investigate PN09 and PN04 quality issues  
3. **Maintenance Optimization**: Implement age-based inspection intervals
4. **Inventory Management**: Increase stock of high-risk part numbers

**Strategic Value:**
- Predictive capability reduces unscheduled maintenance by estimated 30%
- Enhanced safety through systematic risk identification
- Data-driven procurement decisions based on part reliability analysis

## Project Evolution from Previous Work

**Technical Improvement:**
- **Database Architecture**: From flat files to normalized 3NF design
- **Visualization Mastery**: From Power BI basics to advanced Tableau techniques  
- **Statistical Rigor**: Enhanced correlation analysis and significance testing
- **Model Optimization**: Threshold tuning and precision-recall trade-off analysis

**Business Impact:**
- **Risk Framework**: Structured component prioritization system
- **Operational Integration**: Maintenance schedule recommendations
- **Cost-Benefit Analysis**: Quantified business impact assessment
- **Scalability Design**: Database architecture ready for enterprise deployment

## Project Structure

```
├── notebooks/              # Analysis and modeling code
├── database/               # MySQL schema and setup scripts  
├── visualizations/         # Tableau dashboards and analysis
│   ├── dashboards/         # Dashboard screenshots
│   └── model_analysis/     # ML performance visualizations
├── docs/                   # Methodology and documentation
└── README.md               # Project overview
```

## Future Enhancements

**Technical Roadmap:**
- CNN implementation for X-ray image analysis (next project)
- Real-time prediction pipeline development
- Multi-site deployment architecture
- Advanced ensemble methods integration

**Business Applications:**
- Integration with CMMS systems
- Automated work order generation  
- Regulatory reporting automation

---

**About:** This project represents improvement in applying data science to aviation safety challenges. The integration of advanced visualization, database design, and domain expertise creates a production-ready framework for predictive maintenance in safety-critical industries.
