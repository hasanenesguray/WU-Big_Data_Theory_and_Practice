rem	*********************************************************************
rem	**   SQL statements to create tables used for the ORACLE database  **
rem	*********************************************************************


rem	**********************************************************************
rem	*********************   Drop existing tables   ***********************
rem	**********************************************************************

DROP TABLE emp CASCADE CONSTRAINTS;
DROP TABLE dept CASCADE CONSTRAINTS;
DROP TABLE salgrade CASCADE CONSTRAINTS;
DROP TABLE bonus CASCADE CONSTRAINTS;


rem	**********************************************************************
rem	******************   Create tables in the scheme   *******************
rem	**********************************************************************

CREATE TABLE dept
	(deptno NUMBER(2) CONSTRAINT dept_pk PRIMARY KEY,
	 dname VARCHAR2(14) ,
	 loc VARCHAR2(13)
	);

CREATE TABLE emp
	(empno NUMBER(4) CONSTRAINT emp_pk PRIMARY KEY,
	 ename VARCHAR2(10),
	 job VARCHAR2(9),
	 mgr NUMBER(4) CONSTRAINT empno_fk REFERENCES emp(empno),
	 hiredate DATE,
	 sal NUMBER(7,2),
	 comm NUMBER(7,2),
	 deptno NUMBER(2) CONSTRAINT emp_fk REFERENCES dept
	);

CREATE TABLE salgrade
	(grade NUMBER,
	 losal NUMBER,
	 hisal NUMBER
	);

CREATE TABLE BONUS
	(ename VARCHAR2(10),
	 job VARCHAR2(9),
	 sal NUMBER,
	 comm NUMBER
	);


rem	**********************************************************************
rem	****************   Disable Foreign Key Constraints   *****************
rem	**********************************************************************

ALTER TABLE emp DISABLE CONSTRAINT emp_fk;
ALTER TABLE emp DISABLE CONSTRAINT empno_fk;


rem	**********************************************************************
rem	*****************   Populate Tables in the scheme   ******************
rem	**********************************************************************

INSERT INTO dept VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO dept VALUES (20,'RESEARCH','CHICAGO');
INSERT INTO dept VALUES (30,'SALES','CHICAGO');
INSERT INTO dept VALUES	(40,'OPERATIONS','BOSTON');

INSERT INTO emp VALUES (7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO emp VALUES (7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,800,30);
INSERT INTO emp VALUES (7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO emp VALUES (7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO emp VALUES (7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO emp VALUES (7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2975,NULL,30);
INSERT INTO emp VALUES (7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO emp VALUES (7788,'SCOTT','ANALYST',7566,to_date('13-JUL-87','dd-mm-yy')-85,3000,2000,20);
INSERT INTO emp VALUES (7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO emp VALUES (7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO emp VALUES (7876,'ADAMS','CLERK',7788,to_date('13-JUL-87', 'dd-mm-yy')-51,1100,NULL,NULL);
INSERT INTO emp VALUES (7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO emp VALUES (7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,2000,20);
INSERT INTO emp VALUES (7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
INSERT INTO emp VALUES (8140,'POTTER','CLERK',7839,to_date('01-10-2023','dd-mm-yyyy'),700,NULL,30);

INSERT INTO salgrade VALUES (1,700,1200);
INSERT INTO salgrade VALUES (2,1201,1400);
INSERT INTO salgrade VALUES (3,1401,2000);
INSERT INTO salgrade VALUES (4,2001,3000);
INSERT INTO salgrade VALUES (5,3001,9000);

INSERT INTO bonus
	SELECT ename, job, sal, comm
	FROM emp
	WHERE empno < 7655; 


rem	**********************************************************************
rem	****************   Enable Foreign Key Constraints   *****************
rem	**********************************************************************

ALTER TABLE emp ENABLE CONSTRAINT emp_fk;
ALTER TABLE emp ENABLE CONSTRAINT empno_fk;

COMMIT;
