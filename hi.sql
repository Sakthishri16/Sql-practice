use work;

CREATE TABLE software (PNAME varchar(20), TITLE varchar(20), DEVELOPIN varchar(20), SCOST decimal(10,2),  DCOST int, SOLD int);
INSERT INTO software values
('MARY','README','CPP',300, 1200, 84), 
('ANAND','PARACHUTES','BASIC',399.95, 6000, 43 ),
('ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9 ),
('JULIANA','INVENTORY','COBOL',3000, 3500, 0 ),
('KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7),
('MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4), 
('MARY','CODE GENERATOR','C',4500, 20000, 23),
('PATTRICK','README','CPP',300, 1200, 84),
('QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11 ),
('QADIR','VACCINES','C',1900, 3100, 21 ),
('RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4),
('RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 ),
('REMITHA','PC UTILITIES','C',725, 5000, 51 ),
('REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 ),
('REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 ),
('VIJAYA','TSR EDITOR','C',900, 700, 6);

select *from software;
select*from programmer;
select*from studies;

CREATE TABLE programmer (PNAME varchar(20), DOB date, DOJ date, GENDER varchar(2), PROF1 varchar(20), PROF2 varchar(20), SALARY int);
desc programmer;
INSERT INTO programmer values
('ANAND', '1966-04-12', '1992-04-21', 'M', 'PASCAL', 'BASIC', 3200),
('ALTAF', '1964-07-02', '1990-11-13', 'M', 'CLIPPER', 'COBOL', 2800),
('JULIANA', '1960-01-31', '1990-04-21', 'F', 'COBOL', 'DBASE', 3000),
('KAMALA', '1968-10-30', '1992-01-02', 'F', 'C', 'DBASE', 2900),
('MARY', '1970-06-24', '1991-02-01', 'F', 'CPP', 'ORACLE', 4500),
('NELSON', '1985-09-11', '1989-10-11', 'M', 'COBOL', 'DBASE', 2500),
('PATTRICK', '1965-11-10', '1990-04-21', 'M', 'PASCAL', 'CLIPPER', 2800),
('QADIR', '1965-08-31', '1991-04-21', 'M', 'ASSEMBLY', 'C', 3000),
('RAMESH', '1967-05-03', '1991-02-28', 'M', 'PASCAL', 'DBASE', 3200),
('REBECCA', '1967-01-01', '1990-12-01', 'F', 'BASIC', 'COBOL', 2500),
('REMITHA', '1970-04-19', '1993-04-20', 'F', 'C', 'ASSEMBLY', 3600),
('REVATHI', '1969-12-02', '1992-01-02', 'F', 'PASCAL', 'BASIC', 3700),
('VIJAYA', '1965-12-14', '1992-05-02', 'F', 'FOXPRO', 'C', 3500);

select avg(scost),developin from software where developin='pascal';

select pname,floor((datediff(curdate(),dob))/365) as age from programmer;

select pname,course from studies where course='dap';

select pname,dob from programmer where month(dob)=1 ;

select pname,(curdate()-dob) as age,dob from programmer;

select max(sold) from software ;

select min(course_fee) from studies;

select count(pname),course from studies where course='pgdca';

select max(sold*scost) from software where developin='c' ;

select *from programmer where pname='ramesh';

select count(pname) from studies where institute ='sabhari';

select *from software where sold*scost>2000 ; 

select *from software where dcost<=scost*sold;

select max(dcost) from software where developin='basic';

select count(*) from software where developin='dbase';

select count(*) from studies where institute ='pragathi';

select avg(course_fee) from studies;

select * from programmer where prof1='c' or prof2='c';

select count(*) from programmer where prof1='cobol' or prof2='pascal' or prof2='cobol' or prof1='pascal' ;

select count(*) from programmer where prof1 not in('pascal','c') and  prof2 not in('pascal','c') ;

select max(floor((datediff(curdate(),dob))/365)) as age from programmer where gender='m' ; 

select avg(floor((datediff(curdate(),dob))/365)) as age from programmer where gender='f' ;

select pname,floor((datediff(curdate(), doj))/365) as experience from programmer order by experience desc;

select pname,dob from programmer where month(dob)=month(curdate());

select count(*) from programmer where gender='f';

select distinct prof1 from programmer where gender='m'union select distinct prof2 from programmer where gender='m';

select avg(salary) from programmer;
select count(*) from programmer where salary between 2000 and 4000;

select *from programmer where prof1 not in('clipper' ,'cobol','pascal') and prof2 not in ('clipper' ,'cobol','pascal');

select  pname,sum(dcost) from software group by pname ; 

select  pname,sum(sold) from software group by pname ; 
select  pname,sum(scost*sold) from software group by pname ; 

select  developin,avg(dcost),avg(scost),avg(scost) as price_per_copy from software group by developin ; 

select pname,max(dcost),min(dcost) from software group by pname;

select institute,count(course),avg(course_fee) from studies group by institute ;

select institute,count(pname) from studies group by institute;
select pname,gender from programmer;

select pname,title from software;

select avg(dcost-scost),developin from software  group by developin;

select pname,sum(scost),sum(dcost),(dcost-scost) as amount from software where dcost>scost  group by pname;

select max(salary),min(salary),avg(salary) from programmer where salary>2000 ;

select max(salary)  from programmer where prof1='c' or prof2='c' group by pname;
select  pname ,salary from programmer  where salary =  (select max(salary)  from programmer where prof1='c' or prof2='c' ) ;

select pname,salary from programmer where salary=(select max(salary)  from programmer where prof1 ='cobol' or prof2='cobol' ) and gender='f';

select pname,salary from programmer where salary=(select max(salary)  from programmer where ) ;

select pname,prof1,prof2 ,floor((datediff(curdate(),doj))/365)as  experience from programmer where gender='m' and prof1='pascal' or prof2='pascal'  order by experience asc limit 1; 

select pname,floor((datediff(curdate(),dob))/365)as  age from programmer where prof1='dbase' or prof2='dbase'  order by age asc limit 1; 

select pname,salary from programmer where gender='f' and  (prof1 not in('c','c++','oracle','dbase') or prof2 not in('c','c++','oracle','dbase')) and salary >3000;

select institute,count(*) as cnt from studies group by institute order by cnt  desc limit  1;
select  max(course_fee) from studies ;

select course, count(*) as cnt from studies group by course order by cnt desc limit 1;

select institute,max(course_fee) as cf from studies group by institute order by cf desc limit 1;

select institute,course from studies  where course_fee< (select avg(course_fee) from studies) ;

select  course from studies  where course_fee between (select avg(course_fee) from studies)-1000 and (select avg(course_fee) from studies)+1000 ;
 
select title,dcost from software where dcost=(select max(dcost) from software);

select course,count(pname) as cnt  from studies group by course order by cnt desc limit 1;

select title,scost from software order by scost desc limit 1 ;

select title,sold from software order by sold limit 1; 

select title,developin from software where (scost*sold)= (select max(scost*sold)  from software);

select title,sold from software where (dcost-scost)=(select min(dcost-scost) from software);

select title from software where dcost=(select max(dcost) from software where developin='pascal');

select developin from software where title=(select count(title),title from software group by developin );

select count(title) as cnt,developin from software group by title,developin order by cnt desc limit 1 ;

select count(title ) as cnt,pname from software group by pname order by cnt desc limit 1;

select pname from software where dcost=(select max(dcost) from software);

select title from software where sold <(select avg(sold) from software);

select  distinct pname from software where scost*sold > 2*dcost;

select  pname,min(dcost),title from software group by title,pname;

select   developin,title ,sold from software where sold= (select max(sold)from software)  union  select   developin,title ,sold from software   where sold=(select min(sold) from software)  ;

select pname from programmer where gender='m' and year(dob)=1965;

select pname,dob from programmer where gender='f' and year(doj)=1992 order by dob desc limit 1;

select count(pname) as cnt,year(dob) as yr  from programmer group by yr  order by cnt desc limit 1;

select count(pname) as cnt ,month(doj)as mon from programmer group by mon order by cnt desc limit 1;

select pname from programmer where salary<(select avg(salary) from programmer where gender='f') and gender='m';

select pname from programmer where salary>(select max(salary) from programmer) and gender='f' ;

select *  from programmer where salary in (select salary from programmer group by salary having count(salary) >1);

select p.pname,p.dob,p.doj,p.gender,p.prof1,p.prof2, p.salary, s.title,s.developin,s.scost,s.dcost,s.sold  from programmer as p,software as s where p.pname=s.pname and p.gender='m' and p.salary >3000;

select s.* from software as s ,programmer as p where s.pname=p.pname and  p.gender='f' and s.developin='pascal';

select * from programmer where year(doj)<1990;

select * from software where developin='c' and pname ='pragathi';


select prof1 from programmer where prof1 not in(select developin from software) 
union
select prof2 from programmer where prof2 not in(select developin from software);

select st.institute from studies as st,software as s where st.pname=s.pname and s.dcost= (select max(dcost)from software) ;

select sum(s.sold*s.scost) from software as s,studies as st where s.pname=st.pname  group by st.institute ;

select prof2 from programmer group by prof2 having count(*)>1;

select p.pname,count(s.title) from programmer as p ,software as s where p.pname=s.pname group by s.pname;
select s.developin,count(s.pname) ,count(s.title) from software as s,programmer as p where s.pname=p.pname and developin in (select distinct prof1 from programmer union select distinct prof2 from programmer) group by developin;

select distinct s.pname, st.institute from software as s,studies as st where s.pname=st.pname ;

SELECT COUNT(s.title)
FROM software AS s, programmer AS p, studies AS st
WHERE s.pname = p.pname
  AND p.pname = st.pname
  AND p.doj = (
    SELECT MIN(p2.doj)
    FROM programmer AS p2, studies AS st2
    WHERE p2.pname = st2.pname
      AND st2.institute = 'bdps'
  )
  AND st.institute = 'bdps';

 select count(s.title) from software as s ,programmer as p where s.pname=p.pname and p.salary>( select max(salary) from programmer where gender='m' ) and p.gender='f'; 
 select count(s.title),st.institute from software as s join programmer as p on s.pname=p.pname join studies as st on p.pname=st.pname  where  s.dcost = (select min(dcost)from software); 
 
 select count(s.title) from software as s ,studies as st where s.pname=st.pname and st.course_fee=(select min(course_fee) from studies);

select avg(p.salary) from programmer as p,software as s where p.pname=s.pname and p.pname in(select  distinct pname from software where scost*sold>50000);

select p.salary,st.institute  from programmer as p join software as s on p.pname=s.pname join studies as st on p.pname=st.pname where s.scost=(select max(scost) from software);

select s.* from software as s , programmer as p where s.pname=p.pname and (( p.gender='m' and year(p.dob)<1965) or (p.gender='f' and year(p.dob)>1975) );

select s.* from software as s join studies as st on s.pname=st.pname join programmer as p on st.pname=p.pname where p.gender='m' and st.institute='sabhari';

select sum(s.dcost) from software as s ,studies as st where s.pname=st.pname and institute='apple' group by institute;

select  count(pname), day(doj) as  cnt from programmer group by cnt having count(pname)>1 ;

select count(pname) ,prof2 from programmer group by prof2 having count(pname)>1;