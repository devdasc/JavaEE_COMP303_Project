DROP DATABASE  IF EXISTS Defect_Tracker_JavaEE;

CREATE DATABASE  Defect_Tracker_JavaEE;
USE Defect_Tracker_JavaEE;



DROP TABLE IF EXISTS Defect_Fix_Detail;
DROP TABLE IF EXISTS Vendor;
DROP TABLE IF EXISTS Applications;

CREATE TABLE Applications (
    application_Id int NOT NULL auto_increment,
	applicationName varchar(255) NOT NULL,	
    description varchar(500) NULL,	
	CONSTRAINT PK_Application_Id PRIMARY KEY (application_Id)
); 


CREATE TABLE Vendor (
    vendor_Id int NOT NULL auto_increment,
	vendorName varchar(255) NOT NULL,	
	description varchar(500) NULL,	
	CONSTRAINT PK_Vendor_Id PRIMARY KEY (vendor_Id)
); 




 CREATE TABLE Defect_Fix_Detail (
    defect_Id int NOT NULL auto_increment,
	title varchar(255) NOT NULL,
	application_Id int NOT NULL,
	vendor_Id  int NOT NULL,
	defectCreationDate date NOT NULL,
	description varchar(500) NOT NULL,
	dependentDefect_Id int NULL,
	status int NOT NULL  CHECK (status in (1,2,3,4,5,6,7,8,9)),/*1=WaitingForFix, 2=FixReceived, 3=DeployedInSDF, 4=DeployedInIST1, 5=DeployedInIST2,6=DeployedInPROD, 7=DeployedInTraining, 8=DeployedInDR, 9=Closed*/
	fixRecieveDate date NOT NULL,
	impactedComponent varchar(500) NOT NULL,	
	deploymentPackageLocation varchar(500) NOT NULL,
	isTestCaseProvided int NOT NULL CHECK (isTestCaseProvided=1 or isTestCaseProvided=2),
	isDeploymentInstructionProvided int NOT NULL CHECK (isDeploymentInstructionProvided=1 or isDeploymentInstructionProvided=2),    
	reviewDate date NOT NULL,
    CONSTRAINT PK_Defect_Id PRIMARY KEY (defect_Id),	 
    FOREIGN KEY (application_Id) REFERENCES Applications(application_Id),
	FOREIGN KEY (vendor_Id) REFERENCES Vendor(vendor_Id),
	FOREIGN KEY (dependentDefect_Id) REFERENCES Defect_Fix_Detail(defect_Id)
); 



/*insert data into application*/
INSERT INTO `Defect_Tracker_JavaEE`.`applications`
(`application_Id`,`applicationName`,description) VALUES (1,'App1', 'Application for Teller');

INSERT INTO `Defect_Tracker_JavaEE`.`applications`
(`application_Id`,`applicationName`,description) VALUES (2,'App2', 'Checque processing application');

INSERT INTO `Defect_Tracker_JavaEE`.`applications`
(`application_Id`,`applicationName`,description) VALUES (3,'App3', 'Currency validation application');


/*insert data into vendor*/

INSERT INTO `Defect_Tracker_JavaEE`.`vendor`
(`vendor_Id`,`vendorName`,description) VALUES (1, 'IBM', 'Providing multiple application');

INSERT INTO `Defect_Tracker_JavaEE`.`vendor`
(`vendor_Id`,`vendorName`,description) VALUES (2, 'NCR', 'Providing multiple application');


/*insert data into defect fix detail*/
INSERT INTO `Defect_Tracker_JavaEE`.`defect_fix_detail`
(`defect_Id`,`title`,`application_Id`,`vendor_Id`,`defectCreationDate`,`description`,
`dependentDefect_Id`,`status`,`fixRecieveDate`,`impactedComponent`,`deploymentPackageLocation`,
`isTestCaseProvided`,`isDeploymentInstructionProvided`,`reviewDate`)
VALUES
(5, 'Currency conversion error', 1, 1, (SELECT CURDATE() - 1),'Currency conversion is not proper for less than $1',
null, 2, (SELECT CURDATE()-1), 'N/A', 'Data Server', 1, 1, (SELECT CURDATE()));


INSERT INTO `Defect_Tracker_JavaEE`.`defect_fix_detail`
(`defect_Id`,`title`,`application_Id`,`vendor_Id`,`defectCreationDate`,`description`,
`dependentDefect_Id`,`status`,`fixRecieveDate`,`impactedComponent`,`deploymentPackageLocation`,
`isTestCaseProvided`,`isDeploymentInstructionProvided`,`reviewDate`)
VALUES
(2, 'Wrong message to user', 2, 2, (SELECT CURDATE() - 1),'Showing wrong message to customer for account to account transfer',
null, 2, (SELECT CURDATE()-1), 'N/A', 'Data Server', 1, 1, (SELECT CURDATE() ));

INSERT INTO `Defect_Tracker_JavaEE`.`defect_fix_detail`
(`defect_Id`,`title`,`application_Id`,`vendor_Id`,`defectCreationDate`,`description`,
`dependentDefect_Id`,`status`,`fixRecieveDate`,`impactedComponent`,`deploymentPackageLocation`,
`isTestCaseProvided`,`isDeploymentInstructionProvided`,`reviewDate`)
VALUES
(3, 'Duplicate entry created for online transaction', 1, 1, (SELECT CURDATE() - 1),'Duplicate entry created for online transaction only',
null, 2, (SELECT CURDATE()-1), 'N/A', 'Data Server', 1, 1, (SELECT CURDATE()));

INSERT INTO `Defect_Tracker_JavaEE`.`defect_fix_detail`
(`defect_Id`,`title`,`application_Id`,`vendor_Id`,`defectCreationDate`,`description`,
`dependentDefect_Id`,`status`,`fixRecieveDate`,`impactedComponent`,`deploymentPackageLocation`,
`isTestCaseProvided`,`isDeploymentInstructionProvided`,`reviewDate`)
VALUES
(4, 'Summery file not generated', 1, 1, (SELECT CURDATE() - 1),'Summery file not generated for over 10000 transactions',
null, 2, (SELECT CURDATE()-1), 'N/A', 'Data Server', 1, 1, (SELECT CURDATE()));



commit;
