#UConnJobSearch Stored Procedures
#Contributors: Ryan Tracey and Jeffrey Daniewicz

-- ----------------------------------------------
-- FOR ADMINISTRATOR FUNCTIONS
-- ----------------------------------------------

#get a summary of all job seekers
DELIMITER //
CREATE PROCEDURE getSeekerSummary ()
BEGIN
SELECT UFName, ULName, UStreet1, UCity, Abbr, Zipcode, UEmail
FROM user A, seeker B, state C
WHERE A.UName=B.UName AND A.StateID=C.StateID
ORDER BY Abbr;
END //

#get a list of all jobs that a seeker has applied for
DELIMITER //
CREATE PROCEDURE getSeekerJobs (IN seekerLName VARCHAR(45))
BEGIN
SELECT ULName, UFName, CName, B.JobID, JListDate, JobTitle
FROM user A, job B, applies C
WHERE ULName=seekerLName AND A.UName=C.UName AND B.JobID=C.JobID;
END //

#get a list of all the jobs that a company has listed
DELIMITER //
CREATE PROCEDURE getCompanyJobs (IN companyName VARCHAR(45))
BEGIN
SELECT JobTitle, JobID, JListDate, JFillStatus, CName
FROM job
WHERE CName=companyName
ORDER BY JobTitle;
END //

#get a list of jobs posted within a date range
DELIMITER //
CREATE PROCEDURE getNewJobs (IN date1 DATE, date2 DATE)
BEGIN
SELECT CName, JobID, JListDate, JobTitle
FROM job
WHERE JListDate BETWEEN date1 AND date2;
END //

#get a list of jobs by their salary value and title
DELIMITER //
CREATE PROCEDURE getJobInfoFromTitleAndSalary (IN title VARCHAR(45), salary INT)
BEGIN
SELECT CName, JobID, JListDate, JLowRange, JHighRange
FROM job
WHERE JobTitle=title AND salary BETWEEN JLowRange AND JHighRange;
END //

#get a list of all job seekers with a particular id
DELIMITER //
CREATE PROCEDURE getSeekersFromID (IN jID INT)
BEGIN
SELECT UFName, ULName, UStreet1, UCity, Zipcode, UEmail
FROM user A, applies B
WHERE A.UName=B.UName AND B.JobID=jID;
END //

#get a list of all seekers from a particular university with bachelor's degrees
DELIMITER //
CREATE PROCEDURE getSeekersFromUni (IN uniName VARCHAR(45))
BEGIN
SELECT A.UName, UStreet1, UCity, Zipcode, UEmail
FROM user A, education B, university C, degreetype D, resume E
WHERE C.UniversityName=uniName AND C.UniversityID=B.EUniversityID AND D.DegreeType='Bachelors Degree' AND B.DegreeTypeID=D.DegreeTypeID AND E.ResumeID=B.ResumeID AND E.UName=A.UName;
END //

#get a list of all payments within a date range
DELIMITER //
CREATE PROCEDURE getPaymentReportByDateRange (IN date1 date, date2 date)
BEGIN
SELECT PaymentID, PAmount, Name, PDate
FROM payment A, pstatus B
WHERE A.PStatusID=B.PStatusID AND PDate BETWEEN date1 AND date2;
END //

#get a list of all bank payment ids
DELIMITER //
CREATE PROCEDURE getBankPaymentId (IN id INT)
BEGIN
SELECT PaymentID
FROM bankpayment
WHERE PaymentID=id;
END //

#get a list of all credit card payment ids
DELIMITER //
CREATE PROCEDURE getCreditCardPaymentId (IN id INT)
BEGIN
SELECT PaymentID
FROM creditcard
WHERE PaymentID=id;
END //

#get a list of all invoice payment ids
DELIMITER //
CREATE PROCEDURE getInvoicePaymentId (IN id INT)
BEGIN
SELECT PaymentID
FROM invoice
WHERE PaymentID=id;
END //

#get a list of all online payment ids
DELIMITER //
CREATE PROCEDURE getOnlineServicePaymentId (IN id INT)
BEGIN
SELECT PaymentID
FROM onlineservice
WHERE PaymentID=id;
END //

#get a list of all jobs with a particular skill
DELIMITER //
CREATE PROCEDURE getJobsWithSkillName (IN skillName VARCHAR(45))
BEGIN
SELECT A.JobID, JListDate, JobTitle
FROM job A, job_skills B, skill C
WHERE C.SSkillName=skillName AND C.SSkillID=B.SSkillID AND B.JobID=A.JobID;
END //

#get a list of all seekers with a particular skill
DELIMITER //
CREATE PROCEDURE getUsersWithSkillName (IN skillName VARCHAR(45))
BEGIN
SELECT UFName, ULName, UStreet1, UCity, Zipcode, UEmail
FROM user A, resume B, skillset C, skill D
WHERE D.SSkillName=skillName AND D.SSkillID=C.SSkillID AND C.ResumeID=B.ResumeID AND B.UName=A.UName;
END //

-- ----------------------------------------------
-- FOR SEEKER FUNCTIONS
-- ----------------------------------------------

#Return a user provided Username exists and the provided password matches 
DELIMITER //
CREATE PROCEDURE verifyUserNameAndPassword (IN userName VARCHAR(15), pword VARCHAR(15))
BEGIN
SELECT *
FROM USER
WHERE UPasswd= pword AND UName= userName;
END //

#check if a username exists
DELIMITER //
CREATE PROCEDURE checkIfUserNameExists (IN userName VARCHAR(45))
BEGIN
SELECT UName
FROM user A
WHERE A.UName=userName;
END //

#insert a new user entry
DELIMITER //
CREATE PROCEDURE insertUserEntry (IN uName VARCHAR(45), passwd VARCHAR(45), fName VARCHAR(45), lName VARCHAR(45), address VARCHAR(45), address2 VARCHAR(45), city VARCHAR(45), state INT, zip VARCHAR(45), email VARCHAR(45), phone VARCHAR(45), fax VARCHAR(45), cell VARCHAR(45), web VARCHAR(45))
BEGIN
INSERT INTO user (UName, UPasswd, UFName, ULName, UStreet1, UStreet2, UCity, StateID, Zipcode, UEmail, UPhone, UFax, UCell, UHomePage, UStatusID) VALUES
(uName, passwd, fName, lName, address, address2, city, state, zip, email, phone, fax, cell, web, '0');
END //

#check if an email exists
DELIMITER //
CREATE PROCEDURE checkIfEmailExists (IN email VARCHAR(45))
BEGIN
SELECT UEmail
FROM user A
WHERE A.UEmail=email;
END //

#get unfilled jobs for a user that they haven't applied for based on skills, create temp table
DELIMITER //
CREATE PROCEDURE getJobsForUserBySkillNotApplied (IN uName VARCHAR(45))
BEGIN
CREATE temporary TABLE skillMatchNotApplied LIKE job;
INSERT skillMatchNotApplied
SELECT DISTINCT A.*
FROM job A, resume C, skillset E, job_skills F 
WHERE A.JFillStatus='No' AND C.UName=uName AND E.ResumeID=C.ResumeID AND F.SSkillID=E.SSkillID AND F.JobID=A.JobID AND JobTitle NOT IN(
SELECT JobTitle
FROM job A, applies B
WHERE B.UName=uName AND A.JobID=B.JobID
);
END //

#get unfilled jobs for a user that they have applied for based on skills, create temp table
DELIMITER //
CREATE PROCEDURE getJobsForUserBySkillApplied (IN uName VARCHAR(45))
BEGIN
CREATE temporary TABLE skillMatchApplied LIKE job;
INSERT skillMatchApplied
SELECT DISTINCT A.*
FROM job A, resume C, skillset E, job_skills F 
WHERE A.JFillStatus='No' AND C.UName=uName AND E.ResumeID=C.ResumeID AND F.SSkillID=E.SSkillID AND F.JobID=A.JobID AND JobTitle IN(
SELECT JobTitle
FROM job A, applies B
WHERE B.UName=uName AND A.JobID=B.JobID
);
END //

#get unfilled jobs for a user that they haven't applied for based on salary
DELIMITER //
CREATE PROCEDURE getJobsForUserBySalaryNotApplied (IN uName VARCHAR(45))
BEGIN
CREATE temporary TABLE salaryMatchNotApplied LIKE job;
INSERT salaryMatchNotApplied
SELECT DISTINCT A.*
FROM job A, resume B
WHERE B.UName=uName AND A.JLowRange>=B.RSalaryMin AND A.JFillStatus='No' AND JobTitle NOT IN(
SELECT JobTitle
FROM job A, applies B
WHERE B.UName=uName AND A.JobID=B.JobID
);
END //

#get unfilled jobs for a user that they have applied for based on salary
DELIMITER //
CREATE PROCEDURE getJobsForUserBySalaryApplied (IN uName VARCHAR(45))
BEGIN
CREATE temporary TABLE salaryMatchApplied LIKE job;
INSERT salaryMatchApplied
SELECT DISTINCT A.*
FROM job A, resume B
WHERE B.UName=uName AND A.JLowRange>=B.RSalaryMin AND A.JFillStatus='No' AND JobTitle IN(
SELECT JobTitle
FROM job A, applies B
WHERE B.UName=uName AND A.JobID=B.JobID
);
END //

#get unfilled jobs for a user that they haven't applied for based on education, create temp table holding returned rows
DELIMITER //
CREATE PROCEDURE getJobsForUserByEducationNotApplied (IN uName VARCHAR(45))
BEGIN
CREATE temporary TABLE eduMatchNotApplied LIKE job;
INSERT eduMatchNotApplied
SELECT DISTINCT A.* #A.JobTitle, A.JobID
FROM job A, resume C, education D, job_degreearea E, job_degreetype F
WHERE C.UName=uName AND D.ResumeID=C.ResumeID AND D.DegreeAreaID=E.DegreeAreaID AND D.DegreeTypeID=F.DegreeTypeID AND E.JobID=A.JobID AND F.JobID=A.JobID AND A.JFillStatus='No' AND JobTitle NOT IN(
SELECT JobTitle
FROM job A, applies B
WHERE B.UName=uName AND A.JobID=B.JobID
);
END //

#get unfilled jobs for a user that they've applied for based on education, create temp table holding returned rows
DELIMITER //
CREATE PROCEDURE getJobsForUserByEducationApplied (IN uName VARCHAR(45))
BEGIN
CREATE temporary TABLE eduMatchApplied LIKE job;
INSERT eduMatchApplied
SELECT DISTINCT A.* #A.JobTitle, A.JobID
FROM job A, resume C, education D, job_degreearea E, job_degreetype F
WHERE C.UName=uName AND D.ResumeID=C.ResumeID AND D.DegreeAreaID=E.DegreeAreaID AND D.DegreeTypeID=F.DegreeTypeID AND E.JobID=A.JobID AND F.JobID=A.JobID AND A.JFillStatus='No' AND JobTitle IN(
SELECT JobTitle
FROM job A, applies B
WHERE B.UName=uName AND A.JobID=B.JobID
);
END //


#get unfilled jobs for a user that they haven't applied for based on experience
DELIMITER //
CREATE PROCEDURE getJobsForUserByExperienceNotApplied (IN uName VARCHAR(45))
BEGIN
CREATE temporary TABLE expMatchNotApplied LIKE job;
INSERT expMatchNotApplied
SELECT DISTINCT A.*
FROM job A, priorjobs B
WHERE A.JobTitle=B.PJJobTitle AND A.JobTitle NOT IN(
SELECT JobTitle
FROM job A, applies B
WHERE B.UName=uName AND A.JobID=B.JobID
);
END //

#get unfilled jobs for a user that they have applied for based on experience
DELIMITER //
CREATE PROCEDURE getJobsForUserByExperienceApplied (IN uName VARCHAR(45))
BEGIN
CREATE temporary TABLE expMatchApplied LIKE job;
INSERT expMatchApplied
SELECT DISTINCT A.*
FROM job A, priorjobs B
WHERE A.JobTitle=B.PJJobTitle AND A.JobTitle IN(
SELECT JobTitle
FROM job A, applies B
WHERE B.UName=uName AND A.JobID=B.JobID
);
END //

#get unfilled jobs by title that the user has not applied for
DELIMITER //
CREATE PROCEDURE getJobsByTitle (IN title VARCHAR(45), uName VARCHAR(45))
BEGIN
SELECT DISTINCT A.JobTitle, A.JobID
FROM job A
WHERE A.JobTitle=title AND A.JFillStatus='No' AND JobTitle NOT IN(
SELECT JobTitle
FROM job A, applies B
WHERE B.UName=uName AND A.JobID=B.JobID
);
END //

#get unfilled jobs by company name that the user has not applied for
DELIMITER //
CREATE PROCEDURE getJobsByCompanyName (IN cName VARCHAR(45), uName VARCHAR(45))
BEGIN
SELECT DISTINCT A.JobTitle, A.JobID
FROM job A
WHERE A.CName=cName AND A.JFillStatus='No' AND JobTitle NOT IN(
SELECT JobTitle
FROM job A, applies B
WHERE B.UName=uName AND A.JobID=B.JobID
);
END //

#get unfilled jobs by salary range that the user has not applied for
DELIMITER //
CREATE PROCEDURE getJobsBySalaryName (IN salaryLow INT, salaryHigh INT, uName VARCHAR(45))
BEGIN
SELECT A.JobTitle, A.JobID
FROM job A
WHERE A.JLowRange>=salaryLow AND A.JLowRange<=salaryHigh AND A.JHighRange>=salaryLow AND A.JHighRange<=salaryHigh AND A.JFillStatus='No' AND JobTitle NOT IN(
SELECT JobTitle
FROM job A, applies B
WHERE B.UName=uName AND A.JobID=B.JobID
);
END //

#get unfilled jobs by location that the user has not applied for
DELIMITER //
CREATE PROCEDURE getJobsByLocationName (IN location INT, uName VARCHAR(45))
BEGIN
SELECT A.JobTitle, A.JobID
FROM job A
WHERE A.StateID=location AND A.JFillStatus='No' AND JobTitle NOT IN(
SELECT JobTitle
FROM job A, applies B
WHERE B.UName=uName AND A.JobID=B.JobID
);
END //

#get all unfilled jobs that the user has not applied for
DELIMITER //
CREATE PROCEDURE getAllJobs (IN uName VARCHAR(45))
BEGIN
SELECT A.JobTitle, A.JobID
FROM job A
WHERE A.JFillStatus='No' AND JobTitle NOT IN(
SELECT JobTitle
FROM job A, applies B
WHERE B.UName=uName AND A.JobID=B.JobID
);
END //

#get list of state abbreviations
DELIMITER //
CREATE PROCEDURE getStates ()
BEGIN
SELECT DISTINCT Abbr
FROM state;
END //

#get all of a user's applications
DELIMITER //
CREATE PROCEDURE getApplications (IN uName VARCHAR(45))
BEGIN
SELECT A.JobTitle, B.DateApplied, A.JFillStatus, A.JobID
FROM job A, applies B
WHERE B.UName=uName AND B.JobID=A.JobID;
END //

#delete an application
DELIMITER //
CREATE PROCEDURE deleteApplication (IN jID INT, username VARCHAR(45))
BEGIN
DELETE FROM applies
WHERE JobID=jID AND UName=username;
END //

#submit an application
DELIMITER //
CREATE PROCEDURE submitApplication (IN jID INT, username VARCHAR(45))
BEGIN
INSERT INTO applies (JobID, UName, ApplicationID, DateApplied)
VALUES (jID, username, 0, CURDATE());
END //

#update a resumes objective and salary
DELIMITER //
CREATE PROCEDURE updateObjAndSal (IN id INT, obj VARCHAR(500), sal INT)
BEGIN
UPDATE resume
SET RObjective=obj, RSalaryMin=sal
WHERE ResumeID=id;
END //

#gets a user's education history
DELIMITER //
CREATE PROCEDURE getUserEducation (IN uName VARCHAR(45))
BEGIN
SELECT UniversityName, DegreeType, DegreeArea, EGPA, EstartDate, EGradDate, EducationID
FROM education A, degreearea B, degreetype C, university D, resume E
WHERE E.UName=uName AND A.ResumeID=E.ResumeID AND B.DegreeAreaID=A.DegreeAreaID AND C.DegreeTypeID=A.DegreeTypeID AND D.UniversityID=A.EUniversityID
ORDER BY A.EGradDate;
END //

#delete an education history entry
DELIMITER //
CREATE PROCEDURE deleteEduEntry (IN id INT)
BEGIN
DELETE FROM education
WHERE EducationID=id;
END //

#add an education history entry
DELIMITER //
CREATE PROCEDURE addEduEntry (IN school INT, degree INT, degreeArea INT, gpa FLOAT, sDate DATE, gDate DATE, rID INT)
BEGIN
INSERT INTO education (EUniversityID, DegreeTypeID, DegreeAreaID, EGPA, EStartDate, EGradDate, ResumeID)
VALUES (school, degree, degreeArea, gpa, sDate, gDate, rID);
END //

#get list of schools
DELIMITER //
CREATE PROCEDURE getSchools ()
BEGIN
SELECT DISTINCT UniversityName
FROM university;
END //

#get list of degrees
DELIMITER //
CREATE PROCEDURE getDegrees ()
BEGIN
SELECT DISTINCT DegreeType
FROM degreetype;
END //

#get list of degree areas
DELIMITER //
CREATE PROCEDURE getDegreeAreas ()
BEGIN
SELECT DISTINCT DegreeArea
FROM degreearea;
END //

#get job history for a user
DELIMITER //
CREATE PROCEDURE getJobHistory (IN uName VARCHAR (45))
BEGIN
SELECT PJCompanyName, PJCity, Abbr, PJJobTitle, PJDuties, PJStartDate, PJEndDate, PjobID
FROM priorjobs A, state B, resume C
WHERE A.StateID=B.StateID AND A.ResumeID=C.ResumeID AND C.UName=uName
ORDER BY PJStartDate DESC;
END //

#delete a job history entry
DELIMITER //
CREATE PROCEDURE deleteJobHistoryEntry (IN id INT)
BEGIN
DELETE FROM priorjobs
WHERE PjobID=id;
END //

#add a job history entry
DELIMITER //
CREATE PROCEDURE addJobHistoryEntry (IN company VARCHAR(45), jTitle VARCHAR(45), location VARCHAR(45), state INT, duties VARCHAR(50), sDate DATE, eDate DATE, rID INT)
BEGIN
INSERT INTO priorjobs (PJCompanyName, PJJobTitle, PJCity, StateID, PJDuties, PJStartDate, PJEndDate, ResumeID)
VALUES (company, jTitle, location, state, duties, sDate, eDate, rID);
END //

#get list of companies
DELIMITER //
CREATE PROCEDURE getCompanyNames ()
BEGIN
SELECT DISTINCT CName
FROM company;
END //

#get list of job titles
DELIMITER //
CREATE PROCEDURE getJobTitles ()
BEGIN
SELECT title
FROM jobtitle;
END //

#get all skills for a user
DELIMITER //
CREATE PROCEDURE getUserSkills (IN uName VARCHAR(45))
BEGIN
SELECT A.SSkillName, A.SSkillID
FROM skill A, skillset B, resume C
WHERE A.SSkillID=B.SSkillID AND B.ResumeID=C.ResumeID AND C.UName=uName;
END //

#remove a skill from a resume
DELIMITER //
CREATE PROCEDURE removeSkill (IN skill INT, resume INT)
BEGIN
DELETE FROM skillset
WHERE SSkillID=skill AND ResumeID=resume;
END //

#get list of skills
DELIMITER //
CREATE PROCEDURE getSkillList ()
BEGIN
SELECT SSkillName
FROM skill;
END //

#update a user entry
DELIMITER //
CREATE PROCEDURE updateUser (IN uName VARCHAR(45), passwd VARCHAR(45), fName VARCHAR(45), lName VARCHAR(45), address VARCHAR(45), address2 VARCHAR(45), city VARCHAR(45), state INT, zip VARCHAR(45), email VARCHAR(45), phone VARCHAR(45), fax VARCHAR(45), cell VARCHAR(45), web VARCHAR(45))
BEGIN
UPDATE user
SET UPasswd=passwd, UFName=fName, ULName=lName, UStreet1=address, UStreet2=address2, UCity=city, StateID=state, Zipcode=zip, UEmail=email, UPhone=phone, UFax=fax, UCell=cell, UHomePage=web
WHERE UName=uName;
END //

# search through jobs user has not applied to filtering by given criteria.
# username is required, the other parameters are optional but if left out must have null in their place.
DELIMITER //
CREATE PROCEDURE searchJobsNotApplied (IN username VARCHAR(45), jTitle VARCHAR(45), company VARCHAR(45),
	sal INT, loc INT )
BEGIN
	SET SQL_SAFE_UPDATES=0;
	-- Get all jobs not applied to for user and stick into temp table
    CREATE temporary TABLE tempJob LIKE job;
	INSERT INTO tempJob
	SELECT A.*
	FROM job A
	WHERE A.JFillStatus='No'
    AND JobTitle NOT IN
	(
		SELECT JobTitle
		FROM job A, applies B
		WHERE B.UName=username AND A.JobID=B.JobID
	);
    -- Begin filtering down results based on optional arguments
    IF JTitle IS NOT NULL THEN
		DELETE FROM tempJob WHERE STRCMP(jTitle, tempJob.JobTitle) <> 0;
    END IF;
    IF company IS NOT NULL THEN
		DELETE FROM tempJob WHERE STRCMP(company, tempJob.CName) <> 0;
    END IF;
    IF sal IS NOT NULL THEN
		DELETE FROM tempJob WHERE tempJob.JLowRange < sal;
    END IF;
    IF loc IS NOT NULL THEN
		DELETE FROM tempJob WHERE loc <> tempJob.StateID;
    END IF;
    -- Return the final results of temp table and delete it
    SELECT * FROM tempJob;
    DROP TABLE tempJob;
    SET SQL_SAFE_UPDATES=1;
END //

#delete skillset to repopulate for user given the resumeID
DELIMITER //
CREATE PROCEDURE deleteResumeSkillset (IN rID INT)
BEGIN
SET SQL_SAFE_UPDATES=0;
DELETE FROM skillset WHERE ResumeID = rID;
-- SET SQL_SAFE_UPDATES=1;
END //

#get job details along with a count of total applicants for this job
DELIMITER //
CREATE PROCEDURE getJobDetails (IN jID INT)
BEGIN
SELECT j.*, count(*) as 'TotalApplicants' 
FROM job as j 
	join applies as a on j.jobID = a.jobID
WHERE j.jobID = jID;
END //