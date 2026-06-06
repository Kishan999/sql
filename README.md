# Daily SQL for Data Engineering

Welcome. This folder is a **daily SQL learning journal** focused on **data engineering**.

Every day, one new SQL problem is added here — not as interview trivia, but as practice for the kind of work data engineers do in production: cleaning messy source data, building metrics, joining tables across pipelines, handling time-series logic, and turning raw records into something analytics and product teams can trust.

If you are visiting this page, here is everything you need to know.

## What This Is

This is a growing collection of real-world SQL scenarios. Each entry is a self-contained problem with:

- A **business context** (e-commerce, ride-sharing, streaming, fintech, surveys, and similar domains)
- A **table schema** reflecting how data actually arrives — duplicates, inconsistent formats, event logs, and all
- A **worked example** so the expected output is clear
- A **solution approach** explaining the SQL patterns involved
- A **query file** with the final SQL

The goal is steady, daily improvement — one SQL learning opportunity per day — so that querying, transforming, and reasoning about data becomes second nature.

## Who This Is For

- **Data engineers** sharpening the SQL they use in ETL, warehousing, and pipeline debugging
- **Analytics engineers** moving from ad-hoc reports to reusable, production-grade logic
- **Anyone preparing for data roles** who wants practice grounded in real engineering work, not isolated puzzle questions

You do not need to solve problems in order. Browse any folder, read the `question.md`, study the query, and move on.

## What You Will Learn

The problems cover skills that show up repeatedly in data engineering:

| Skill area | Examples |
|------------|----------|
| **Aggregations & KPIs** | Return rates, credit scores, satisfaction metrics |
| **Window functions** | Rankings, rolling comparisons, streaks, sequential events |
| **Data quality** | Inconsistent free-text values, deduplication, mode selection |
| **Time-series logic** | Month-over-month trends, consecutive-day patterns |
| **Joins & modeling** | Multi-table business rules, weighted scoring, event chaining |
| **Segmentation** | Bucketing users or entities into tiers and groups |

These are the same patterns used when building fact tables, validating pipeline output, supporting dashboards, and debugging broken jobs.

## How Each Problem Is Organized

Every problem lives in its own numbered folder:

```
sql/
└── {number} - {Problem Name}/
    ├── question.md    ← problem statement, schema, example, approach
    └── query.sql      ← SQL solution
```

Open any folder to get the full picture. The `question.md` file has all the context; the `.sql` file has the answer.

## How to Use This

1. **Pick any problem folder** and read `question.md` first.
2. **Try writing the query yourself** before opening the solution.
3. **Compare your approach** with `query.sql` — focus on readability, correctness, and whether your logic handles edge cases.
4. **Come back tomorrow** — a new problem will be here.

## The Daily Habit

One problem. One day. No rush.

Consistency matters more than speed. Over time, this folder becomes a personal reference library of SQL patterns you have actually worked through — window functions for streaks, LAG for event sequences, CTEs for readable pipelines, aggregations for business metrics, and the data-quality fixes that keep downstream tables trustworthy.

That is the whole idea: **learn SQL the way data engineers use it, a little every day.**
