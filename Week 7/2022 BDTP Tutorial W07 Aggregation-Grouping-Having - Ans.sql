/*
    TUTORIAL EXERCISES ON SQL(DML)
         AGGREGATE FUNCTIONS,
      GROUP BY AND HAVING CLAUSE


PART A
Consider the oracle employees database. Write SQL expressions for the following queries:

a.	Display job descriptions groups whose average salary is greater than the average salary of their managers.
*/
-- An interpretation of the above query can be "list the job descriptions
-- that have average salary greater than that of the average salary of managers"
SELECT job
FROM emp
GROUP BY job
HAVING AVG(sal) > (SELECT AVG(sal)
                   FROM emp
                   WHERE job = 'MANAGER');

-- A trickier interpretation is to display details of job description groups
-- whose employees have an average salary that is greater than the average
-- salary of the employees that manage them

SELECT JOB, AVG(sal)
FROM emp e
GROUP BY job
HAVING AVG(sal) >
                 (SELECT AVG(DISTINCT m.sal)
                  FROM emp e JOIN emp m
                               ON e.mgr = m.empno);



/*
PART B
Give SQL solutions for the following queries involving tables of the uk-election database.

a.	Find the smallest number of voters, the largest number of voters and the average number of voters in constituencies.
*/
SELECT MIN (ukelectors), MAX(ukelectors), AVG(ukelectors)
FROM ukconsts;

/*
b.	Find the largest difference between votes cast for two candidates in the same constituency.
*/
-- A frequent interpretation of the above query is for a SQL expression that
-- will return the largest difference for each constituency.
-- Possible expressions for this can be:

SELECT uknum, MAX(ukvotes) - MIN(ukvotes) AS "Maximum Difference"
FROM ukresults
GROUP BY uknum;

-- The correct interpretation is a SQL query that will return the largest
-- difference of all constituencies

SELECT MAX(MAX(ukvotes) - MIN(ukvotes)) AS "Maximum Difference"
FROM ukresults
GROUP BY uknum;

-- However, nesting of aggregate functions is not in the SQL standard and so
-- not all vendors support it (oracle does support nesting of aggregate
-- functions); thus the above answer may not execute correctly in every
-- installation. A better & SQL standard compliant answer can be the following:

SELECT MAX(votes_diff) AS "Maximum Difference"
FROM (SELECT uknum, MAX(ukvotes) - MIN(ukvotes) AS votes_diff
      FROM ukresults
      GROUP BY uknum);

-- A better answer that also returns the uknum is the following
SELECT uknum, MAX(ukvotes) - MIN(ukvotes) AS "Maximum Difference"
FROM ukresults
GROUP BY uknum
HAVING MAX(ukvotes) - MIN(ukvotes) >=ALL
                 (SELECT MAX(ukvotes) - MIN(ukvotes)
                  FROM ukresults
                  GROUP BY uknum);

/*
c.	Find the average vote received by the Labour party (‘lab’) in constituencies where a Liberal candidate (‘lib’) was also standing.
*/
SELECT AVG(res1.ukvotes)
FROM ukresults res1 JOIN ukresults res2
        ON res1.uknum = res2.uknum
            AND res1.party = 'lab'
            AND res2.party = 'lib';

-- An equivalent expression can be the following

SELECT AVG(ukvotes)
FROM ukresults
WHERE party = 'lab'
  AND uknum IN -- or =ANY
            (SELECT uknum
             FROM ukresults
             WHERE party = 'lib');

-- Another possible equivalent answers can be

SELECT AVG(ukvotes)
FROM ukresults r1
WHERE party = 'lab'
  AND EXISTS (SELECT *
              FROM ukresults r2
              WHERE party = 'lib'
                AND r2.uknum = r1.uknum)

/*
d.	Display the constituency name and the total votes cast of constituencies where no more than three parties had candidates.
*/
  SELECT uknum, ukarea,
          COUNT(*) AS "No of parties",
            SUM(ukvotes) AS "total votes cast"
  FROM ukresults NATURAL JOIN ukconsts
  GROUP BY uknum, ukarea
  HAVING COUNT(*)<4;

-- An equivalent expression can be the following

SELECT uknum, ukarea,
         no_of_parties as "No of parties",
           votes_cast as "total votes cast"
FROM ukconsts NATURAL JOIN
         (SELECT uknum, count(*) as no_of_parties,
                   sum(ukvotes) as votes_cast
          FROM ukresults
          GROUP BY uknum
          HAVING COUNT(*) < 4)

/*
e.	Find the names of constituencies having at least 5000 voters more than the average number.
*/
-- The above query may be interpret as asking for electors

SELECT ukarea
FROM ukconsts
-- WHERE ukelectors >= 5000 + AVG(ukelectors)   **** NB: the use of the AVG() will result in an error, why? ****
WHERE ukelectors >=
         (SELECT AVG(ukelectors) + 5000
          FROM ukconsts);

-- If the query is interpreted as asking for constituencies with at least as 5000
-- votes more that the average votes cast in each contituency, then a possible
-- answer can be:

SELECT ukarea
FROM ukconsts
WHERE uknum IN
        (SELECT uknum
         FROM ukresults
         GROUP BY uknum
         HAVING SUM(ukvotes) >=
                  5000 + (SELECT AVG(voters)
						  FROM (SELECT uknum, SUM(ukvotes) AS voters
								FROM ukresults
								GROUP BY uknum)))

/*
f.	Find the maximum vote received by the Labour party in constituencies where more than 50000 votes were cast in total.
*/
SELECT MAX(ukvotes)
FROM ukresults
-- The WHERE clause selects constituencies for which their uknum is among those where more than 50000
-- votes were cast in total
WHERE party = 'lab'
  AND uknum IN 
-- The suquery returns details (uknum) of constituencies where more than 50000 votes were cast in total
          (SELECT uknum
           FROM ukresults
           GROUP BY uknum
           HAVING SUM(ukvotes) > 50000);


/*
g.	Find the constituency name and number of voters for the constituencies with the three smallest number of voters. List the three constituencies in increasing size of number of voters.
*/
SELECT *
FROM ukconsts
WHERE ukelectors <=
             (SELECT MIN(ukelectors)
              FROM ukconsts
              WHERE ukelectors >
                             (SELECT MIN(ukelectors)
                              FROM ukconsts
                              WHERE ukelectors >
                                         (SELECT MIN(ukelectors)
                                          FROM ukconsts)))
ORDER BY ukelectors;

-- If the query is interpreted as asking for actual voters rather electors
-- then a possible answer can be

SELECT uknum, ukarea, votes "Total votes cast"
FROM ukconsts NATURAL JOIN
       (SELECT uknum, SUM(ukvotes) votes
        FROM ukresults
        GROUP BY uknum
        HAVING SUM(ukvotes) <=
           (SELECT min(votes)
            FROM (SELECT SUM(ukvotes) votes
                  FROM ukresults
                  GROUP BY uknum
                  HAVING SUM(ukvotes) >
                     (SELECT min(votes)
                      FROM (SELECT SUM(ukvotes) votes
                            FROM ukresults
                            GROUP by uknum
                            HAVING SUM(ukvotes) > 
                               (SELECT MIN(votes)
                                FROM (SELECT sum(ukvotes) votes
                                      FROM ukresults
                                      GROUP by uknum)))))))
ORDER BY votes;

-- An improved version of the above can be the following

SELECT uknum, ukarea, votes "Total votes cast"
FROM ukconsts NATURAL JOIN
       (SELECT uknum, SUM(ukvotes) votes
         FROM ukresults
         GROUP BY uknum
         HAVING SUM(ukvotes) <= ALL
            (SELECT SUM(ukvotes) votes
             FROM ukresults
             GROUP BY uknum
             HAVING SUM(ukvotes) > ANY
                (SELECT SUM(ukvotes) votes
                 FROM ukresults
                 GROUP by uknum
                 HAVING SUM(ukvotes) > ANY
                    (SELECT SUM(ukvotes) votes
                     FROM ukresults
                     GROUP BY uknum))))
ORDER BY votes;
-- NB: the "ALL" and "ANY" have been used to avoid using the MIN aggregate function
