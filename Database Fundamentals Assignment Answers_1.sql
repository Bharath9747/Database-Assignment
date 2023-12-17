use Student;

DELIMITER //

CREATE PROCEDURE Getbalance(IN student_id int,out balance decimal(6))
BEGIN
    set balance = (Select AmountBalance from StudentAdmissionPaymentDetails where StudentRollNo = student_id);
END //

DELIMITER ;

set @result=null;

Call GetBalance(1002,@result);

select @result as Result;

Select t1.StudentRollNo,t1.StudentSurName,t1.StudentName,t1.StudentAddress,t1.StudentCity,t1.StudentPincode from StudentBasicInformation t1 join StudentSubjectInformation t2 on t1.StudentRollno =t2.StudentRollNo where SubjectOpted="Maths" order by t2.StudentMarksPercentage desc limit 5;

Select t1.StudentRollNo,t1.StudentSurName,t1.StudentName,t1.StudentAddress,t1.StudentCity,t1.StudentPincode from StudentBasicInformation t1 join StudentSubjectInformation t2 on t1.StudentRollno =t2.StudentRollNo where SubjectOpted="Maths" and t1.StudentRollNo in(select StudentRollNo from StudentSubjectInformation order by t2.StudentMarksPercentage desc limit 5);

select * from SubjectScholarshipInformation;

Select ScholarshipCategory,count(*) from SubjectScholarshipInformation group by ScholarshipCategory;

Select ScholarshipCategory,count(*) from SubjectScholarshipInformation group by ScholarshipCategory order by ScholarshipCategory   limit 1;

Select t1.StudentRollNo,t1.StudentSurName,t1.StudentName,t1.StudentAddress,t1.StudentCity,
t2.StudentMarksPercentage from StudentBasicInformation t1 join StudentSubjectInformation t2 on t1.StudentRollno =t2.StudentRollNo join
(
 Select StudentRollNo,max(ScholarshipAmount) as maxScholarship from SubjectScholarshipInformation where ScholarshipAmount <=10000 group by StudentRollNo
 ) t3 on t1.StudentRollNo = t3.StudentRollNo
  order by t2.StudentMarksPercentage  desc limit 1;
