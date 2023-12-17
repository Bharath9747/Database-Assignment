use Student;

create table StudentBasicInformation(
	StudentName varchar(100),
    StudentSurName varchar(25),
    StudentRollNo INT auto_increment primary key,
    StudentAddress varchar(50),
    StudentCity varchar(50),
    StudentPincode decimal(6),
    StudentAdmissionDone boolean default false
);

Alter table StudentBasicInformation auto_increment = 1001;
create table StudentAdmissionPaymentDetails(
	StudentRollNo INT,
    AmountPaid decimal(6),
    AmountBalance decimal(6),
    AdmissionType varchar(25),
    PaymentType varchar(25)
);

Alter table StudentAdmissionPaymentDetails
add foreign key (StudentRollNo) references StudentBasicInformation(StudentRollNo);

create table StudentSubjectInformation(
	SubjectOpted varchar(25),
    StudentRollNo INT,
    StudentTotalMarks INT,
    SubjectObtainedMarks int,
    StudentMarksPercentage double,
    SubjectType varchar(25),
    SubjectCategory varchar(25)
);

Alter table StudentSubjectInformation
add foreign key (StudentRollNo) references StudentBasicInformation(StudentRollNo);

create table SubjectScholarshipInformation(
	StudentRollNo int,
    ScholarshipName varchar(25),
    ScholarshipDescription varchar(50),
    ScholarshipAmount double,
    ScholarshipCategory varchar(25),
    ScholarshipSponser varchar(25),
    ScholarshipOpted boolean default true,
    ScholarshipRecieved boolean default false 
);

Alter table SubjectScholarshipInformation modify ScholarshipDescription  varchar(100);
Alter table SubjectScholarshipInformation
add foreign key (StudentRollNo) references StudentBasicInformation(StudentRollNo);

insert into StudentBasicInformation(StudentName,StudentSurName,StudentAddress,StudentCity,StudentPincode) values ("Bharath","Mohanraj","Subramaniyapuram","Tuty",628002),
("John", "Doe", "123 Main St", "City1", 123456),
("Jane", "Smith", "456 Oak St", "City2", 789012),
("Alice", "Johnson", "789 Pine St", "City3", 345678),
("Bob", "Williams", "101 Maple St", "City4", 901234),
("Eve", "Brown", "202 Elm St", "City5", 567890),
("Charlie", "Davis", "303 Birch St", "City6", 123789),
("Diana", "Clark", "404 Cedar St", "City7", 456321),
("Frank", "Evans", "505 Spruce St", "City8", 987654),
("Grace", "Fisher", "606 Pine St", "City9", 123987),
("Henry", "Garcia", "707 Oak St", "City10", 456789),
("Ivy", "Hill", "808 Elm St", "City11", 789012),
("Jack", "Irwin", "909 Birch St", "City12", 345678),
("Kathy", "Jones", "1010 Cedar St", "City13", 901234),
("Luke", "Miller", "1111 Spruce St", "City14", 567890),
("Mia", "Nelson", "1212 Pine St", "City15", 123789),
("Oscar", "Oliver", "1313 Oak St", "City16", 456321),
("Penelope", "Perez", "1414 Elm St", "City17", 987654),
("Quincy", "Quinn", "1515 Birch St", "City18", 123987),
("Rachel", "Roberts", "1616 Cedar St", "City19", 456789);


select * from StudentBasicInformation;

insert into StudentAdmissionPaymentDetails values(1001, 5000, 1000, 'Regular', 'Online'),
(1002, 8000, 2000, 'Regular', 'Cash'),
(1003, 3000, 5000, 'Sports', 'Card'),
(1004, 7000, 3000, 'Regular', 'Online'),
(1005, 6000, 2000, 'Arts', 'Cash'),
(1006, 9000, 1000, 'Regular', 'Card'),
(1007, 4000, 3000, 'Sports', 'Online'),
(1008, 8000, 4000, 'Regular', 'Cash'),
(1009, 5000, 1000, 'Regular', 'Card'),
(1010, 7000, 5000, 'Arts', 'Online'),
(1011, 6000, 2000, 'Sports', 'Cash'),
(1012, 9000, 1000, 'Regular', 'Online'),
(1013, 4000, 3000, 'Regular', 'Cash'),
(1014, 8000, 4000, 'Arts', 'Card'),
(1015, 5000, 1000, 'Regular', 'Online'),
(1016, 6000, 2000, 'Sports', 'Card'),
(1017, 9000, 1000, 'Regular', 'Online'),
(1018, 4000, 3000, 'Regular', 'Cash'),
(1019, 8000, 4000, 'Arts', 'Online'),
(1020, 5000, 1000, 'Regular', 'Card');


DELIMITER //

CREATE TRIGGER InsertAdmissionDone
AFTER INSERT ON StudentAdmissionPaymentDetails
FOR EACH ROW
BEGIN
    -- Check if the amountBalance is zero and update AdmissionDone
    IF NEW.AmountBalance = 0 THEN
        UPDATE StudentBasicInformation
        SET StudentAdmissionDone = TRUE
        WHERE StudentRollNo = NEW.StudentRollNo;
    END IF;
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER UpdateAdmissionDone
AFTER Update ON StudentAdmissionPaymentDetails
FOR EACH ROW
BEGIN
    -- Check if the amountBalance is zero and update AdmissionDone
    IF NEW.AmountBalance = 0 THEN
        UPDATE StudentBasicInformation
        SET StudentAdmissionDone = TRUE
        WHERE StudentRollNo = NEW.StudentRollNo;
    END IF;
END;
//





insert into StudentSubjectInformation(SubjectOpted,StudentRollNo,StudentTotalMarks,SubjectObtainedMarks,SubjectType,SubjectCategory) values('Maths', 1001, 100, 85, 'Theory', 'core'),
('Maths', 1002, 100, 92, 'Theory', 'core'),
('Maths', 1003, 100, 78, 'Theory', 'core'),
('Maths', 1004, 100, 94, 'Theory', 'core'),
('Maths', 1005, 100, 87, 'Theory', 'core'),
('Maths', 1006, 100, 90, 'Theory', 'core'),
('Maths', 1007, 100, 82, 'Theory', 'core'),
('Maths', 1008, 100, 96, 'Theory', 'core'),
('Maths', 1009, 100, 88, 'Theory', 'core'),
('Maths', 1010, 100, 75, 'Theory', 'core'),
('Maths', 1011, 100, 91, 'Theory', 'core'),
('Maths', 1012, 100, 79, 'Theory', 'core'),
('Maths', 1013, 100, 93, 'Theory', 'core'),
('Maths', 1014, 100, 86, 'Theory', 'core'),
('Maths', 1015, 100, 98, 'Theory', 'core'),
('Maths', 1016, 100, 80, 'Theory', 'core'),
('Maths', 1017, 100, 89, 'Theory', 'core'),
('Maths', 1018, 100, 96, 'Theory', 'core'),
('Maths', 1019, 100, 88, 'Theory', 'core'),
('Maths', 1020, 100, 75, 'Theory', 'core'),
('CryptoGraphy', 1001, 100, 65, 'Practical', 'elective'),
('CryptoGraphy', 1002, 100, 72, 'Practical', 'elective'),
('CryptoGraphy', 1003, 100, 78, 'Practical', 'elective'),
('CryptoGraphy', 1004, 100, 94, 'Practical', 'elective'),
('CryptoGraphy', 1005, 100, 87, 'Practical', 'elective'),
('CryptoGraphy', 1006, 100, 90, 'Practical', 'elective'),
('CryptoGraphy', 1007, 100, 82, 'Practical', 'elective'),
('CryptoGraphy', 1008, 100, 96, 'Practical', 'elective'),
('CryptoGraphy', 1009, 100, 88, 'Practical', 'elective'),
('CryptoGraphy', 1010, 100, 75, 'Practical', 'elective'),
('CryptoGraphy', 1011, 100, 91, 'Practical', 'elective'),
('CryptoGraphy', 1012, 100, 79, 'Practical', 'elective'),
('CryptoGraphy', 1013, 100, 93, 'Practical', 'elective'),
('CryptoGraphy', 1014, 100, 86, 'Practical', 'elective'),
('CryptoGraphy', 1015, 100, 98, 'Practical', 'elective'),
('CryptoGraphy', 1016, 100, 80, 'Practical', 'elective'),
('CryptoGraphy', 1017, 100, 89, 'Practical', 'elective'),
('CryptoGraphy', 1018, 100, 96, 'Practical', 'elective'),
('CryptoGraphy', 1019, 100, 88, 'Practical', 'elective'),
('CryptoGraphy', 1020, 100, 75, 'Practical', 'elective');


DELIMITER //

CREATE PROCEDURE CalculatePercentageMarks()
BEGIN
    DECLARE student_id INT;
    DECLARE obtained_marks INT;
    DECLARE total_marks INT;
    declare subject_name varchar(25);
    DECLARE percentage_marks double;
    declare done boolean default false;

    DECLARE student_cursor CURSOR FOR
        SELECT SubjectOpted,StudentRollNo, StudentTotalMarks,SubjectObtainedMarks
        FROM StudentSubjectInformation;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN student_cursor;

    student_loop: LOOP
        FETCH student_cursor INTO subject_name,student_id, total_marks,obtained_marks;

        IF done THEN
            LEAVE student_loop;
        END IF;

        SET percentage_marks = (obtained_marks / total_marks) * 100;

        UPDATE StudentSubjectInformation
        SET StudentMarksPercentage = percentage_marks
        WHERE StudentRollNo = student_id and SubjectOpted = subject_name;
    END LOOP;

    CLOSE student_cursor;
END //

DELIMITER ;

Call CalculatePercentageMarks();

select * from StudentSubjectInformation;

Drop procedure if exists CalculatePercentageMarks;




insert into SubjectScholarshipInformation(StudentRollNo , ScholarshipName, ScholarshipDescription , ScholarshipSponser  ) values(1001, 'Maths', 'Mathematics scholarship for outstanding students', 'ABC'),
(1002, 'Maths', 'Mathematics scholarship for outstanding students', 'XYZ'),
(1003, 'Maths', 'Mathematics scholarship for outstanding students', 'ABC'),
(1004, 'Maths', 'Mathematics scholarship for outstanding students', 'XYZ'),
(1005, 'Maths', 'Mathematics scholarship for outstanding students', 'ABC'),
(1006, 'Maths', 'Mathematics scholarship for outstanding students', 'XYZ'),
(1007, 'Maths', 'Mathematics scholarship for outstanding students', 'ABC'),
(1008, 'Maths', 'Mathematics scholarship for outstanding students', 'XYZ'),
(1009, 'Maths', 'Mathematics scholarship for outstanding students', 'ABC'),
(1010, 'Maths', 'Mathematics scholarship for outstanding students', 'XYZ'),(1011, 'Maths', 'Mathematics scholarship for outstanding students', 'ABC'),
(1012, 'Maths', 'Mathematics scholarship for outstanding students', 'XYZ'),
(1013, 'Maths', 'Mathematics scholarship for outstanding students', 'ABC'),
(1014, 'Maths', 'Mathematics scholarship for outstanding students', 'XYZ' ),
(1015, 'Maths', 'Mathematics scholarship for outstanding students', 'ABC'),
(1016, 'Maths', 'Mathematics scholarship for outstanding students', 'XYZ'),
(1017, 'Maths', 'Mathematics scholarship for outstanding students', 'ABC'),
(1018, 'Maths', 'Mathematics scholarship for outstanding students', 'XYZ'),
(1019, 'Maths', 'Mathematics scholarship for outstanding students', 'ABC'),
(1020, 'Maths', 'Mathematics scholarship for outstanding students', 'XYZ'),
(1001, 'CryptoGraphy', 'Scholarship for outstanding achievements in cryptography', 'ABC'),
(1002, 'CryptoGraphy', 'Scholarship for outstanding achievements in cryptography', 'XYZ'),
(1003, 'CryptoGraphy', 'Scholarship for outstanding achievements in cryptography', 'ABC'),
(1004, 'CryptoGraphy', 'Scholarship for outstanding achievements in cryptography', 'XYZ'),
(1005, 'CryptoGraphy', 'Scholarship for outstanding achievements in cryptography', 'ABC'),
(1006, 'CryptoGraphy', 'Scholarship for outstanding achievements in cryptography', 'XYZ'),
(1007, 'CryptoGraphy', 'Scholarship for outstanding achievements in cryptography', 'ABC'),
(1008, 'CryptoGraphy', 'Scholarship for outstanding achievements in cryptography', 'XYZ'),
(1009, 'CryptoGraphy', 'Scholarship for outstanding achievements in cryptography', 'ABC'),
(1010, 'CryptoGraphy', 'Scholarship for outstanding achievements in cryptography', 'XYZ'),
(1011, 'CryptoGraphy', 'Scholarship for outstanding achievements in cryptography', 'ABC'),
(1012, 'CryptoGraphy', 'Scholarship for outstanding achievements in cryptography', 'XYZ'),
(1013, 'CryptoGraphy', 'Scholarship for outstanding achievements in cryptography', 'ABC'),
(1014, 'CryptoGraphy', 'Scholarship for outstanding achievements in cryptography', 'XYZ'),
(1015, 'CryptoGraphy', 'Scholarship for outstanding achievements in cryptography', 'ABC'),
(1016, 'CryptoGraphy', 'Scholarship for outstanding achievements in cryptography', 'XYZ'),
(1017, 'CryptoGraphy', 'Scholarship for outstanding achievements in cryptography', 'ABC'),
(1018, 'CryptoGraphy', 'Scholarship for outstanding achievements in cryptography', 'XYZ'),
(1019, 'CryptoGraphy', 'Scholarship for outstanding achievements in cryptography', 'ABC'),
(1020, 'CryptoGraphy', 'Scholarship for outstanding achievements in cryptography', 'XYZ');





DELIMITER //

CREATE PROCEDURE UpdateScholarship()
BEGIN
    DECLARE student_id INT;
    DECLARE subject_name VARCHAR(25);
    DECLARE scholarship_category VARCHAR(25);
    DECLARE scholarship_amount DOUBLE;
    DECLARE subject_mark DOUBLE;
    declare scholarship_recieved boolean default false;
    DECLARE done BOOLEAN DEFAULT FALSE;

    DECLARE scholarship_cursor CURSOR FOR
        SELECT SubjectOpted, StudentRollNo, StudentMarksPercentage
        FROM StudentSubjectInformation;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN scholarship_cursor;

    scholarship_loop: LOOP
		
        FETCH scholarship_cursor INTO subject_name, student_id, subject_mark;
        IF done THEN
            LEAVE scholarship_loop;
        END IF;
		set scholarship_recieved = false;
        IF subject_mark >= 90 THEN
            SET scholarship_category = 'High Achiever';
            set scholarship_recieved =true;
            SET scholarship_amount = 10000.0;
        ELSEIF subject_mark >= 80 THEN
            SET scholarship_category = 'Achiever';
            SET scholarship_amount = 7500.0;
        ELSE
            SET scholarship_category = 'Participant';
            
            SET scholarship_amount = 4500.0;
        END IF;

        UPDATE SubjectScholarshipInformation
        SET ScholarshipAmount = scholarship_amount,
            ScholarshipCategory = scholarship_category,ScholarshipRecieved = scholarship_recieved
        WHERE StudentRollNo = student_id AND ScholarshipName = subject_name;
    END LOOP;

    CLOSE scholarship_cursor;
END //

DELIMITER ;

Drop procedure if exists UpdateScholarship;


call UpdateScholarship();

select * from SubjectScholarshipInformation;

select * from StudentSubjectInformation;

select * from StudentAdmissionPaymentDetails;

select * from StudentBasicInformation;





Update  StudentBasicInformation set StudentCity ="Madurai" where StudentRollNo = 1002;
Update  StudentBasicInformation set StudentAddress ="KR Appartment" where StudentRollNo = 1005;
Update  StudentBasicInformation set StudentPincode ="560103" where StudentRollNo = 1010;
Update StudentAdmissionPaymentDetails set AmountPaid = 6000 , AmountBalance =0 where StudentRollNo = 1001;
Update StudentSubjectInformation set  SubjectType = "Problematic" where SubjectOpted = "Maths" and StudentRollNo = 1001;


select * from StudentBasicInformation where StudentRollNo in ( select StudentRollNo from  SubjectScholarshipInformation where ScholarshipAmount > 5000);

SELECT *
FROM StudentBasicInformation
WHERE StudentRollNo IN (
    SELECT StudentRollNo
    FROM SubjectScholarshipInformation
    WHERE ScholarshipOpted = true AND ScholarshipRecieved = false
);


SELECT s2.StudentRollNo,s1.StudentName
    FROM SubjectScholarshipInformation s2 inner join StudentBasicInformation s1 on s1.StudentRollNo = s2.StudentRollNo
    WHERE s2.ScholarshipOpted = true AND s2.ScholarshipRecieved = false;
    
    
create or replace view  BalanceView as select s1.StudentRollNo,s1.StudentName,s1.StudentSurName,s1.StudentAddress,s1.StudentCity,s1.StudentPincode from StudentBasicInformation s1 inner join StudentAdmissionPaymentDetails s2 on s1.StudentRollNo =s2.StudentRollNo where s2.AmountBalance > 0;

select * from BalanceView;
