CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT, 
    IN p_FirstName CHAR(25), 
    IN p_LastName CHAR(25), 
    IN p_Salary INT, 
    IN p_JoiningDate DATETIME, 
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department) 
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END$$

DELIMITER ;
CALL AddWorker(1, 'John', 'Doe', 50000, '2023-01-01', 'HR');


CREATE PROCEDURE GetWorkerSalary(
    IN p_Worker_Id INT, 
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary FROM Worker WHERE Worker_Id = p_Worker_Id;
END$$

DELIMITER ;


CALL GetWorkerSalary(1, @salary);
SELECT @salary AS WorkerSalary;




DELIMITER $$

CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_Worker_Id INT, 
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker 
    SET Department = p_Department 
    WHERE Worker_Id = p_Worker_Id;
END$$

DELIMITER ;


CALL UpdateWorkerDepartment(1, 'Finance');
DELIMITER $$
CREATE PROCEDURE GetWorkerCount(
    IN p_Department CHAR(25), 
    OUT p_WorkerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_WorkerCount 
    FROM Worker 
    WHERE Department = p_Department;
END$$

DELIMITER ;

CALL GetWorkerCount('HR', @workerCount);
SELECT @workerCount AS WorkerCount;

DELIMITER $$

CREATE PROCEDURE GetAverageSalary(
    IN p_Department CHAR(25), 
    OUT p_AvgSalary DECIMAL(15, 2)
)
BEGIN
    SELECT AVG(Salary) INTO p_AvgSalary 
    FROM Worker 
    WHERE Department = p_Department;
END$$

DELIMITER ;

CALL GetAverageSalary('HR', @avgSalary);
SELECT @avgSalary AS AverageSalary;