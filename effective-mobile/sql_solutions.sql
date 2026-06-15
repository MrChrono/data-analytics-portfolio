/*
Effective Mobile Data Analyst Test Assignment
SQL block solutions
*/

/*
Task 1: Applicants ranking

Table examination:
- id: applicant id
- scores: entrance exam score from 0 to 100

Create a column with applicant position in the overall ranking.
*/

SELECT
    id,
    scores,
    RANK() OVER (ORDER BY scores DESC) AS position
FROM examination;

/*
Explanation:
RANK() assigns the same position to applicants with equal scores and keeps gaps in ranking after ties.
Scores are sorted in descending order, because higher score means higher position.
*/


/*
Task 2: FULL JOIN

There are two tables:
- first table: 30 rows
- second table: 20 rows

Question: what is the possible range of result rows after FULL JOIN?
*/

/*
Answer:
If join keys are unique: minimum 30 rows, maximum 50 rows.

If duplicate keys are possible and many-to-many join is allowed: minimum 30 rows, maximum 600 rows.
*/


/*
Task 3: Purchases

Tables:

account(
    id integer,
    client_id integer,
    open_dt date,
    close_dt date
)

transaction(
    id integer,
    account_id integer,
    transaction_date date,
    amount numeric(10,2),
    type varchar(3)
)

Return client IDs who made purchases for less than 5000 rubles across all their accounts during the last month.
No subqueries and no window functions.
*/

SELECT
    a.client_id
FROM account a
JOIN transaction t
    ON a.id = t.account_id
WHERE t.type = 'BUY'
  AND t.transaction_date >= CURRENT_DATE - INTERVAL '1 month'
GROUP BY a.client_id
HAVING SUM(t.amount) < 5000
ORDER BY SUM(t.amount);

/*
Explanation:
The account table links accounts to clients.
The transaction table contains operations by account.

The join connects transactions with clients through account_id.
The filter keeps only purchase operations for the last month.
The grouping is done by client_id because the task asks for purchases across all accounts of each client.
HAVING is used because the condition applies to an aggregated sum.

If clients without purchases should also be included as 0, the solution should use LEFT JOIN and COALESCE, with transaction filters moved into the ON clause.
*/
