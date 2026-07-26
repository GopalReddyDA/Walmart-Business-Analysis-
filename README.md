# 🛒 Walmart End-to-End Data Analysis Project (Python + SQL)

![Project Pipeline](https://github.com/GopalReddyDA/Walmart-Business-Analysis-/blob/main/walmart_project-piplelines.png)

## 📌 Overview

This project demonstrates an **End-to-End Data Analytics Pipeline** using **Python** and **SQL**. The workflow begins with extracting Walmart sales data from Kaggle, followed by cleaning and transforming the data using **Pandas**. The cleaned data is then loaded into a relational database (**MySQL** or **PostgreSQL**) using **SQLAlchemy**. Finally, SQL queries are used to solve real-world business problems and generate valuable insights.

This project showcases practical skills in:

- Data Extraction
- Data Cleaning
- Data Transformation
- Database Management
- SQL Analysis
- Business Intelligence

---

# 🚀 Project Workflow

```text
           Kaggle Dataset
                 │
                 ▼
      Extract Data with Python
                 │
                 ▼
      Clean & Transform Data
             (Pandas)
                 │
                 ▼
     Load into SQL Database
      (MySQL / PostgreSQL)
                 │
                 ▼
      Business Analysis using SQL
                 │
                 ▼
          Generate Insights
```

---

# 🛠️ Tech Stack

### Programming Language

- Python

### Python Libraries

- Pandas
- SQLAlchemy
- PyMySQL
- psycopg2

### Database

- MySQL
- PostgreSQL

### SQL Concepts Used

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- Aggregate Functions
- CASE WHEN
- Common Table Expressions (CTEs)
- Window Functions
- RANK()
- LAG()
- DATEPART()
- DATENAME()
- YEAR()

---

# 📂 Project Structure

```text
Walmart-End-to-End-Analysis/
│
├── data/
│   └── walmart.csv
│
├── notebooks/
│   └── Walmart_Analysis.ipynb
│
├── sql/
│   └── walmart_analysis.sql
│
├── images/
│   └── walmart_project_pipeline.png
│
├── main.py
├── requirements.txt
└── README.md
```

---

# 📦 Installation

Clone the repository

```bash
git clone https://github.com/yourusername/Walmart-End-to-End-Analysis.git
```

Move into the project directory

```bash
cd Walmart-End-to-End-Analysis
```

Install the required packages

```bash
pip install -r requirements.txt
```

Or install manually

```bash
pip install pandas sqlalchemy pymysql psycopg2
```

---

# 📋 Requirements

```text
pandas
sqlalchemy
pymysql
psycopg2
```

---

# 📊 Data Processing

The dataset is processed using **Pandas**.

The following steps are performed:

- Import Dataset
- Explore Dataset
- Check Missing Values
- Remove Duplicates
- Handle Data Types
- Clean Data
- Transform Data
- Export Clean Data to SQL Database

---

# 🗄️ Database Loading

The cleaned dataset is loaded into:

- MySQL using **PyMySQL**
- PostgreSQL using **psycopg2**

Database connection is managed through **SQLAlchemy**.

---

# 📈 Business Questions Solved

### 1. Calculate the total sales revenue.

### 2. Which city generated the highest sales?

### 3. Which branch recorded the highest revenue?

### 4. Which product category generated the highest revenue?

### 5. Which payment method was used most frequently?

### 6. What is the average customer rating for each category?

### 7. How many transactions and items were sold through each payment method?

### 8. Which category received the highest average rating in each branch?

### 9. What is the busiest day of the week for each branch?

### 10. How many items were sold through each payment method?

### 11. What are the minimum, maximum, and average ratings for each category in each city?

### 12. Calculate total revenue by category.

### 13. What is the most frequently used payment method in each branch?

### 14. How many transactions occur in each shift (Morning, Afternoon, Evening) across branches?

### 15. Which branches experienced the largest decrease in revenue compared to the previous year?

---

# 💡 SQL Skills Demonstrated

- Aggregate Functions
- GROUP BY
- ORDER BY
- CASE WHEN
- Date Functions
- Window Functions
- Ranking Functions
- RANK()
- LAG()
- CTE (Common Table Expressions)
- Business Analytics Queries

---

# 📊 Sample Business Insights

- Identified the highest revenue-generating branch.
- Determined the city with the highest sales.
- Analyzed customer ratings across categories.
- Found the busiest weekday for each branch.
- Compared branch revenue year-over-year.
- Identified customer payment preferences.
- Analyzed sales across Morning, Afternoon, and Evening shifts.

---

# ▶️ How to Run

Run the Python script

```bash
python main.py
```

Run the SQL script

```sql
walmart_analysis.sql
```

---

# 📸 Project Pipeline

Save the image below inside the **images** folder as

```
images/walmart_project_pipeline.png
```

Then use

```markdown
![Project Pipeline](images/walmart_project_pipeline.png)
```

---

# 📌 Future Improvements

- Build an interactive Power BI Dashboard
- Create Tableau Dashboards
- Automate ETL using Apache Airflow
- Dockerize the project
- Deploy using Streamlit
- Connect to Cloud Databases
- Schedule automated data refresh

---

# 👨‍💻 Author

**Your Name**

LinkedIn: https://linkedin.com/in/yourprofile

GitHub: https://github.com/yourusername

---

## ⭐ If you found this project helpful, please consider giving it a Star on GitHub!
