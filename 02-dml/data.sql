-- INSERT A NEW PARENT
/*
INSERT INTO <table name>
  (<col_1>, <col_2>, ...<col_n> )
  VALUES (value1 , value2, ...valuen );
*/

-- No need to fill in the parent_id
INSERT INTO parents (first_name, last_name) 
VALUES ("Peter", "Barker");

-- Check if the new row has been inserted
-- Use SELECT * FROM <table_name>

-- Since last name can be null
INSERT INTO parents (first_name) VALUES ("Chua Kang");

-- DELETE
-- Syntax: DELETE FROM <table> WHERE <critera for deletion>
DELETE FROM parents WHERE parent_id = 3;

-- UPDATE
UPDATE parents SET last_name="Chua" WHERE parent_id = 5;

-- UPDATE MANY COLUMNS
-- Update John Snow to Jon Sow
UPDATE parents SET first_name="Jon", last_name="Sow"
 WHERE parent_id = 4;

INSERT INTO students (name, dob, parent_id, swimming_level)
 VALUES ("Sarah Barker", "2020-06-07", 1, 0);

 -- Insert multiple
 INSERT INTO students (name, dob, parent_id, swimming_level)
  VALUES ("Peter Stare", "2021-05-23", 1, 0),
  ("Mary Chua", "2019-12-03", 5, 3); 