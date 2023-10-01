# 1

CREATE TABLE people (
    person_id INT UNIQUE NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10 , 2 ) DEFAULT 0,
    passport_id INT UNIQUE
);

CREATE TABLE passports (
    passport_id INT PRIMARY KEY AUTO_INCREMENT,
    passport_number VARCHAR(8) UNIQUE
)AUTO_INCREMENT = 101;

ALTER TABLE people
ADD CONSTRAINT pk_people
PRIMARY KEY (person_id),
ADD CONSTRAINT fk_people_passports
FOREIGN KEY (passport_id) REFERENCES passports(passport_id);

INSERT INTO passports(passport_number)
VALUES('N34FG21B'),
('K65LO4R7'),
('ZE657QP2');


INSERT INTO people(first_name,salary, passport_id)
VALUES('Roberto', 43300.00, 102),
('Tom', 56100.00, 103),
('Yana', 60200.00, 101);


# 2

CREATE TABLE manufacturers (
    manufacturer_id INT  PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) UNIQUE NOT NULL,
    established_on DATE NOT NULL 
);

CREATE TABLE models (
    model_id INT  PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    manufacturer_id INT,
    CONSTRAINT fk_models_manufacturers
    FOREIGN KEY (manufacturer_id)
    REFERENCES manufacturers(manufacturer_id)
)AUTO_INCREMENT = 101;

INSERT INTO manufacturers(name, established_on)
VALUES ('BMW', '1916-03-01'),
('Tesla', '2003-01-01'),
('Lada', '1966-05-01');

INSERT INTO models (name, manufacturer_id)
VALUES ('X1', 1),
('i6', 1 ),
('Model S', 2),
('Model X', 2),
('Model 3', 2),
('Nova', 3);

# 3

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30)
);

CREATE TABLE exams (
    exam_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20)
)  AUTO_INCREMENT=101;

CREATE TABLE students_exams (
    student_id INT,
    exam_id INT,
    CONSTRAINT pk_students_exams PRIMARY KEY (student_id , exam_id),
    CONSTRAINT fk_students_exams_student_id__students_student_id FOREIGN KEY (student_id)
        REFERENCES students (student_id),
    CONSTRAINT fk_students_exams_exam_id__exams_exam_id FOREIGN KEY (exam_id)
        REFERENCES exams (exam_id)
);


INSERT INTO students(name)
VALUES ('Mila'), ('Toni'), ('Ron');

INSERT INTO exams(name)
VALUES ('Spring MVC'), ('Neo4j'), ('Oracle 11g');

INSERT INTO students_exams(student_id, exam_id)
VALUES (1, 101), 
(1, 102),
(2, 101),
(3, 103),
(2, 102),
(2, 103);

# 4

CREATE TABLE teachers(
teacher_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50),
manager_id INT
)AUTO_INCREMENT=101;


INSERT INTO teachers(name, manager_id) 
VALUES ('John', NULL),
('Maya', 106),
('Silvia', 106),
('Ted', 105),
('Mark', 101),
('Greta', 101);


ALTER TABLE teachers
ADD CONSTRAINT fk_teacher_id_manager_id
FOREIGN KEY (manager_id)
REFERENCES teachers(teacher_id);

SELECT * from teachers;

# 5

CREATE TABLE cities(
city_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50)
);

CREATE TABLE customers(
customer_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50),
birthday Date,
city_id int,
CONSTRAINT fk_customers_cities FOREIGN KEY(city_id)
REFERENCES cities(city_id)
);

CREATE TABLE item_types(
item_type_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50)
);


CREATE TABLE items(
item_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50),
item_type_id INT,
CONSTRAINT fk_items_item_types FOREIGN KEY(item_type_id)
REFERENCES item_types(item_type_id)
);

CREATE TABLE orders(
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,
CONSTRAINT fk_orders_customers FOREIGN KEY(customer_id)
REFERENCES customers(customer_id)
);

CREATE TABLE order_items(
order_id INT,
item_id INT,
CONSTRAINT pk_order_items PRIMARY KEY (order_id , item_id),
CONSTRAINT fk_order_items_order_id__orders_order_id FOREIGN KEY (order_id)
REFERENCES orders(order_id),
CONSTRAINT fk_order_items_item_id__items_item_id FOREIGN KEY (item_id)
REFERENCES items(item_id)
);

# 6

CREATE TABLE majors(
major_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50)
);

CREATE TABLE students(
student_id INT PRIMARY KEY AUTO_INCREMENT,
student_number VARCHAR(12),
student_name VARCHAR(50),
major_id INT NOT NULL,
CONSTRAINT fk_students_majors FOREIGN KEY (major_id)
REFERENCES majors(major_id)
);

CREATE TABLE payments(
payment_id INT PRIMARY KEY AUTO_INCREMENT,
payment_date DATE,
payment_amount DECIMAL(8,2),
student_id INT NOT NULL,
CONSTRAINT fk_payments_student FOREIGN KEY (student_id)
REFERENCES students(student_id)
);

CREATE TABLE subjects(
subject_id INT PRIMARY KEY AUTO_INCREMENT,
subject_name VARCHAR(50)
);

CREATE TABLE agenda(
student_id INT NOT NULL,
subject_id INT NOT NULL,
CONSTRAINT pk_agenda PRIMARY KEY (student_id, subject_id),
CONSTRAINT fk_agenda_students FOREIGN KEY (student_id)
        REFERENCES students (student_id),
    CONSTRAINT fk_agenda_subjects FOREIGN KEY (subject_id)
        REFERENCES subjects (subject_id)
);

# 9

SELECT 
    m.mountain_range, p.peak_name, p.elevation AS peak_elevation
FROM
    mountains AS m
        JOIN    peaks AS p ON m.id = p.mountain_id
WHERE    mountain_range = 'Rila'
ORDER BY p.elevation DESC;













