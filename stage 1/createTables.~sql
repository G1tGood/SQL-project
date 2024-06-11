-- Create table for soldiers
CREATE TABLE solider
(
  date_of_birth DATE NOT NULL,
  id INT NOT NULL,
  first_name VARCHAR(81) NOT NULL,
  rank VARCHAR(81) NOT NULL,
  religion VARCHAR(81) NOT NULL,
  last_name VARCHAR(81) NOT NULL,
  PRIMARY KEY (id)
);

-- Create table for commanders
CREATE TABLE commander
(
  nickname VARCHAR(81),
  soliders_affection INT NOT NULL, CHECK (soliders_affection >= 1 AND soliders_affection <= 10),
  security_clearance INT NOT NULL, CHECK (security_clearance >= 1 AND security_clearance <= 5),
  id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id) REFERENCES solider(id)
);

-- Create table for teams
CREATE TABLE team
(
  team_number INT NOT NULL,
  name VARCHAR(81) NOT NULL,
  religious INT NOT NULL,
  commander_id INT NOT NULL,
  PRIMARY KEY (team_number),
  FOREIGN KEY (commander_id) REFERENCES commander(id)
);

-- Create table for military rabbis
CREATE TABLE military_Rabbi
(
  certified_Rabbi INT NOT NULL,
  Payytan INT NOT NULL,
  sector VARCHAR(81) NOT NULL,
  ethnicity VARCHAR(81) NOT NULL,
  preacher INT NOT NULL,
  id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id) REFERENCES solider(id)
);

-- Create table for combat medics
CREATE TABLE combat_medic
(
  qualification VARCHAR(81) NOT NULL,
  in_training INT NOT NULL,
  id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id) REFERENCES solider(id)
);

-- Create table for military operations
CREATE TABLE operation
(
  operation_date DATE NOT NULL,
  location VARCHAR(81) NOT NULL,
  operation_id INT NOT NULL,
  commander_id INT NOT NULL,
  medic_id INT NOT NULL,
  team_number INT NOT NULL,
  PRIMARY KEY (operation_id),
  FOREIGN KEY (commander_id) REFERENCES commander(id),
  FOREIGN KEY (medic_id) REFERENCES combat_medic(id),
  FOREIGN KEY (team_number) REFERENCES team(team_number)
);

-- create table for solider-team connection
CREATE TABLE solider_in
(
  responsibility VARCHAR(81) NOT NULL,
  team_number INT NOT NULL,
  id INT NOT NULL,
  PRIMARY KEY (team_number, id),
  FOREIGN KEY (team_number) REFERENCES team(team_number),
  FOREIGN KEY (id) REFERENCES solider(id)
);
