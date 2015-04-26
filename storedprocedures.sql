#1
DELIMITER //
CREATE PROCEDURE getSeekerSummary ()
BEGIN
SELECT UFName, ULName, UStreet1, UCity, Abbr, Zipcode, UEmail
FROM user A, seeker B, state C
WHERE A.UName=B.UName AND A.StateID=C.StateID
ORDER BY Abbr;
END //

#2
DELIMITER //
CREATE PROCEDURE getSeekerJobs (IN seekerLName VARCHAR(45))
BEGIN
SELECT ULName, UFName, CName, B.JobID, JListDate, JobTitle
FROM user A, job B, applies C
WHERE ULName=seekerLName AND A.UName=C.UName AND B.JobID=C.JobID;
END //

#3
DELIMITER //
CREATE PROCEDURE getCompanyJobs (IN companyName VARCHAR(45))
BEGIN
SELECT JobTitle, JobID, JListDate, JFillStatus, CName
FROM job
WHERE CName=companyName
ORDER BY JobTitle;
END //

#4
DELIMITER //
CREATE PROCEDURE getNewJobs (IN date1 DATE, date2 DATE)
BEGIN
SELECT CName, JobID, JListDate, JobTitle
FROM job
WHERE JListDate BETWEEN date1 AND date2;
END //

#5
DELIMITER //
CREATE PROCEDURE getJobInfoFromTitleAndSalary (IN title VARCHAR(45), salary INT)
BEGIN
SELECT CName, JobID, JListDate, JLowRange, JHighRange
FROM job
WHERE JobTitle=title AND salary BETWEEN JLowRange AND JHighRange;
END //

#6
DELIMITER //
CREATE PROCEDURE getSeekersFromID (IN jID INT)
BEGIN
SELECT UFName, ULName, UStreet1, UCity, Zipcode, UEmail
FROM user A, applies B
WHERE A.UName=B.UName AND B.JobID=jID;
END //

#7
DELIMITER //
CREATE PROCEDURE getSeekersFromUni (IN uniName VARCHAR(45))
BEGIN
SELECT A.UName, UStreet1, UCity, Zipcode, UEmail
FROM user A, education B, university C, degreetype D, resume E
WHERE C.UniversityName=uniName AND C.UniversityID=B.EUniversityID AND D.DegreeType='Bachelors Degree' AND B.DegreeTypeID=D.DegreeTypeID AND E.ResumeID=B.ResumeID AND E.UName=A.UName;
END //

#8
DELIMITER //
CREATE PROCEDURE getPaymentReportByDateRange (IN date1 date, date2 date)
BEGIN
SELECT PaymentID, PAmount, Name, PDate
FROM payment A, pstatus B
WHERE A.PStatusID=B.PStatusID AND PDate BETWEEN date1 AND date2;
END //

#9
DELIMITER //
CREATE PROCEDURE getBankPaymentId (IN id INT)
BEGIN
SELECT PaymentID
FROM bankpayment
WHERE PaymentID=id;
END //

DELIMITER //
CREATE PROCEDURE getCreditCardPaymentId (IN id INT)
BEGIN
SELECT PaymentID
FROM creditcard
WHERE PaymentID=id;
END //

DELIMITER //
CREATE PROCEDURE getInvoicePaymentId (IN id INT)
BEGIN
SELECT PaymentID
FROM invoice
WHERE PaymentID=id;
END //

DELIMITER //
CREATE PROCEDURE getOnlineServicePaymentId (IN id INT)
BEGIN
SELECT PaymentID
FROM onlineservice
WHERE PaymentID=id;
END //

#9
DELIMITER //
CREATE PROCEDURE getJobsWithSkillName (IN skillName VARCHAR(45))
BEGIN
SELECT A.JobID, JListDate, JobTitle
FROM job A, job_skills B, skill C
WHERE C.SSkillName=skillName AND C.SSkillID=B.SSkillID AND B.JobID=A.JobID;
END //

#10
DELIMITER //
CREATE PROCEDURE getUsersWithSkillName (IN skillName VARCHAR(45))
BEGIN
SELECT UFName, ULName, UStreet1, UCity, Zipcode, UEmail
FROM user A, resume B, skillset C, skill D
WHERE D.SSkillName=skillName AND D.SSkillID=C.SSkillID AND C.ResumeID=B.ResumeID AND B.UName=A.UName;
END //