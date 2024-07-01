prompt PL/SQL Developer Export Tables for user BASNAT@XE
prompt Created by Yoav on Monday, 1 July 2024
set feedback off
set define off

prompt Creating SOLIDER...
create table SOLIDER
(
  date_of_birth DATE not null,
  id            INTEGER not null,
  first_name    VARCHAR2(81) not null,
  rank          VARCHAR2(81) not null,
  religion      VARCHAR2(81) not null,
  last_name     VARCHAR2(81) not null
)
;
alter table SOLIDER
  add primary key (ID);

prompt Creating COMBAT_MEDIC...
create table COMBAT_MEDIC
(
  qualification VARCHAR2(81) not null,
  in_training   INTEGER default 0 not null,
  id            INTEGER not null
)
;
alter table COMBAT_MEDIC
  add primary key (ID);
alter table COMBAT_MEDIC
  add foreign key (ID)
  references SOLIDER (ID);
alter table COMBAT_MEDIC
  add constraint CHK_COMBAT_MEDIC_BOOL
  check (in_training BETWEEN 0 AND 1);

prompt Creating COMMANDER...
create table COMMANDER
(
  nickname           VARCHAR2(81),
  soliders_affection INTEGER not null,
  security_clearance INTEGER not null,
  id                 INTEGER not null
)
;
alter table COMMANDER
  add primary key (ID);
alter table COMMANDER
  add foreign key (ID)
  references SOLIDER (ID);
alter table COMMANDER
  add check (soliders_affection >= 1 AND soliders_affection <= 10);
alter table COMMANDER
  add check (security_clearance >= 1 AND security_clearance <= 5);
alter table COMMANDER
  add check (soliders_affection >= 1 AND soliders_affection <= 10);
alter table COMMANDER
  add check (security_clearance >= 1 AND security_clearance <= 5);

prompt Creating MILITARY_RABBI...
create table MILITARY_RABBI
(
  certified_rabbi INTEGER not null,
  payytan         INTEGER not null,
  sector          VARCHAR2(81) not null,
  ethnicity       VARCHAR2(81) not null,
  preacher        INTEGER not null,
  id              INTEGER not null
)
;
alter table MILITARY_RABBI
  add primary key (ID);
alter table MILITARY_RABBI
  add foreign key (ID)
  references SOLIDER (ID);
alter table MILITARY_RABBI
  add constraint CHECK_PAYYTAN_BOOL
  check (Payytan <= 1 AND Payytan >= 0);
alter table MILITARY_RABBI
  add constraint CHK_MILITARY_RABBI_BOOL
  check (payytan BETWEEN 0 AND 1);

prompt Creating TEAM...
create table TEAM
(
  team_number  INTEGER not null,
  name         VARCHAR2(81) not null,
  religious    INTEGER default 1 not null,
  commander_id INTEGER not null
)
;
alter table TEAM
  add primary key (TEAM_NUMBER);
alter table TEAM
  add foreign key (COMMANDER_ID)
  references COMMANDER (ID);

prompt Creating OPERATION...
create table OPERATION
(
  operation_date DATE not null,
  location       VARCHAR2(81) not null,
  operation_id   INTEGER not null,
  commander_id   INTEGER not null,
  medic_id       INTEGER not null,
  team_number    INTEGER not null
)
;
alter table OPERATION
  add primary key (OPERATION_ID);
alter table OPERATION
  add foreign key (COMMANDER_ID)
  references COMMANDER (ID);
alter table OPERATION
  add foreign key (MEDIC_ID)
  references COMBAT_MEDIC (ID);
alter table OPERATION
  add foreign key (TEAM_NUMBER)
  references TEAM (TEAM_NUMBER);

prompt Creating SOLIDER_IN...
create table SOLIDER_IN
(
  responsibility VARCHAR2(81) not null,
  team_number    INTEGER not null,
  id             INTEGER not null
)
;
alter table SOLIDER_IN
  add primary key (TEAM_NUMBER, ID);
alter table SOLIDER_IN
  add foreign key (TEAM_NUMBER)
  references TEAM (TEAM_NUMBER);
alter table SOLIDER_IN
  add foreign key (ID)
  references SOLIDER (ID);

prompt Disabling triggers for SOLIDER...
alter table SOLIDER disable all triggers;
prompt Disabling triggers for COMBAT_MEDIC...
alter table COMBAT_MEDIC disable all triggers;
prompt Disabling triggers for COMMANDER...
alter table COMMANDER disable all triggers;
prompt Disabling triggers for MILITARY_RABBI...
alter table MILITARY_RABBI disable all triggers;
prompt Disabling triggers for TEAM...
alter table TEAM disable all triggers;
prompt Disabling triggers for OPERATION...
alter table OPERATION disable all triggers;
prompt Disabling triggers for SOLIDER_IN...
alter table SOLIDER_IN disable all triggers;
prompt Disabling foreign key constraints for COMBAT_MEDIC...
alter table COMBAT_MEDIC disable constraint SYS_C008832;
prompt Disabling foreign key constraints for COMMANDER...
alter table COMMANDER disable constraint SYS_C008837;
prompt Disabling foreign key constraints for MILITARY_RABBI...
alter table MILITARY_RABBI disable constraint SYS_C008849;
prompt Disabling foreign key constraints for TEAM...
alter table TEAM disable constraint SYS_C008855;
prompt Disabling foreign key constraints for OPERATION...
alter table OPERATION disable constraint SYS_C008863;
alter table OPERATION disable constraint SYS_C008864;
alter table OPERATION disable constraint SYS_C008865;
prompt Disabling foreign key constraints for SOLIDER_IN...
alter table SOLIDER_IN disable constraint SYS_C008876;
alter table SOLIDER_IN disable constraint SYS_C008877;
prompt Deleting SOLIDER_IN...
delete from SOLIDER_IN;
commit;
prompt Deleting OPERATION...
delete from OPERATION;
commit;
prompt Deleting TEAM...
delete from TEAM;
commit;
prompt Deleting MILITARY_RABBI...
delete from MILITARY_RABBI;
commit;
prompt Deleting COMMANDER...
delete from COMMANDER;
commit;
prompt Deleting COMBAT_MEDIC...
delete from COMBAT_MEDIC;
commit;
prompt Deleting SOLIDER...
delete from SOLIDER;
commit;
prompt Loading SOLIDER...
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-11-1988', 'dd-mm-yyyy'), 303, 'Goldie', 'Corporal', 'Jainism', 'Pesci');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-04-2007', 'dd-mm-yyyy'), 304, 'Lili', 'Colonel', 'Buddhism', 'Coleman');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-09-2021', 'dd-mm-yyyy'), 305, 'Madeline', 'Captain', 'Islam', 'Gaynor');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-10-2003', 'dd-mm-yyyy'), 306, 'Wendy', 'General', 'Sikhism', 'Harmon');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-06-1993', 'dd-mm-yyyy'), 307, 'Dustin', 'Major', 'Taoism', 'Solido');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-11-2009', 'dd-mm-yyyy'), 308, 'Scott', 'Major General', 'Jainism', 'Coughlan');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-07-2015', 'dd-mm-yyyy'), 309, 'Alice', 'General', 'Bahaai', 'Iglesias');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-06-2015', 'dd-mm-yyyy'), 310, 'Saul', 'Sergeant', 'Christianity', 'Chaplin');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-02-1986', 'dd-mm-yyyy'), 311, 'Chazz', 'Colonel', 'Taoism', 'Liu');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-12-1990', 'dd-mm-yyyy'), 312, 'Jared', 'Captain', 'Sikhism', 'Iglesias');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-11-2019', 'dd-mm-yyyy'), 313, 'Sonny', 'Brigadier General', 'Bahaai', 'Crowell');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-02-2021', 'dd-mm-yyyy'), 314, 'Victoria', 'Lieutenant', 'Buddhism', 'Addy');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-09-2005', 'dd-mm-yyyy'), 315, 'Andrea', 'Lieutenant', 'Taoism', 'Crowe');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-02-1992', 'dd-mm-yyyy'), 316, 'Tia', 'Private', 'Buddhism', 'Lee');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-01-1993', 'dd-mm-yyyy'), 317, 'Johnette', 'Corporal', 'Shinto', 'Pullman');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-07-1993', 'dd-mm-yyyy'), 318, 'Laura', 'General', 'Islam', 'Satriani');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('31-07-1992', 'dd-mm-yyyy'), 319, 'Carl', 'Brigadier General', 'Jainism', 'Wakeling');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-04-2017', 'dd-mm-yyyy'), 320, 'First', 'Sergeant', 'Judaism', 'David');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-08-2016', 'dd-mm-yyyy'), 321, 'Ben', 'Captain', 'Sikhism', 'O''Neill');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-06-2006', 'dd-mm-yyyy'), 322, 'Bret', 'Captain', 'Shinto', 'Reubens');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-03-1987', 'dd-mm-yyyy'), 323, 'Davey', 'Brigadier General', 'Hinduism', 'Spiner');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-12-1995', 'dd-mm-yyyy'), 324, 'Parker', 'Major General', 'Bahaai', 'Lerner');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('31-07-1992', 'dd-mm-yyyy'), 325, 'Lara', 'Brigadier General', 'Jainism', 'Sevigny');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-02-2021', 'dd-mm-yyyy'), 326, 'Deborah', 'Captain', 'Bahaai', 'Potter');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-10-1997', 'dd-mm-yyyy'), 327, 'Olga', 'Brigadier General', 'Bahaai', 'Payton');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-05-2019', 'dd-mm-yyyy'), 328, 'Lucy', 'Brigadier General', 'Taoism', 'Aaron');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-11-2004', 'dd-mm-yyyy'), 329, 'Bruce', 'Lieutenant', 'Bahaai', 'Carter');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-04-2014', 'dd-mm-yyyy'), 330, 'Claude', 'Private', 'Hinduism', 'Wiest');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-10-2000', 'dd-mm-yyyy'), 331, 'Lloyd', 'Corporal', 'Christianity', 'Rodriguez');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-06-2012', 'dd-mm-yyyy'), 332, 'Candice', 'Lieutenant', 'Hinduism', 'Spacey');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-09-2019', 'dd-mm-yyyy'), 333, 'Janeane', 'Private', 'Bahaai', 'Def');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-05-2024', 'dd-mm-yyyy'), 334, 'William', 'General', 'Shinto', 'Snipes');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-12-1998', 'dd-mm-yyyy'), 335, 'Nile', 'Corporal', 'Sikhism', 'Moorer');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-03-2005', 'dd-mm-yyyy'), 336, 'Samantha', 'Lieutenant', 'Islam', 'Curfman');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-08-1986', 'dd-mm-yyyy'), 337, 'Suzanne', 'Sergeant', 'Christianity', 'Assante');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-10-2015', 'dd-mm-yyyy'), 338, 'Garry', 'Corporal', 'Christianity', 'Yulin');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-05-1996', 'dd-mm-yyyy'), 339, 'Ossie', 'Major General', 'Buddhism', 'Sevenfold');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-07-1989', 'dd-mm-yyyy'), 340, 'Vin', 'Brigadier General', 'Jainism', 'Farina');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-07-2007', 'dd-mm-yyyy'), 341, 'Sal', 'Lieutenant', 'Sikhism', 'Cochran');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('17-03-2017', 'dd-mm-yyyy'), 342, 'Emerson', 'General', 'Sikhism', 'Brody');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-08-1991', 'dd-mm-yyyy'), 343, 'Vince', 'Lieutenant', 'Sikhism', 'Arkin');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-04-1998', 'dd-mm-yyyy'), 344, 'Chalee', 'Major General', 'Judaism', 'Shorter');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-02-2018', 'dd-mm-yyyy'), 345, 'Betty', 'Captain', 'Buddhism', 'Cube');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-05-2022', 'dd-mm-yyyy'), 346, 'Trini', 'Corporal', 'Shinto', 'Drive');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-02-2022', 'dd-mm-yyyy'), 347, 'Clint', 'General', 'Hinduism', 'Dern');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-05-1998', 'dd-mm-yyyy'), 348, 'Kay', 'Major General', 'Christianity', 'Mitra');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-10-1994', 'dd-mm-yyyy'), 349, 'Shelby', 'Sergeant', 'Judaism', 'Stanley');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-05-2012', 'dd-mm-yyyy'), 350, 'Illeana', 'Lieutenant', 'Taoism', 'Kravitz');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-04-1992', 'dd-mm-yyyy'), 351, 'Glenn', 'Major', 'Jainism', 'Parsons');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-04-2019', 'dd-mm-yyyy'), 352, 'Richard', 'General', 'Judaism', 'Candy');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-11-1993', 'dd-mm-yyyy'), 353, 'Ike', 'Sergeant', 'Islam', 'Pryce');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-02-1998', 'dd-mm-yyyy'), 354, 'Holly', 'Brigadier General', 'Sikhism', 'Vaughan');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-08-1999', 'dd-mm-yyyy'), 355, 'Kylie', 'Major General', 'Sikhism', 'Tate');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-07-2011', 'dd-mm-yyyy'), 356, 'Tal', 'Brigadier General', 'Shinto', 'Myles');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('01-11-2003', 'dd-mm-yyyy'), 357, 'Emm', 'Captain', 'Judaism', 'Diffie');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-08-1992', 'dd-mm-yyyy'), 358, 'Teena', 'Colonel', 'Sikhism', 'Saxon');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-07-2014', 'dd-mm-yyyy'), 359, 'Ming-Na', 'Private', 'Bahaai', 'Speaks');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-08-1992', 'dd-mm-yyyy'), 360, 'Franz', 'Captain', 'Taoism', 'Gershon');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('01-02-1989', 'dd-mm-yyyy'), 361, 'Loren', 'Lieutenant', 'Hinduism', 'Thurman');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-01-1988', 'dd-mm-yyyy'), 362, 'Joseph', 'Corporal', 'Bahaai', 'Caviezel');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-09-1998', 'dd-mm-yyyy'), 363, 'Nile', 'Private', 'Hinduism', 'Hagerty');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-09-1995', 'dd-mm-yyyy'), 364, 'Cathy', 'Brigadier General', 'Sikhism', 'Copeland');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-10-2008', 'dd-mm-yyyy'), 365, 'Kenneth', 'Brigadier General', 'Shinto', 'Suvari');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-05-2021', 'dd-mm-yyyy'), 366, 'Philip', 'Major General', 'Bahaai', 'Sobieski');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-01-1999', 'dd-mm-yyyy'), 367, 'Mindy', 'Captain', 'Sikhism', 'Weaving');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-04-2006', 'dd-mm-yyyy'), 368, 'Pelvic', 'Sergeant', 'Sikhism', 'McCain');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-03-1990', 'dd-mm-yyyy'), 369, 'Reese', 'Corporal', 'Islam', 'O''Neal');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-01-1996', 'dd-mm-yyyy'), 370, 'Rodney', 'Private', 'Judaism', 'Polito');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-09-1997', 'dd-mm-yyyy'), 371, 'Davis', 'Lieutenant', 'Hinduism', 'Spall');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-07-2007', 'dd-mm-yyyy'), 372, 'Donal', 'Major General', 'Taoism', 'Devine');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-03-1994', 'dd-mm-yyyy'), 373, 'Burton', 'Major', 'Judaism', 'Englund');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('31-03-2024', 'dd-mm-yyyy'), 374, 'Edward', 'Major General', 'Christianity', 'Dern');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-08-2008', 'dd-mm-yyyy'), 375, 'Brothers', 'Major General', 'Sikhism', 'Carlisle');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-12-1988', 'dd-mm-yyyy'), 376, 'Ernie', 'Corporal', 'Hinduism', 'Nolte');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-10-1988', 'dd-mm-yyyy'), 377, 'Malcolm', 'Corporal', 'Hinduism', 'Durning');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-11-2001', 'dd-mm-yyyy'), 378, 'Trick', 'General', 'Taoism', 'Lyonne');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-09-1987', 'dd-mm-yyyy'), 379, 'Karon', 'General', 'Hinduism', 'Schwarzenegger');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-09-2017', 'dd-mm-yyyy'), 380, 'Shawn', 'Private', 'Shinto', 'Boorem');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-06-1986', 'dd-mm-yyyy'), 381, 'Roger', 'Lieutenant', 'Buddhism', 'Keener');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-04-2021', 'dd-mm-yyyy'), 382, 'Vivica', 'Corporal', 'Sikhism', 'Richardson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-01-1988', 'dd-mm-yyyy'), 383, 'Susan', 'General', 'Judaism', 'McDonald');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-10-2013', 'dd-mm-yyyy'), 384, 'Delroy', 'Private', 'Jainism', 'Arkenstone');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-06-2009', 'dd-mm-yyyy'), 385, 'Pam', 'Lieutenant', 'Jainism', 'Dunn');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-04-1999', 'dd-mm-yyyy'), 386, 'Forest', 'Private', 'Bahaai', 'Kirkwood');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-05-1991', 'dd-mm-yyyy'), 387, 'Harold', 'Captain', 'Judaism', 'Lloyd');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-06-2011', 'dd-mm-yyyy'), 388, 'Alex', 'Sergeant', 'Islam', 'Levine');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-06-2019', 'dd-mm-yyyy'), 389, 'Cheech', 'Colonel', 'Taoism', 'Sweet');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-06-1991', 'dd-mm-yyyy'), 390, 'Cledus', 'Corporal', 'Christianity', 'Garcia');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-07-2022', 'dd-mm-yyyy'), 391, 'Eddie', 'Captain', 'Bahaai', 'Scaggs');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-09-2019', 'dd-mm-yyyy'), 392, 'Clea', 'Corporal', 'Shinto', 'Secada');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-12-1993', 'dd-mm-yyyy'), 393, 'Aidan', 'Major', 'Taoism', 'Singletary');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-10-2017', 'dd-mm-yyyy'), 394, 'Vienna', 'Corporal', 'Taoism', 'Ribisi');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-07-1996', 'dd-mm-yyyy'), 395, 'Jonny', 'Sergeant', 'Judaism', 'Idol');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-02-2013', 'dd-mm-yyyy'), 396, 'Garth', 'General', 'Jainism', 'Colman');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-12-1995', 'dd-mm-yyyy'), 397, 'Mekhi', 'General', 'Sikhism', 'Neeson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-11-1992', 'dd-mm-yyyy'), 398, 'Ian', 'General', 'Hinduism', 'Jane');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-06-2004', 'dd-mm-yyyy'), 399, 'Armand', 'Major', 'Shinto', 'Klein');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-09-2002', 'dd-mm-yyyy'), 400, 'Meredith', 'Sergeant', 'Sikhism', 'Tarantino');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-05-2009', 'dd-mm-yyyy'), 401, 'Colleen', 'Sergeant', 'Hinduism', 'Hoffman');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-03-2010', 'dd-mm-yyyy'), 402, 'Delroy', 'Colonel', 'Hinduism', 'Berkley');
commit;
prompt 100 records committed...
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-12-1998', 'dd-mm-yyyy'), 403, 'Rodney', 'Major General', 'Christianity', 'Dern');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-05-1996', 'dd-mm-yyyy'), 404, 'Jennifer', 'Colonel', 'Judaism', 'Shepherd');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-07-1989', 'dd-mm-yyyy'), 405, 'Juliette', 'Lieutenant', 'Sikhism', 'Yankovic');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-01-1993', 'dd-mm-yyyy'), 406, 'Manu', 'Major General', 'Taoism', 'Duschel');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-10-1994', 'dd-mm-yyyy'), 407, 'Adrien', 'Brigadier General', 'Islam', 'Gatlin');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-12-2014', 'dd-mm-yyyy'), 408, 'Tea', 'Colonel', 'Buddhism', 'Williams');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-01-2001', 'dd-mm-yyyy'), 409, 'Dabney', 'General', 'Bahaai', 'McGill');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('31-01-1996', 'dd-mm-yyyy'), 410, 'Aida', 'General', 'Christianity', 'Brandt');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-11-1999', 'dd-mm-yyyy'), 411, 'Harold', 'Major', 'Jainism', 'Spacek');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-03-1991', 'dd-mm-yyyy'), 412, 'Sal', 'Major General', 'Judaism', 'Spacek');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-01-2013', 'dd-mm-yyyy'), 413, 'Vincent', 'Private', 'Christianity', 'Def');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-12-1993', 'dd-mm-yyyy'), 414, 'Dom', 'Sergeant', 'Bahaai', 'Curfman');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-11-1991', 'dd-mm-yyyy'), 415, 'Charlize', 'Captain', 'Buddhism', 'Purefoy');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-05-2010', 'dd-mm-yyyy'), 416, 'Danni', 'Corporal', 'Taoism', 'Sirtis');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-10-2024', 'dd-mm-yyyy'), 417, 'Wendy', 'General', 'Sikhism', 'Hiatt');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-12-1992', 'dd-mm-yyyy'), 418, 'Allison', 'Sergeant', 'Judaism', 'Parker');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-11-1994', 'dd-mm-yyyy'), 419, 'Pierce', 'Private', 'Hinduism', 'Cusack');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-04-1999', 'dd-mm-yyyy'), 420, 'Terri', 'Lieutenant', 'Shinto', 'Nielsen');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-11-1993', 'dd-mm-yyyy'), 421, 'Colin', 'Major General', 'Buddhism', 'Sarandon');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-02-2023', 'dd-mm-yyyy'), 422, 'Bridgette', 'Corporal', 'Taoism', 'Cervine');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-02-2005', 'dd-mm-yyyy'), 423, 'Earl', 'Corporal', 'Taoism', 'Blaine');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-04-2004', 'dd-mm-yyyy'), 424, 'Daryle', 'Brigadier General', 'Buddhism', 'Masur');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-03-2024', 'dd-mm-yyyy'), 425, 'Shelby', 'Major General', 'Taoism', 'Studi');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-10-2008', 'dd-mm-yyyy'), 426, 'Samantha', 'General', 'Shinto', 'Mars');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-09-1995', 'dd-mm-yyyy'), 427, 'Tim', 'Captain', 'Shinto', 'Sartain');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-03-1989', 'dd-mm-yyyy'), 428, 'Heather', 'Captain', 'Taoism', 'Davison');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-01-1996', 'dd-mm-yyyy'), 429, 'Loren', 'Corporal', 'Christianity', 'Rydell');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-11-1990', 'dd-mm-yyyy'), 430, 'Wendy', 'Captain', 'Christianity', 'Buscemi');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-05-2004', 'dd-mm-yyyy'), 431, 'Gladys', 'Captain', 'Bahaai', 'Bening');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-12-2001', 'dd-mm-yyyy'), 432, 'Simon', 'Colonel', 'Islam', 'Tambor');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-07-2009', 'dd-mm-yyyy'), 433, 'Laurie', 'Corporal', 'Christianity', 'Swayze');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-01-2017', 'dd-mm-yyyy'), 434, 'Ming-Na', 'Corporal', 'Buddhism', 'McNarland');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-12-2004', 'dd-mm-yyyy'), 435, 'Yolanda', 'Sergeant', 'Bahaai', 'Berry');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-02-2011', 'dd-mm-yyyy'), 436, 'Vin', 'Sergeant', 'Taoism', 'Reno');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-01-1986', 'dd-mm-yyyy'), 437, 'Tcheky', 'Brigadier General', 'Jainism', 'Phoenix');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-10-1997', 'dd-mm-yyyy'), 438, 'Corey', 'Sergeant', 'Shinto', 'Oldman');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-12-2017', 'dd-mm-yyyy'), 439, 'Dennis', 'Sergeant', 'Shinto', 'Posener');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('31-03-2007', 'dd-mm-yyyy'), 440, 'Kelli', 'Captain', 'Shinto', 'Li');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-10-2014', 'dd-mm-yyyy'), 441, 'Marc', 'Brigadier General', 'Buddhism', 'Goodall');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-03-1993', 'dd-mm-yyyy'), 442, 'Yolanda', 'Captain', 'Shinto', 'Morton');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-08-2022', 'dd-mm-yyyy'), 443, 'Ashley', 'Captain', 'Buddhism', 'Midler');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-03-2002', 'dd-mm-yyyy'), 444, 'Judd', 'Sergeant', 'Jainism', 'Englund');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-11-2000', 'dd-mm-yyyy'), 445, 'Phoebe', 'General', 'Sikhism', 'Mac');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-04-2002', 'dd-mm-yyyy'), 446, 'Rory', 'Captain', 'Judaism', 'Parish');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-07-1989', 'dd-mm-yyyy'), 447, 'Claire', 'Captain', 'Shinto', 'Dunst');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-10-1994', 'dd-mm-yyyy'), 448, 'Emma', 'Corporal', 'Taoism', 'Neuwirth');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-09-1989', 'dd-mm-yyyy'), 449, 'Mac', 'Captain', 'Judaism', 'Reynolds');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-05-2011', 'dd-mm-yyyy'), 450, 'Beth', 'General', 'Jainism', 'Soul');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-08-2006', 'dd-mm-yyyy'), 451, 'Burt', 'General', 'Judaism', 'Curry');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-02-2023', 'dd-mm-yyyy'), 452, 'Cathy', 'Major', 'Hinduism', 'Holiday');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-03-2016', 'dd-mm-yyyy'), 453, 'Nancy', 'Private', 'Bahaai', 'Diaz');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-12-2015', 'dd-mm-yyyy'), 454, 'Seth', 'Captain', 'Judaism', 'Sisto');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-02-2017', 'dd-mm-yyyy'), 455, 'Leo', 'General', 'Islam', 'Rippy');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-09-2001', 'dd-mm-yyyy'), 456, 'Talvin', 'Brigadier General', 'Taoism', 'Heron');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-09-2014', 'dd-mm-yyyy'), 457, 'Mitchell', 'Corporal', 'Judaism', 'Turturro');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-11-2012', 'dd-mm-yyyy'), 458, 'Cheryl', 'Colonel', 'Shinto', 'Schock');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-06-2020', 'dd-mm-yyyy'), 459, 'Anita', 'Major General', 'Hinduism', 'Mueller-Stahl');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-04-1990', 'dd-mm-yyyy'), 460, 'Curt', 'Captain', 'Bahaai', 'Candy');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('31-03-2022', 'dd-mm-yyyy'), 461, 'Temuera', 'Lieutenant', 'Judaism', 'Garber');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-05-2009', 'dd-mm-yyyy'), 462, 'Carlos', 'Sergeant', 'Sikhism', 'McBride');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-07-2000', 'dd-mm-yyyy'), 463, 'Miriam', 'General', 'Buddhism', 'Napolitano');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-09-1987', 'dd-mm-yyyy'), 464, 'Nik', 'Major General', 'Buddhism', 'Karyo');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-06-2022', 'dd-mm-yyyy'), 465, 'Ronny', 'General', 'Christianity', 'Cheadle');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-11-2024', 'dd-mm-yyyy'), 466, 'Lily', 'Major', 'Bahaai', 'Tankard');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-06-2023', 'dd-mm-yyyy'), 467, 'Mekhi', 'Sergeant', 'Shinto', 'Evanswood');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-04-1995', 'dd-mm-yyyy'), 468, 'Viggo', 'Corporal', 'Taoism', 'McCready');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-01-1994', 'dd-mm-yyyy'), 469, 'Larry', 'General', 'Buddhism', 'Arjona');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-03-1996', 'dd-mm-yyyy'), 470, 'Vincent', 'Colonel', 'Christianity', 'Olyphant');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-04-2022', 'dd-mm-yyyy'), 471, 'Keanu', 'Lieutenant', 'Bahaai', 'Utada');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-04-2009', 'dd-mm-yyyy'), 472, 'Arnold', 'Major', 'Judaism', 'Niven');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-02-1998', 'dd-mm-yyyy'), 473, 'Maggie', 'Private', 'Christianity', 'O''Neal');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-05-2011', 'dd-mm-yyyy'), 474, 'Marty', 'Brigadier General', 'Shinto', 'Hopper');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-09-2003', 'dd-mm-yyyy'), 475, 'Nina', 'Major General', 'Sikhism', 'Orton');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-11-2002', 'dd-mm-yyyy'), 476, 'Andrew', 'Lieutenant', 'Sikhism', 'Bullock');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-06-1991', 'dd-mm-yyyy'), 477, 'Greg', 'Lieutenant', 'Hinduism', 'Leoni');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-03-2021', 'dd-mm-yyyy'), 478, 'Scott', 'Major', 'Bahaai', 'Ferry');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-06-2018', 'dd-mm-yyyy'), 479, 'Merillee', 'General', 'Islam', 'Holy');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-02-2007', 'dd-mm-yyyy'), 480, 'Vonda', 'Corporal', 'Buddhism', 'Nicholas');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-05-1998', 'dd-mm-yyyy'), 481, 'Larry', 'Sergeant', 'Judaism', 'Giraldo');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-04-2019', 'dd-mm-yyyy'), 482, 'Fiona', 'Private', 'Hinduism', 'Flemyng');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-01-1987', 'dd-mm-yyyy'), 483, 'Dylan', 'General', 'Christianity', 'Moore');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-06-2019', 'dd-mm-yyyy'), 484, 'Taryn', 'Major General', 'Shinto', 'Branagh');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-06-1998', 'dd-mm-yyyy'), 485, 'Deborah', 'Lieutenant', 'Shinto', 'Orlando');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-08-2015', 'dd-mm-yyyy'), 486, 'Ned', 'Corporal', 'Christianity', 'Sartain');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-07-1989', 'dd-mm-yyyy'), 487, 'Collin', 'Major', 'Buddhism', 'Matheson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-03-2024', 'dd-mm-yyyy'), 488, 'Clive', 'Captain', 'Islam', 'Ranger');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-02-1986', 'dd-mm-yyyy'), 489, 'Vertical', 'Captain', 'Taoism', 'Sartain');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-01-1995', 'dd-mm-yyyy'), 490, 'Rachael', 'Lieutenant', 'Jainism', 'Donovan');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('01-05-2000', 'dd-mm-yyyy'), 491, 'Miko', 'Corporal', 'Shinto', 'Hornsby');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('01-12-1990', 'dd-mm-yyyy'), 492, 'Spike', 'Lieutenant', 'Bahaai', 'Bening');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-11-2007', 'dd-mm-yyyy'), 493, 'Udo', 'Colonel', 'Christianity', 'Weaving');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-10-2023', 'dd-mm-yyyy'), 494, 'Ali', 'Lieutenant', 'Sikhism', 'Snow');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-11-2007', 'dd-mm-yyyy'), 495, 'Rhea', 'Corporal', 'Hinduism', 'Delta');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-10-1997', 'dd-mm-yyyy'), 496, 'Hookah', 'Major General', 'Bahaai', 'Nash');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-04-1990', 'dd-mm-yyyy'), 497, 'Joe', 'Lieutenant', 'Shinto', 'Preston');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-03-2013', 'dd-mm-yyyy'), 498, 'Natacha', 'Colonel', 'Hinduism', 'Leary');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-04-1987', 'dd-mm-yyyy'), 499, 'Zooey', 'Captain', 'Christianity', 'Oakenfold');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-11-2014', 'dd-mm-yyyy'), 500, 'Elizabeth', 'Captain', 'Bahaai', 'Sanchez');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-04-2002', 'dd-mm-yyyy'), 501, 'Sarah', 'Brigadier General', 'Hinduism', 'Reynolds');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-07-2024', 'dd-mm-yyyy'), 502, 'Wade', 'Corporal', 'Buddhism', 'Eldard');
commit;
prompt 200 records committed...
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-03-2023', 'dd-mm-yyyy'), 503, 'Ned', 'Colonel', 'Sikhism', 'Conway');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-04-2021', 'dd-mm-yyyy'), 504, 'Ty', 'Colonel', 'Islam', 'Gryner');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-11-2004', 'dd-mm-yyyy'), 505, 'Ving', 'General', 'Hinduism', 'McIntosh');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-09-2020', 'dd-mm-yyyy'), 506, 'Jackie', 'Captain', 'Judaism', 'DeVito');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-02-1991', 'dd-mm-yyyy'), 507, 'Hilton', 'Lieutenant', 'Jainism', 'Vanian');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-05-2009', 'dd-mm-yyyy'), 508, 'Val', 'Lieutenant', 'Shinto', 'Jones');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-06-2024', 'dd-mm-yyyy'), 509, 'Powers', 'Lieutenant', 'Judaism', 'Vanian');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-11-2006', 'dd-mm-yyyy'), 510, 'Bradley', 'General', 'Sikhism', 'Irons');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-02-2012', 'dd-mm-yyyy'), 511, 'Tamala', 'Major General', 'Shinto', 'Lawrence');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-08-2024', 'dd-mm-yyyy'), 512, 'Ozzy', 'Brigadier General', 'Buddhism', 'Crewson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-07-2016', 'dd-mm-yyyy'), 513, 'Ernest', 'Major General', 'Christianity', 'Paquin');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-09-1991', 'dd-mm-yyyy'), 514, 'Shirley', 'Captain', 'Buddhism', 'Hawthorne');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-11-2016', 'dd-mm-yyyy'), 515, 'Ian', 'Corporal', 'Sikhism', 'Harmon');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-04-2008', 'dd-mm-yyyy'), 516, 'Clarence', 'General', 'Islam', 'Sheen');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-11-1986', 'dd-mm-yyyy'), 517, 'Meg', 'Lieutenant', 'Jainism', 'Red');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-07-1990', 'dd-mm-yyyy'), 518, 'Todd', 'Colonel', 'Jainism', 'Cleary');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-11-2002', 'dd-mm-yyyy'), 519, 'Gena', 'General', 'Hinduism', 'Ribisi');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-09-2001', 'dd-mm-yyyy'), 520, 'Jean-Luc', 'Major General', 'Bahaai', 'Niven');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-12-2005', 'dd-mm-yyyy'), 521, 'Dustin', 'Major General', 'Taoism', 'Furay');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-10-1988', 'dd-mm-yyyy'), 522, 'Goran', 'Major', 'Sikhism', 'Collins');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-06-2004', 'dd-mm-yyyy'), 523, 'Kris', 'Captain', 'Islam', 'Zappacosta');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-07-1990', 'dd-mm-yyyy'), 524, 'Ozzy', 'Colonel', 'Bahaai', 'Melvin');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-05-2001', 'dd-mm-yyyy'), 525, 'Renee', 'General', 'Sikhism', 'Blackwell');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-06-1990', 'dd-mm-yyyy'), 526, 'Joe', 'Captain', 'Hinduism', 'Copeland');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-08-2014', 'dd-mm-yyyy'), 527, 'Bobby', 'Colonel', 'Hinduism', 'Vinton');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-05-2007', 'dd-mm-yyyy'), 528, 'Buffy', 'Major', 'Shinto', 'McDiarmid');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-10-1999', 'dd-mm-yyyy'), 529, 'Joe', 'Colonel', 'Islam', 'McCracken');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-02-2011', 'dd-mm-yyyy'), 530, 'Cameron', 'Brigadier General', 'Jainism', 'Beck');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-04-1988', 'dd-mm-yyyy'), 531, 'Owen', 'Major', 'Christianity', 'Robinson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-06-2024', 'dd-mm-yyyy'), 532, 'Jeffery', 'Brigadier General', 'Hinduism', 'Ranger');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-07-2017', 'dd-mm-yyyy'), 533, 'Leelee', 'General', 'Hinduism', 'Union');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-11-2002', 'dd-mm-yyyy'), 534, 'Garland', 'Private', 'Hinduism', 'Dunst');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-06-1990', 'dd-mm-yyyy'), 535, 'Remy', 'Major', 'Shinto', 'Farina');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-05-2000', 'dd-mm-yyyy'), 536, 'Armin', 'General', 'Taoism', 'Fogerty');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-11-2018', 'dd-mm-yyyy'), 537, 'Karon', 'General', 'Sikhism', 'Conners');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-12-2020', 'dd-mm-yyyy'), 538, 'Olympia', 'Private', 'Buddhism', 'Guilfoyle');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-07-2016', 'dd-mm-yyyy'), 539, 'Alex', 'General', 'Judaism', 'Myers');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-01-2024', 'dd-mm-yyyy'), 540, 'Stockard', 'Lieutenant', 'Taoism', 'Snider');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-08-2020', 'dd-mm-yyyy'), 541, 'Mickey', 'Private', 'Sikhism', 'Fierstein');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-04-2013', 'dd-mm-yyyy'), 542, 'Sean', 'Lieutenant', 'Judaism', 'Ricci');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-08-1994', 'dd-mm-yyyy'), 543, 'Teena', 'Major', 'Islam', 'Tomei');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-10-2000', 'dd-mm-yyyy'), 544, 'Wade', 'Major', 'Shinto', 'Rosas');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-05-1998', 'dd-mm-yyyy'), 545, 'Rosario', 'Brigadier General', 'Judaism', 'Place');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-12-1991', 'dd-mm-yyyy'), 546, 'Eric', 'Lieutenant', 'Sikhism', 'Jonze');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('17-09-2023', 'dd-mm-yyyy'), 547, 'Ceili', 'Private', 'Judaism', 'Detmer');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-02-2015', 'dd-mm-yyyy'), 548, 'Lionel', 'Major General', 'Sikhism', 'Peniston');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-11-2006', 'dd-mm-yyyy'), 549, 'Amy', 'General', 'Shinto', 'Gere');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-09-1987', 'dd-mm-yyyy'), 550, 'Vivica', 'General', 'Judaism', 'Sevenfold');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-08-2013', 'dd-mm-yyyy'), 551, 'Forest', 'Lieutenant', 'Shinto', 'Coe');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-09-2015', 'dd-mm-yyyy'), 552, 'Kathleen', 'General', 'Christianity', 'Spacek');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-09-1993', 'dd-mm-yyyy'), 553, 'Carrie', 'Major', 'Bahaai', 'Deschanel');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-10-2018', 'dd-mm-yyyy'), 554, 'Jodie', 'Major', 'Hinduism', 'Guest');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-07-2007', 'dd-mm-yyyy'), 555, 'Emilio', 'Corporal', 'Hinduism', 'Lavigne');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-07-2013', 'dd-mm-yyyy'), 556, 'Dorry', 'Colonel', 'Hinduism', 'Price');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-05-2010', 'dd-mm-yyyy'), 557, 'Eliza', 'Brigadier General', 'Hinduism', 'Roth');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-11-2002', 'dd-mm-yyyy'), 558, 'Ritchie', 'Sergeant', 'Taoism', 'Caldwell');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('17-04-2022', 'dd-mm-yyyy'), 559, 'Marina', 'Major General', 'Christianity', 'Vega');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-11-2006', 'dd-mm-yyyy'), 560, 'Ahmad', 'Captain', 'Sikhism', 'Mitra');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('31-12-2008', 'dd-mm-yyyy'), 561, 'Freddy', 'Colonel', 'Jainism', 'Clarkson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-10-2018', 'dd-mm-yyyy'), 562, 'Edgar', 'Brigadier General', 'Sikhism', 'Cartlidge');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-04-2004', 'dd-mm-yyyy'), 563, 'Sinead', 'Corporal', 'Sikhism', 'Barrymore');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('01-12-2022', 'dd-mm-yyyy'), 564, 'Neneh', 'Private', 'Islam', 'Orlando');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-11-2024', 'dd-mm-yyyy'), 565, 'Maureen', 'Private', 'Shinto', 'Raye');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-09-2007', 'dd-mm-yyyy'), 566, 'Daniel', 'Lieutenant', 'Christianity', 'Cohn');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-03-2004', 'dd-mm-yyyy'), 567, 'Ted', 'Corporal', 'Buddhism', 'Murphy');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-04-2016', 'dd-mm-yyyy'), 568, 'Natasha', 'Private', 'Judaism', 'Rickman');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-11-1992', 'dd-mm-yyyy'), 569, 'Alannah', 'Lieutenant', 'Christianity', 'Harper');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-11-2002', 'dd-mm-yyyy'), 570, 'Patti', 'Major', 'Islam', 'Miller');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-04-2017', 'dd-mm-yyyy'), 571, 'Jason', 'Sergeant', 'Christianity', 'Gilliam');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-12-1995', 'dd-mm-yyyy'), 572, 'Nik', 'Colonel', 'Taoism', 'Coverdale');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-12-2015', 'dd-mm-yyyy'), 573, 'Larry', 'Corporal', 'Bahaai', 'Shepherd');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-10-1997', 'dd-mm-yyyy'), 574, 'Anjelica', 'Major General', 'Buddhism', 'Cole');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-11-2002', 'dd-mm-yyyy'), 575, 'Eric', 'Sergeant', 'Jainism', 'Briscoe');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-05-2021', 'dd-mm-yyyy'), 576, 'Benicio', 'Captain', 'Christianity', 'Assante');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-04-2003', 'dd-mm-yyyy'), 577, 'Mika', 'Brigadier General', 'Judaism', 'Shearer');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-11-2015', 'dd-mm-yyyy'), 578, 'Henry', 'General', 'Jainism', 'Stigers');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-03-2016', 'dd-mm-yyyy'), 579, 'Joan', 'General', 'Jainism', 'Ronstadt');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-12-1992', 'dd-mm-yyyy'), 580, 'Joely', 'Corporal', 'Islam', 'Morrison');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-02-2023', 'dd-mm-yyyy'), 581, 'Rachid', 'Lieutenant', 'Jainism', 'Li');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-11-2015', 'dd-mm-yyyy'), 582, 'Ewan', 'Sergeant', 'Hinduism', 'Janssen');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-10-2010', 'dd-mm-yyyy'), 583, 'Liev', 'Lieutenant', 'Taoism', 'Davidtz');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-09-1987', 'dd-mm-yyyy'), 584, 'Nanci', 'Corporal', 'Islam', 'Pepper');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-12-1993', 'dd-mm-yyyy'), 585, 'ChantÃƒÆ’Ã‚Â©', 'Colonel', 'Islam', 'Diesel');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-05-2022', 'dd-mm-yyyy'), 586, 'Janeane', 'Corporal', 'Shinto', 'Charles');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-11-2006', 'dd-mm-yyyy'), 587, 'Jeff', 'Sergeant', 'Judaism', 'Horton');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-06-1992', 'dd-mm-yyyy'), 588, 'Chrissie', 'Brigadier General', 'Shinto', 'Rockwell');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('17-10-2001', 'dd-mm-yyyy'), 589, 'Angela', 'Colonel', 'Bahaai', 'Sylvian');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-07-2018', 'dd-mm-yyyy'), 590, 'Wayman', 'Lieutenant', 'Taoism', 'Jeter');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-11-2005', 'dd-mm-yyyy'), 591, 'Arnold', 'Major', 'Sikhism', 'Kimball');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-12-2001', 'dd-mm-yyyy'), 592, 'Christopher', 'Major General', 'Hinduism', 'Cook');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-05-2003', 'dd-mm-yyyy'), 593, 'Ani', 'Major General', 'Jainism', 'Furay');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-01-2008', 'dd-mm-yyyy'), 594, 'Spencer', 'Lieutenant', 'Shinto', 'Harrelson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-05-2016', 'dd-mm-yyyy'), 595, 'Shannyn', 'Brigadier General', 'Jainism', 'Rain');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-10-2014', 'dd-mm-yyyy'), 596, 'Aida', 'Corporal', 'Shinto', 'Posey');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-05-1988', 'dd-mm-yyyy'), 597, 'Geraldine', 'Captain', 'Taoism', 'Murdock');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-04-1999', 'dd-mm-yyyy'), 598, 'Stewart', 'Sergeant', 'Sikhism', 'Everett');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-08-2020', 'dd-mm-yyyy'), 599, 'Graham', 'Corporal', 'Buddhism', 'Conlee');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-06-2017', 'dd-mm-yyyy'), 600, 'Maureen', 'Colonel', 'Buddhism', 'Nightingale');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-06-2004', 'dd-mm-yyyy'), 601, 'Gerald', 'Brigadier General', 'Buddhism', 'Cazale');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-01-1987', 'dd-mm-yyyy'), 602, 'Joseph', 'Brigadier General', 'Sikhism', 'Farrow');
commit;
prompt 300 records committed...
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-02-1992', 'dd-mm-yyyy'), 603, 'Gerald', 'Sergeant', 'Judaism', 'Webb');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-03-2016', 'dd-mm-yyyy'), 604, 'Johnnie', 'Sergeant', 'Bahaai', 'Rucker');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-08-2005', 'dd-mm-yyyy'), 605, 'Murray', 'Captain', 'Jainism', 'Hubbard');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-11-2015', 'dd-mm-yyyy'), 606, 'Carole', 'General', 'Buddhism', 'Snider');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-09-2008', 'dd-mm-yyyy'), 607, 'Elle', 'Brigadier General', 'Taoism', 'McNeice');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-05-1992', 'dd-mm-yyyy'), 608, 'Gilberto', 'General', 'Sikhism', 'Pleasure');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-04-2001', 'dd-mm-yyyy'), 609, 'Rod', 'Captain', 'Hinduism', 'Thorton');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-07-1991', 'dd-mm-yyyy'), 610, 'Gabriel', 'Major General', 'Sikhism', 'Archer');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('17-01-2006', 'dd-mm-yyyy'), 611, 'Ozzy', 'Corporal', 'Sikhism', 'Hingle');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-04-2017', 'dd-mm-yyyy'), 612, 'Stellan', 'Private', 'Islam', 'Kattan');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-03-2018', 'dd-mm-yyyy'), 613, 'Josh', 'Corporal', 'Islam', 'Makowicz');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-02-2006', 'dd-mm-yyyy'), 614, 'Joe', 'Sergeant', 'Buddhism', 'Kleinenberg');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-08-2015', 'dd-mm-yyyy'), 615, 'Nils', 'Sergeant', 'Jainism', 'Tsettos');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-09-1990', 'dd-mm-yyyy'), 616, 'Olga', 'General', 'Sikhism', 'Colon');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-01-2020', 'dd-mm-yyyy'), 617, 'Swoosie', 'Major', 'Hinduism', 'Adler');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-10-2005', 'dd-mm-yyyy'), 618, 'Janeane', 'General', 'Judaism', 'Gere');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-03-2022', 'dd-mm-yyyy'), 619, 'Isaac', 'Lieutenant', 'Islam', 'Mann');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-06-2001', 'dd-mm-yyyy'), 620, 'Guy', 'Major', 'Bahaai', 'Kweller');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-07-2018', 'dd-mm-yyyy'), 621, 'Joe', 'General', 'Hinduism', 'Tobolowsky');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-03-2015', 'dd-mm-yyyy'), 622, 'Kelly', 'Corporal', 'Jainism', 'Diehl');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-03-1992', 'dd-mm-yyyy'), 623, 'Olympia', 'Major General', 'Islam', 'Taha');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-04-2013', 'dd-mm-yyyy'), 624, 'Merrill', 'Private', 'Judaism', 'Stigers');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-10-1995', 'dd-mm-yyyy'), 625, 'Christian', 'Lieutenant', 'Christianity', 'Hirsch');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-10-1999', 'dd-mm-yyyy'), 626, 'Andrew', 'Colonel', 'Judaism', 'Iglesias');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-06-2008', 'dd-mm-yyyy'), 627, 'Kieran', 'Major General', 'Taoism', 'Todd');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-01-2010', 'dd-mm-yyyy'), 628, 'Alan', 'General', 'Christianity', 'Van Helden');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-08-2006', 'dd-mm-yyyy'), 629, 'Colm', 'Lieutenant', 'Sikhism', 'Davidtz');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-04-2016', 'dd-mm-yyyy'), 630, 'Oro', 'Sergeant', 'Jainism', 'Paymer');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-07-1989', 'dd-mm-yyyy'), 631, 'Laurie', 'Private', 'Jainism', 'Johansson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-03-1987', 'dd-mm-yyyy'), 632, 'Brent', 'Major', 'Christianity', 'Lonsdale');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-04-2022', 'dd-mm-yyyy'), 633, 'Gailard', 'Major General', 'Buddhism', 'Garza');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-11-2023', 'dd-mm-yyyy'), 634, 'Rascal', 'Major General', 'Islam', 'DeVito');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-05-2001', 'dd-mm-yyyy'), 635, 'Goran', 'Corporal', 'Sikhism', 'Patrick');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-12-2005', 'dd-mm-yyyy'), 636, 'Jason', 'Lieutenant', 'Taoism', 'Fraser');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-12-2021', 'dd-mm-yyyy'), 637, 'Bobbi', 'Sergeant', 'Islam', 'Pierce');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-12-1986', 'dd-mm-yyyy'), 638, 'Chrissie', 'Brigadier General', 'Christianity', 'Diaz');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-06-1996', 'dd-mm-yyyy'), 639, 'Rascal', 'Major General', 'Buddhism', 'Belles');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-01-1991', 'dd-mm-yyyy'), 640, 'Balthazar', 'Corporal', 'Sikhism', 'Rawls');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-09-1989', 'dd-mm-yyyy'), 641, 'Rosanna', 'Major General', 'Islam', 'Depp');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-05-2013', 'dd-mm-yyyy'), 642, 'Lindsey', 'Captain', 'Christianity', 'Finney');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-01-2008', 'dd-mm-yyyy'), 643, 'Pam', 'Major General', 'Bahaai', 'Harmon');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-12-2012', 'dd-mm-yyyy'), 644, 'Lucinda', 'Sergeant', 'Christianity', 'Vanian');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-05-1992', 'dd-mm-yyyy'), 645, 'Barbara', 'Private', 'Shinto', 'Van Shelton');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-05-2007', 'dd-mm-yyyy'), 646, 'Brooke', 'General', 'Christianity', 'Caan');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-09-2003', 'dd-mm-yyyy'), 647, 'Juliana', 'Sergeant', 'Bahaai', 'Simpson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-08-2015', 'dd-mm-yyyy'), 648, 'Rolando', 'Lieutenant', 'Bahaai', 'Tyler');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-03-2015', 'dd-mm-yyyy'), 649, 'Wesley', 'Colonel', 'Judaism', 'Carlisle');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-03-2005', 'dd-mm-yyyy'), 650, 'John', 'General', 'Jainism', 'Estevez');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-12-2017', 'dd-mm-yyyy'), 651, 'Kate', 'Sergeant', 'Hinduism', 'Beals');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-02-2023', 'dd-mm-yyyy'), 652, 'Wendy', 'Lieutenant', 'Christianity', 'Arnold');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-10-2023', 'dd-mm-yyyy'), 653, 'Nicholas', 'Colonel', 'Sikhism', 'Bean');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-09-1990', 'dd-mm-yyyy'), 654, 'Julie', 'General', 'Shinto', 'Shandling');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-01-2021', 'dd-mm-yyyy'), 655, 'Loren', 'Brigadier General', 'Christianity', 'McDowall');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-03-1999', 'dd-mm-yyyy'), 656, 'Jet', 'Brigadier General', 'Sikhism', 'Holeman');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-08-1987', 'dd-mm-yyyy'), 657, 'Ozzy', 'Major', 'Buddhism', 'Cusack');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-07-1986', 'dd-mm-yyyy'), 658, 'Carolyn', 'Major', 'Christianity', 'Weisz');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-08-2006', 'dd-mm-yyyy'), 659, 'Balthazar', 'General', 'Bahaai', 'Khan');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-02-2024', 'dd-mm-yyyy'), 660, 'Barbara', 'Lieutenant', 'Bahaai', 'Dalton');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-10-2000', 'dd-mm-yyyy'), 661, 'Viggo', 'Brigadier General', 'Bahaai', 'Gambon');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-03-2020', 'dd-mm-yyyy'), 662, 'Cesar', 'Captain', 'Taoism', 'Crystal');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-09-2009', 'dd-mm-yyyy'), 663, 'Angelina', 'Private', 'Bahaai', 'McCoy');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-04-2021', 'dd-mm-yyyy'), 664, 'Radney', 'Sergeant', 'Bahaai', 'Molina');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-10-2022', 'dd-mm-yyyy'), 665, 'Roscoe', 'Corporal', 'Buddhism', 'Scaggs');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-09-1998', 'dd-mm-yyyy'), 666, 'Fiona', 'General', 'Taoism', 'Saxon');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-10-2010', 'dd-mm-yyyy'), 667, 'Wayman', 'Private', 'Christianity', 'Bosco');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-06-1989', 'dd-mm-yyyy'), 668, 'Avenged', 'Lieutenant', 'Sikhism', 'Supernaw');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('17-06-2017', 'dd-mm-yyyy'), 669, 'Laura', 'General', 'Judaism', 'Williamson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-08-2006', 'dd-mm-yyyy'), 670, 'Rene', 'Corporal', 'Christianity', 'Bening');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('01-09-2002', 'dd-mm-yyyy'), 671, 'Frances', 'Major', 'Sikhism', 'Church');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-10-1992', 'dd-mm-yyyy'), 672, 'Joey', 'Corporal', 'Taoism', 'Colton');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-05-1993', 'dd-mm-yyyy'), 673, 'Paul', 'Major', 'Bahaai', 'McElhone');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-03-1991', 'dd-mm-yyyy'), 674, 'Vince', 'Captain', 'Jainism', 'Caviezel');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-01-2001', 'dd-mm-yyyy'), 675, 'Martin', 'Corporal', 'Buddhism', 'Renfro');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-06-1988', 'dd-mm-yyyy'), 676, 'Anjelica', 'Colonel', 'Judaism', 'Ness');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-04-2002', 'dd-mm-yyyy'), 677, 'Nelly', 'Captain', 'Sikhism', 'Forrest');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-01-1991', 'dd-mm-yyyy'), 678, 'Trey', 'Major General', 'Judaism', 'Franklin');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-11-2021', 'dd-mm-yyyy'), 679, 'Rascal', 'General', 'Judaism', 'Carrey');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-01-2010', 'dd-mm-yyyy'), 680, 'Marlon', 'Lieutenant', 'Christianity', 'Dafoe');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-08-2008', 'dd-mm-yyyy'), 681, 'Andre', 'Captain', 'Buddhism', 'Colton');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-08-2008', 'dd-mm-yyyy'), 682, 'Helen', 'Corporal', 'Islam', 'Skerritt');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-12-2019', 'dd-mm-yyyy'), 683, 'Teena', 'Sergeant', 'Judaism', 'Gore');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-10-1986', 'dd-mm-yyyy'), 684, 'Gena', 'Colonel', 'Hinduism', 'Tankard');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('17-12-2017', 'dd-mm-yyyy'), 685, 'Mira', 'Major General', 'Islam', 'Deschanel');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-11-2001', 'dd-mm-yyyy'), 686, 'Lucy', 'Corporal', 'Buddhism', 'Rudd');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-10-1988', 'dd-mm-yyyy'), 687, 'Diane', 'Brigadier General', 'Judaism', 'Bentley');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-10-2010', 'dd-mm-yyyy'), 688, 'Kiefer', 'Colonel', 'Islam', 'Paxton');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-08-2007', 'dd-mm-yyyy'), 689, 'First', 'Major General', 'Taoism', 'Weiss');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-12-2009', 'dd-mm-yyyy'), 690, 'Steven', 'Major', 'Jainism', 'Moraz');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-11-2000', 'dd-mm-yyyy'), 691, 'Brendan', 'Lieutenant', 'Islam', 'Clayton');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-12-1999', 'dd-mm-yyyy'), 692, 'Dennis', 'Sergeant', 'Judaism', 'Hatosy');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('01-12-1987', 'dd-mm-yyyy'), 693, 'Nils', 'Major', 'Buddhism', 'Woodard');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-01-2012', 'dd-mm-yyyy'), 694, 'Maury', 'Sergeant', 'Judaism', 'Hutton');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-07-2017', 'dd-mm-yyyy'), 695, 'King', 'General', 'Christianity', 'Dunn');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-08-2016', 'dd-mm-yyyy'), 696, 'Radney', 'Sergeant', 'Sikhism', 'Remar');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-05-1990', 'dd-mm-yyyy'), 697, 'Ossie', 'Major', 'Judaism', 'Gertner');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-09-2021', 'dd-mm-yyyy'), 698, 'Lenny', 'Captain', 'Christianity', 'Spader');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-11-2008', 'dd-mm-yyyy'), 699, 'Madeleine', 'Corporal', 'Christianity', 'Arthur');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-09-2015', 'dd-mm-yyyy'), 700, 'Angie', 'Lieutenant', 'Judaism', 'Voight');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-10-2020', 'dd-mm-yyyy'), 701, 'Malcolm', 'Colonel', 'Bahaai', 'Duke');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-09-1995', 'dd-mm-yyyy'), 702, 'Dan', 'Sergeant', 'Buddhism', 'Esposito');
commit;
prompt 400 records committed...
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-05-1998', 'dd-mm-yyyy'), 703, 'Armin', 'Private', 'Jainism', 'Palmer');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-04-1988', 'dd-mm-yyyy'), 704, 'Nora', 'Brigadier General', 'Jainism', 'Crosby');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-06-1986', 'dd-mm-yyyy'), 705, 'Cevin', 'Major General', 'Judaism', 'Cotton');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-04-2001', 'dd-mm-yyyy'), 706, 'Melanie', 'Brigadier General', 'Islam', 'Weir');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-11-2005', 'dd-mm-yyyy'), 707, 'Uma', 'Sergeant', 'Jainism', 'Houston');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-09-1996', 'dd-mm-yyyy'), 708, 'Hope', 'Corporal', 'Taoism', 'Burstyn');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-09-2005', 'dd-mm-yyyy'), 709, 'Ricky', 'Major General', 'Bahaai', 'McFadden');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-03-2007', 'dd-mm-yyyy'), 710, 'Randall', 'Major General', 'Taoism', 'Shalhoub');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-03-1993', 'dd-mm-yyyy'), 711, 'Lois', 'General', 'Bahaai', 'LuPone');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-03-1995', 'dd-mm-yyyy'), 712, 'Diane', 'Major', 'Judaism', 'Wen');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-06-1998', 'dd-mm-yyyy'), 713, 'Minnie', 'Major', 'Islam', 'Olyphant');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-11-1994', 'dd-mm-yyyy'), 714, 'Saffron', 'Brigadier General', 'Christianity', 'Hart');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-08-1998', 'dd-mm-yyyy'), 715, 'Orlando', 'Corporal', 'Islam', 'Dutton');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-09-2002', 'dd-mm-yyyy'), 716, 'Tony', 'Private', 'Islam', 'Allison');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-06-1999', 'dd-mm-yyyy'), 717, 'Austin', 'Lieutenant', 'Judaism', 'Bosco');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-10-2008', 'dd-mm-yyyy'), 718, 'Ashton', 'Colonel', 'Christianity', 'Wood');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-10-1999', 'dd-mm-yyyy'), 719, 'Trace', 'Major', 'Bahaai', 'Strathairn');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-09-1997', 'dd-mm-yyyy'), 720, 'Raul', 'Sergeant', 'Shinto', 'Phoenix');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-12-1994', 'dd-mm-yyyy'), 721, 'Vendetta', 'Major General', 'Buddhism', 'Goldblum');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-03-2005', 'dd-mm-yyyy'), 722, 'Harriet', 'General', 'Shinto', 'Caldwell');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-06-2023', 'dd-mm-yyyy'), 723, 'Maria', 'Captain', 'Sikhism', 'Lloyd');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('31-10-2002', 'dd-mm-yyyy'), 724, 'Edwin', 'Major', 'Taoism', 'Chilton');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-07-2002', 'dd-mm-yyyy'), 725, 'Pete', 'Captain', 'Judaism', 'Hynde');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-04-1993', 'dd-mm-yyyy'), 726, 'Rhys', 'Lieutenant', 'Buddhism', 'Rankin');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-06-2020', 'dd-mm-yyyy'), 727, 'Scarlett', 'Lieutenant', 'Bahaai', 'Rifkin');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-06-2021', 'dd-mm-yyyy'), 728, 'Mos', 'Corporal', 'Buddhism', 'Holly');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-05-1995', 'dd-mm-yyyy'), 729, 'Thelma', 'Major General', 'Buddhism', 'Parsons');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-11-1998', 'dd-mm-yyyy'), 730, 'Sheryl', 'General', 'Buddhism', 'Rizzo');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('31-08-2006', 'dd-mm-yyyy'), 731, 'Katie', 'Sergeant', 'Hinduism', 'Pony');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-10-2002', 'dd-mm-yyyy'), 732, 'Dennis', 'Major', 'Shinto', 'Gough');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-11-2019', 'dd-mm-yyyy'), 733, 'Lucy', 'Lieutenant', 'Hinduism', 'English');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('17-11-2011', 'dd-mm-yyyy'), 734, 'Danny', 'Brigadier General', 'Buddhism', 'Choice');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-06-2006', 'dd-mm-yyyy'), 735, 'Rosie', 'General', 'Shinto', 'King');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-05-2022', 'dd-mm-yyyy'), 736, 'Vienna', 'Captain', 'Taoism', 'Chaykin');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-08-2009', 'dd-mm-yyyy'), 737, 'Bridgette', 'Major', 'Shinto', 'Peebles');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('01-03-2013', 'dd-mm-yyyy'), 738, 'Azucar', 'Lieutenant', 'Buddhism', 'Curtis');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-07-2007', 'dd-mm-yyyy'), 739, 'Mika', 'Sergeant', 'Taoism', 'Campbell');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-02-2018', 'dd-mm-yyyy'), 740, 'Keanu', 'General', 'Hinduism', 'Puckett');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-09-2016', 'dd-mm-yyyy'), 741, 'Barbara', 'General', 'Jainism', 'Snow');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-07-1989', 'dd-mm-yyyy'), 742, 'Jimmie', 'Corporal', 'Buddhism', 'Caine');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('01-03-1990', 'dd-mm-yyyy'), 743, 'Bill', 'Captain', 'Christianity', 'Hanley');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-02-1988', 'dd-mm-yyyy'), 744, 'Diamond', 'Captain', 'Judaism', 'Purefoy');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-09-1990', 'dd-mm-yyyy'), 745, 'Lea', 'Lieutenant', 'Buddhism', 'Berkley');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-07-2011', 'dd-mm-yyyy'), 746, 'Garth', 'Corporal', 'Taoism', 'Saucedo');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-04-1996', 'dd-mm-yyyy'), 1, 'Harrison', 'Sergeant', 'Buddhism', 'Rivers');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-05-1993', 'dd-mm-yyyy'), 2, 'Elvis', 'Private', 'Taoism', 'de Lancie');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-05-2004', 'dd-mm-yyyy'), 3, 'Vincent', 'Corporal', 'Buddhism', 'Crudup');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-08-2014', 'dd-mm-yyyy'), 4, 'Gloria', 'Private', 'Bahaai', 'Price');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-11-1991', 'dd-mm-yyyy'), 5, 'Cary', 'Lieutenant', 'Jainism', 'Whitaker');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-12-2003', 'dd-mm-yyyy'), 6, 'Ahmad', 'Lieutenant', 'Buddhism', 'Stills');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-09-2022', 'dd-mm-yyyy'), 7, 'Derrick', 'Captain', 'Taoism', 'Rispoli');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('01-07-2008', 'dd-mm-yyyy'), 8, 'Bridgette', 'Major General', 'Taoism', 'Bancroft');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-01-2008', 'dd-mm-yyyy'), 9, 'Melanie', 'Captain', 'Taoism', 'Ranger');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-11-1997', 'dd-mm-yyyy'), 10, 'Jared', 'Private', 'Judaism', 'Randal');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-01-2009', 'dd-mm-yyyy'), 11, 'Cliff', 'Private', 'Buddhism', 'Lowe');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-11-1988', 'dd-mm-yyyy'), 12, 'Susan', 'General', 'Shinto', 'Osment');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-10-2021', 'dd-mm-yyyy'), 13, 'Art', 'Colonel', 'Taoism', 'Shue');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('17-04-2016', 'dd-mm-yyyy'), 14, 'Chalee', 'Lieutenant', 'Buddhism', 'Holiday');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-03-2022', 'dd-mm-yyyy'), 15, 'Shannon', 'Colonel', 'Shinto', 'Snipes');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-07-2024', 'dd-mm-yyyy'), 16, 'Teri', 'Corporal', 'Buddhism', 'D''Onofrio');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-06-1991', 'dd-mm-yyyy'), 17, 'Goldie', 'Private', 'Bahaai', 'Mason');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('01-07-2001', 'dd-mm-yyyy'), 18, 'Carrie-Anne', 'Brigadier General', 'Jainism', 'Chambers');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-07-1993', 'dd-mm-yyyy'), 19, 'Jose', 'Major General', 'Buddhism', 'Vince');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-02-2001', 'dd-mm-yyyy'), 20, 'Jeremy', 'Lieutenant', 'Buddhism', 'Tilly');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-12-1986', 'dd-mm-yyyy'), 21, 'Danny', 'Sergeant', 'Bahaai', 'Rauhofer');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-11-1989', 'dd-mm-yyyy'), 22, 'Nancy', 'Colonel', 'Judaism', 'Craven');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-01-2006', 'dd-mm-yyyy'), 23, 'Chet', 'Captain', 'Bahaai', 'McNarland');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-02-2014', 'dd-mm-yyyy'), 24, 'Sammy', 'Brigadier General', 'Shinto', 'Weir');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-07-2007', 'dd-mm-yyyy'), 25, 'William', 'Sergeant', 'Christianity', 'MacIsaac');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('17-07-2000', 'dd-mm-yyyy'), 26, 'Gailard', 'Brigadier General', 'Hinduism', 'Cruz');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-07-2012', 'dd-mm-yyyy'), 27, 'Nora', 'Colonel', 'Jainism', 'Folds');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-06-2000', 'dd-mm-yyyy'), 28, 'Bryan', 'Sergeant', 'Hinduism', 'Ammons');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-10-2021', 'dd-mm-yyyy'), 29, 'Jackson', 'Private', 'Jainism', 'Shannon');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-01-2015', 'dd-mm-yyyy'), 30, 'Hilton', 'Corporal', 'Jainism', 'Scott');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('17-07-2008', 'dd-mm-yyyy'), 31, 'Rawlins', 'Lieutenant', 'Sikhism', 'Condition');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-07-2005', 'dd-mm-yyyy'), 32, 'Morris', 'Corporal', 'Buddhism', 'Heron');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-08-2006', 'dd-mm-yyyy'), 33, 'Tommy', 'Colonel', 'Hinduism', 'Winger');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-01-1988', 'dd-mm-yyyy'), 34, 'Lorraine', 'Major', 'Buddhism', 'Furay');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-01-2012', 'dd-mm-yyyy'), 35, 'Burt', 'Captain', 'Jainism', 'Hingle');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-05-1994', 'dd-mm-yyyy'), 36, 'Alec', 'Sergeant', 'Buddhism', 'Gold');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-06-2003', 'dd-mm-yyyy'), 37, 'Harold', 'Colonel', 'Judaism', 'Kinski');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-11-1991', 'dd-mm-yyyy'), 38, 'Nicky', 'Sergeant', 'Judaism', 'Favreau');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-01-1991', 'dd-mm-yyyy'), 39, 'Freda', 'Private', 'Bahaai', 'Brooks');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-10-1999', 'dd-mm-yyyy'), 40, 'Dick', 'Sergeant', 'Jainism', 'Gilliam');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-02-1986', 'dd-mm-yyyy'), 41, 'Jeffery', 'Major', 'Sikhism', 'Reeves');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-04-2024', 'dd-mm-yyyy'), 42, 'Colleen', 'General', 'Shinto', 'DeGraw');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-12-2005', 'dd-mm-yyyy'), 43, 'Tracy', 'Major General', 'Shinto', 'Heche');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-06-2004', 'dd-mm-yyyy'), 44, 'Nastassja', 'Captain', 'Shinto', 'Matthau');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-01-2008', 'dd-mm-yyyy'), 45, 'Anita', 'Private', 'Jainism', 'Sherman');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-04-1994', 'dd-mm-yyyy'), 46, 'Jeanne', 'Colonel', 'Buddhism', 'Scaggs');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-03-1986', 'dd-mm-yyyy'), 47, 'Saffron', 'Lieutenant', 'Christianity', 'Luongo');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-10-2015', 'dd-mm-yyyy'), 48, 'Denis', 'Major', 'Jainism', 'Herndon');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-12-2013', 'dd-mm-yyyy'), 49, 'Loren', 'Lieutenant', 'Sikhism', 'Cross');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-11-2016', 'dd-mm-yyyy'), 50, 'Solomon', 'Brigadier General', 'Judaism', 'Dysart');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-11-2012', 'dd-mm-yyyy'), 51, 'Gin', 'Major', 'Bahaai', 'Devine');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-09-1986', 'dd-mm-yyyy'), 52, 'Regina', 'Brigadier General', 'Judaism', 'Douglas');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-12-1997', 'dd-mm-yyyy'), 53, 'Mili', 'Brigadier General', 'Bahaai', 'Levy');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-03-1993', 'dd-mm-yyyy'), 54, 'Denis', 'Major', 'Buddhism', 'Winger');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('31-01-2001', 'dd-mm-yyyy'), 55, 'Jennifer', 'Major', 'Shinto', 'Getty');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-11-2020', 'dd-mm-yyyy'), 56, 'Fiona', 'Major General', 'Shinto', 'Hirsch');
commit;
prompt 500 records committed...
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-06-1990', 'dd-mm-yyyy'), 57, 'Ron', 'Private', 'Judaism', 'Ford');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-01-1991', 'dd-mm-yyyy'), 58, 'Larry', 'Major General', 'Shinto', 'Dean');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('01-02-2023', 'dd-mm-yyyy'), 59, 'Clea', 'Corporal', 'Christianity', 'Tambor');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-08-1987', 'dd-mm-yyyy'), 60, 'Burt', 'Colonel', 'Taoism', 'Lillard');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-05-1990', 'dd-mm-yyyy'), 61, 'Fiona', 'Sergeant', 'Christianity', 'Ronstadt');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-04-1991', 'dd-mm-yyyy'), 62, 'Sheryl', 'General', 'Taoism', 'Rippy');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-11-1990', 'dd-mm-yyyy'), 63, 'Shelby', 'Major General', 'Buddhism', 'Stiles');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-06-2020', 'dd-mm-yyyy'), 64, 'Kurtwood', 'Lieutenant', 'Judaism', 'Sweet');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-02-2008', 'dd-mm-yyyy'), 65, 'Adam', 'Sergeant', 'Taoism', 'Cusack');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-07-1991', 'dd-mm-yyyy'), 66, 'Miranda', 'Corporal', 'Judaism', 'Quinlan');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-02-1998', 'dd-mm-yyyy'), 67, 'Taylor', 'Sergeant', 'Shinto', 'Garza');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-07-1990', 'dd-mm-yyyy'), 68, 'Willie', 'Colonel', 'Judaism', 'Sawa');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-07-2003', 'dd-mm-yyyy'), 69, 'Tzi', 'Major General', 'Buddhism', 'Slater');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-10-2023', 'dd-mm-yyyy'), 70, 'Harvey', 'Major', 'Judaism', 'Starr');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-03-2020', 'dd-mm-yyyy'), 71, 'Davy', 'General', 'Islam', 'Phoenix');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-05-1993', 'dd-mm-yyyy'), 72, 'Claire', 'Private', 'Jainism', 'Lightfoot');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-03-2021', 'dd-mm-yyyy'), 73, 'Brad', 'Brigadier General', 'Sikhism', 'Whitaker');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-02-2007', 'dd-mm-yyyy'), 74, 'Lucy', 'Sergeant', 'Taoism', 'Cumming');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-10-2018', 'dd-mm-yyyy'), 75, 'Marisa', 'Colonel', 'Islam', 'Hawke');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-04-1999', 'dd-mm-yyyy'), 76, 'Stellan', 'Sergeant', 'Christianity', 'Melvin');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-01-2015', 'dd-mm-yyyy'), 77, 'Dennis', 'Sergeant', 'Christianity', 'Parsons');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('17-04-1986', 'dd-mm-yyyy'), 78, 'Trace', 'Corporal', 'Sikhism', 'Plimpton');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-04-1988', 'dd-mm-yyyy'), 79, 'Nicolas', 'Captain', 'Sikhism', 'Bright');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-10-2024', 'dd-mm-yyyy'), 80, 'Mitchell', 'Major General', 'Jainism', 'Reno');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('17-06-1995', 'dd-mm-yyyy'), 81, 'George', 'Private', 'Shinto', 'Pony');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-02-1994', 'dd-mm-yyyy'), 82, 'Leo', 'Colonel', 'Hinduism', 'Hedaya');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-09-1996', 'dd-mm-yyyy'), 83, 'Aidan', 'General', 'Jainism', 'Gough');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-04-2006', 'dd-mm-yyyy'), 84, 'Harrison', 'General', 'Buddhism', 'Griffin');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-10-2010', 'dd-mm-yyyy'), 85, 'Marina', 'Private', 'Jainism', 'Ali');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-07-1991', 'dd-mm-yyyy'), 86, 'Melanie', 'Lieutenant', 'Jainism', 'Balaban');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-12-2009', 'dd-mm-yyyy'), 87, 'Joe', 'Corporal', 'Buddhism', 'Emmerich');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-04-2013', 'dd-mm-yyyy'), 88, 'Brittany', 'Colonel', 'Jainism', 'Hedaya');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-02-1992', 'dd-mm-yyyy'), 89, 'Anjelica', 'Major General', 'Sikhism', 'Caan');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-07-2000', 'dd-mm-yyyy'), 90, 'Meredith', 'Lieutenant', 'Taoism', 'Kadison');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-11-2002', 'dd-mm-yyyy'), 91, 'Kevn', 'Sergeant', 'Taoism', 'Keaton');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-09-2002', 'dd-mm-yyyy'), 92, 'Jet', 'Sergeant', 'Judaism', 'Goodman');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-05-2006', 'dd-mm-yyyy'), 93, 'Derrick', 'Major', 'Buddhism', 'Moreno');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-12-2006', 'dd-mm-yyyy'), 94, 'Zooey', 'Private', 'Shinto', 'Withers');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-07-2008', 'dd-mm-yyyy'), 95, 'Javon', 'Captain', 'Bahaai', 'McCann');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-04-2003', 'dd-mm-yyyy'), 96, 'Ricky', 'Corporal', 'Sikhism', 'Giraldo');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-03-1991', 'dd-mm-yyyy'), 97, 'Ted', 'Private', 'Taoism', 'Biggs');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-02-2000', 'dd-mm-yyyy'), 98, 'Jennifer', 'Sergeant', 'Jainism', 'McDormand');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('17-08-2003', 'dd-mm-yyyy'), 99, 'Juice', 'Captain', 'Shinto', 'Cassidy');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-12-1990', 'dd-mm-yyyy'), 100, 'Bill', 'Colonel', 'Buddhism', 'Osment');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-11-2003', 'dd-mm-yyyy'), 101, 'Donald', 'Sergeant', 'Sikhism', 'Boyle');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-04-2021', 'dd-mm-yyyy'), 102, 'Geggy', 'Major General', 'Bahaai', 'Robbins');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-08-2004', 'dd-mm-yyyy'), 103, 'First', 'Lieutenant', 'Islam', 'Gambon');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-05-2013', 'dd-mm-yyyy'), 104, 'Harvey', 'Colonel', 'Taoism', 'Fogerty');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-12-1999', 'dd-mm-yyyy'), 105, 'Trey', 'Private', 'Shinto', 'Sanders');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-09-2020', 'dd-mm-yyyy'), 106, 'Liev', 'Captain', 'Shinto', 'Dillane');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-05-2018', 'dd-mm-yyyy'), 107, 'Harold', 'Major', 'Jainism', 'Blackmore');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-03-1999', 'dd-mm-yyyy'), 108, 'Chalee', 'Captain', 'Hinduism', 'Dreyfuss');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-03-1998', 'dd-mm-yyyy'), 109, 'Radney', 'Corporal', 'Sikhism', 'Nolte');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-04-1999', 'dd-mm-yyyy'), 110, 'Tia', 'Private', 'Islam', 'Waits');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('17-09-2006', 'dd-mm-yyyy'), 111, 'Kitty', 'Colonel', 'Sikhism', 'McCready');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-10-2023', 'dd-mm-yyyy'), 112, 'Annie', 'General', 'Islam', 'Neville');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-03-2017', 'dd-mm-yyyy'), 113, 'Steven', 'General', 'Islam', 'Curry');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-05-2022', 'dd-mm-yyyy'), 114, 'Aaron', 'Captain', 'Islam', 'Vai');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-02-1997', 'dd-mm-yyyy'), 115, 'Angela', 'Captain', 'Shinto', 'Callow');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-02-2021', 'dd-mm-yyyy'), 116, 'Marley', 'Colonel', 'Buddhism', 'Ammons');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-05-1997', 'dd-mm-yyyy'), 117, 'Gene', 'Major General', 'Taoism', 'McDonnell');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-11-2013', 'dd-mm-yyyy'), 118, 'Alessandro', 'Lieutenant', 'Shinto', 'Costello');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-06-2011', 'dd-mm-yyyy'), 119, 'Hex', 'Captain', 'Shinto', 'Pitney');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-11-2003', 'dd-mm-yyyy'), 120, 'Dennis', 'Major General', 'Buddhism', 'Diaz');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('31-05-2010', 'dd-mm-yyyy'), 121, 'Edie', 'General', 'Judaism', 'McGoohan');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-11-1991', 'dd-mm-yyyy'), 122, 'Dave', 'Lieutenant', 'Sikhism', 'Krabbe');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-06-2002', 'dd-mm-yyyy'), 123, 'Bridgette', 'Private', 'Hinduism', 'Adler');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-05-1996', 'dd-mm-yyyy'), 124, 'Casey', 'Sergeant', 'Taoism', 'Washington');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-06-2014', 'dd-mm-yyyy'), 125, 'Adam', 'Lieutenant', 'Shinto', 'Rains');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('01-09-2010', 'dd-mm-yyyy'), 126, 'Lonnie', 'Lieutenant', 'Christianity', 'O''Hara');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-05-1997', 'dd-mm-yyyy'), 127, 'Brian', 'Colonel', 'Buddhism', 'Paige');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-05-2021', 'dd-mm-yyyy'), 128, 'Karen', 'Brigadier General', 'Islam', 'Jane');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-06-2021', 'dd-mm-yyyy'), 129, 'Vern', 'Private', 'Jainism', 'Michaels');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-07-2020', 'dd-mm-yyyy'), 130, 'Carole', 'General', 'Bahaai', 'Bandy');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-07-1994', 'dd-mm-yyyy'), 131, 'Guy', 'General', 'Shinto', 'Schiff');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-09-1988', 'dd-mm-yyyy'), 132, 'Rhona', 'Lieutenant', 'Judaism', 'Hubbard');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-10-1994', 'dd-mm-yyyy'), 133, 'Thin', 'Sergeant', 'Islam', 'Howard');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-06-2023', 'dd-mm-yyyy'), 134, 'Vanessa', 'Brigadier General', 'Jainism', 'Weiss');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-04-1988', 'dd-mm-yyyy'), 135, 'Armand', 'Major General', 'Bahaai', 'Finn');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-02-2002', 'dd-mm-yyyy'), 136, 'Rolando', 'Colonel', 'Shinto', 'Brock');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-10-2011', 'dd-mm-yyyy'), 137, 'Gino', 'Colonel', 'Bahaai', 'McKean');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-06-2013', 'dd-mm-yyyy'), 138, 'Sheena', 'Sergeant', 'Taoism', 'Ingram');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-06-1998', 'dd-mm-yyyy'), 139, 'Dustin', 'Lieutenant', 'Taoism', 'Gaines');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-09-2015', 'dd-mm-yyyy'), 140, 'Geoffrey', 'Sergeant', 'Shinto', 'Holiday');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-10-1988', 'dd-mm-yyyy'), 141, 'Lauren', 'Colonel', 'Buddhism', 'Phifer');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-05-2021', 'dd-mm-yyyy'), 142, 'Dermot', 'Lieutenant', 'Islam', 'McDiarmid');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-04-1993', 'dd-mm-yyyy'), 143, 'Allison', 'Private', 'Taoism', 'Connelly');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-01-2000', 'dd-mm-yyyy'), 144, 'Bridget', 'Lieutenant', 'Islam', 'Malone');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-09-1992', 'dd-mm-yyyy'), 145, 'Andrea', 'Major', 'Taoism', 'Curtis-Hall');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-04-2006', 'dd-mm-yyyy'), 146, 'Glenn', 'Colonel', 'Hinduism', 'Drive');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-07-1991', 'dd-mm-yyyy'), 147, 'Howard', 'Private', 'Christianity', 'Cornell');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-10-1997', 'dd-mm-yyyy'), 148, 'Marlon', 'Lieutenant', 'Sikhism', 'Stormare');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-03-1986', 'dd-mm-yyyy'), 149, 'Gin', 'Private', 'Jainism', 'Sherman');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-11-2011', 'dd-mm-yyyy'), 150, 'Kyle', 'Lieutenant', 'Judaism', 'Affleck');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-11-2016', 'dd-mm-yyyy'), 151, 'Kirk', 'Lieutenant', 'Christianity', 'Koyana');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-10-2000', 'dd-mm-yyyy'), 152, 'Burt', 'Major', 'Sikhism', 'Swayze');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-02-2012', 'dd-mm-yyyy'), 153, 'Brenda', 'Major General', 'Bahaai', 'Garr');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-07-1996', 'dd-mm-yyyy'), 154, 'Mira', 'Colonel', 'Shinto', 'Heslov');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-01-2017', 'dd-mm-yyyy'), 155, 'Cloris', 'Corporal', 'Jainism', 'Scheider');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-10-2021', 'dd-mm-yyyy'), 156, 'Heath', 'Captain', 'Taoism', 'Chappelle');
commit;
prompt 600 records committed...
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-03-1996', 'dd-mm-yyyy'), 157, 'Carlos', 'Captain', 'Christianity', 'Collette');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-05-2010', 'dd-mm-yyyy'), 158, 'Aida', 'Major', 'Christianity', 'Drive');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-11-2022', 'dd-mm-yyyy'), 159, 'Christine', 'Sergeant', 'Christianity', 'Mellencamp');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-06-2001', 'dd-mm-yyyy'), 160, 'Maria', 'Brigadier General', 'Hinduism', 'Wong');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-12-1996', 'dd-mm-yyyy'), 161, 'Tony', 'Lieutenant', 'Taoism', 'Glover');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('01-12-1991', 'dd-mm-yyyy'), 162, 'Ewan', 'General', 'Buddhism', 'Dunst');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-12-2017', 'dd-mm-yyyy'), 163, 'Jimmy', 'Brigadier General', 'Christianity', 'Cockburn');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-06-2021', 'dd-mm-yyyy'), 164, 'Gabriel', 'General', 'Taoism', 'Imbruglia');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-07-2023', 'dd-mm-yyyy'), 165, 'Spencer', 'Major General', 'Christianity', 'Ferry');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('01-01-1992', 'dd-mm-yyyy'), 166, 'Nikka', 'Major', 'Shinto', 'Cherry');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-02-2008', 'dd-mm-yyyy'), 167, 'Bridget', 'Corporal', 'Taoism', 'Lofgren');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-04-2014', 'dd-mm-yyyy'), 168, 'Steve', 'General', 'Judaism', 'Tinsley');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-03-1998', 'dd-mm-yyyy'), 169, 'Minnie', 'Colonel', 'Shinto', 'Payton');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-09-2002', 'dd-mm-yyyy'), 170, 'Beth', 'Captain', 'Taoism', 'Head');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-02-2014', 'dd-mm-yyyy'), 171, 'Dean', 'Corporal', 'Judaism', 'Griffiths');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('17-06-2007', 'dd-mm-yyyy'), 172, 'Kirk', 'General', 'Taoism', 'Gough');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-06-2016', 'dd-mm-yyyy'), 173, 'Diane', 'Colonel', 'Islam', 'Landau');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('01-08-2021', 'dd-mm-yyyy'), 174, 'Etta', 'Private', 'Bahaai', 'Wincott');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-11-1990', 'dd-mm-yyyy'), 175, 'Laura', 'Colonel', 'Buddhism', 'Bugnon');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-02-1995', 'dd-mm-yyyy'), 176, 'Lara', 'Major', 'Hinduism', 'Caine');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-12-2018', 'dd-mm-yyyy'), 177, 'Blair', 'Major', 'Hinduism', 'Pleasure');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-01-2017', 'dd-mm-yyyy'), 178, 'Boz', 'Colonel', 'Christianity', 'Serbedzija');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-03-1999', 'dd-mm-yyyy'), 179, 'Jerry', 'Private', 'Shinto', 'Atlas');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-08-1986', 'dd-mm-yyyy'), 180, 'Colleen', 'General', 'Sikhism', 'Leary');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-06-2023', 'dd-mm-yyyy'), 181, 'Jet', 'Corporal', 'Sikhism', 'Li');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-10-2015', 'dd-mm-yyyy'), 182, 'Jessica', 'Major', 'Jainism', 'Skarsgard');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('01-10-1991', 'dd-mm-yyyy'), 183, 'Gene', 'Colonel', 'Bahaai', 'Berkoff');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-01-2008', 'dd-mm-yyyy'), 184, 'Martha', 'General', 'Islam', 'Vance');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-11-2010', 'dd-mm-yyyy'), 185, 'Chrissie', 'General', 'Christianity', 'Stone');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-12-1997', 'dd-mm-yyyy'), 186, 'Edward', 'Captain', 'Christianity', 'Silverman');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-03-1986', 'dd-mm-yyyy'), 187, 'Susan', 'Brigadier General', 'Judaism', 'Lapointe');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-05-2001', 'dd-mm-yyyy'), 188, 'Maria', 'Major General', 'Islam', 'Cleary');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-09-2009', 'dd-mm-yyyy'), 189, 'Tara', 'Major General', 'Judaism', 'Pesci');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-01-1995', 'dd-mm-yyyy'), 190, 'Delbert', 'Captain', 'Buddhism', 'Laurie');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-07-2007', 'dd-mm-yyyy'), 191, 'Laura', 'Sergeant', 'Shinto', 'Teng');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-07-2002', 'dd-mm-yyyy'), 192, 'Belinda', 'Brigadier General', 'Jainism', 'Torn');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-02-1999', 'dd-mm-yyyy'), 193, 'Chuck', 'Sergeant', 'Hinduism', 'Dooley');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-08-2019', 'dd-mm-yyyy'), 194, 'Ruth', 'Major', 'Jainism', 'Hurley');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-01-2007', 'dd-mm-yyyy'), 195, 'April', 'Colonel', 'Islam', 'Spears');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-06-2015', 'dd-mm-yyyy'), 196, 'Lloyd', 'Colonel', 'Shinto', 'Weston');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-10-1998', 'dd-mm-yyyy'), 197, 'First', 'Captain', 'Taoism', 'Garfunkel');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-03-2006', 'dd-mm-yyyy'), 198, 'Chaka', 'Major General', 'Buddhism', 'Sewell');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-08-2016', 'dd-mm-yyyy'), 199, 'Dean', 'Captain', 'Sikhism', 'Lapointe');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-07-2022', 'dd-mm-yyyy'), 200, 'Jill', 'Colonel', 'Taoism', 'Herndon');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-08-1986', 'dd-mm-yyyy'), 201, 'Famke', 'Captain', 'Jainism', 'Garza');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-06-1996', 'dd-mm-yyyy'), 202, 'Maggie', 'Private', 'Bahaai', 'Devine');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-02-1987', 'dd-mm-yyyy'), 203, 'Brad', 'Lieutenant', 'Sikhism', 'Quinn');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-01-1997', 'dd-mm-yyyy'), 204, 'Willem', 'Brigadier General', 'Bahaai', 'Reiner');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-01-1992', 'dd-mm-yyyy'), 205, 'Emmylou', 'Major', 'Sikhism', 'Hewett');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-04-1989', 'dd-mm-yyyy'), 206, 'Bradley', 'Corporal', 'Bahaai', 'Quinlan');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-11-2015', 'dd-mm-yyyy'), 207, 'Bo', 'Brigadier General', 'Taoism', 'Payne');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-11-1987', 'dd-mm-yyyy'), 208, 'Alex', 'Colonel', 'Taoism', 'Boyle');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-06-1986', 'dd-mm-yyyy'), 209, 'Sheena', 'Major', 'Judaism', 'Chesnutt');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-10-2018', 'dd-mm-yyyy'), 210, 'Allan', 'Lieutenant', 'Taoism', 'Barrymore');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-08-2003', 'dd-mm-yyyy'), 211, 'Thelma', 'Captain', 'Jainism', 'Wheel');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-02-2004', 'dd-mm-yyyy'), 212, 'Rowan', 'General', 'Judaism', 'Guilfoyle');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-01-2017', 'dd-mm-yyyy'), 213, 'Nicole', 'Major General', 'Shinto', 'Napolitano');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('01-08-2017', 'dd-mm-yyyy'), 214, 'Bob', 'Captain', 'Hinduism', 'Seagal');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('01-10-2011', 'dd-mm-yyyy'), 215, 'Howard', 'Major', 'Islam', 'Kennedy');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-02-1986', 'dd-mm-yyyy'), 216, 'Brenda', 'Major', 'Hinduism', 'Mifune');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-03-1989', 'dd-mm-yyyy'), 217, 'Bruce', 'Major General', 'Jainism', 'Platt');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-05-2009', 'dd-mm-yyyy'), 218, 'Bernie', 'General', 'Buddhism', 'Tilly');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-04-1989', 'dd-mm-yyyy'), 219, 'Edward', 'Corporal', 'Bahaai', 'Bale');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-06-1999', 'dd-mm-yyyy'), 220, 'Joanna', 'Major', 'Jainism', 'McNeice');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-12-1993', 'dd-mm-yyyy'), 221, 'Jaime', 'Sergeant', 'Bahaai', 'Salt');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('17-10-2012', 'dd-mm-yyyy'), 222, 'Rene', 'Major', 'Islam', 'Hauser');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-06-2003', 'dd-mm-yyyy'), 223, 'Robert', 'Brigadier General', 'Judaism', 'Chesnutt');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-10-2020', 'dd-mm-yyyy'), 224, 'Phoebe', 'Private', 'Bahaai', 'Finn');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-11-2019', 'dd-mm-yyyy'), 225, 'Julie', 'Private', 'Sikhism', 'Ramirez');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-07-2024', 'dd-mm-yyyy'), 226, 'Walter', 'Major General', 'Sikhism', 'Raybon');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-10-2014', 'dd-mm-yyyy'), 227, 'Sander', 'Major', 'Judaism', 'Goodall');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-05-2019', 'dd-mm-yyyy'), 228, 'Collective', 'Captain', 'Hinduism', 'Chesnutt');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-02-2003', 'dd-mm-yyyy'), 229, 'Max', 'Captain', 'Sikhism', 'Gray');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-12-1989', 'dd-mm-yyyy'), 230, 'Sinead', 'Colonel', 'Buddhism', 'David');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-05-1998', 'dd-mm-yyyy'), 231, 'Gabriel', 'Brigadier General', 'Judaism', 'Eastwood');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-01-1995', 'dd-mm-yyyy'), 232, 'Roddy', 'Lieutenant', 'Jainism', 'Tate');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-04-2012', 'dd-mm-yyyy'), 233, 'Matthew', 'Captain', 'Judaism', 'Reinhold');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-08-1993', 'dd-mm-yyyy'), 234, 'Nicholas', 'General', 'Judaism', 'McNarland');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-08-2017', 'dd-mm-yyyy'), 235, 'Madeleine', 'Private', 'Judaism', 'Feore');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-02-1993', 'dd-mm-yyyy'), 236, 'Curtis', 'General', 'Bahaai', 'Northam');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-04-2019', 'dd-mm-yyyy'), 237, 'Sonny', 'Colonel', 'Christianity', 'Leary');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-11-2011', 'dd-mm-yyyy'), 238, 'Dean', 'Sergeant', 'Sikhism', 'Potter');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-09-2019', 'dd-mm-yyyy'), 239, 'Elle', 'Private', 'Taoism', 'Freeman');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-03-2011', 'dd-mm-yyyy'), 240, 'Charlie', 'Major', 'Islam', 'Greene');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-01-2008', 'dd-mm-yyyy'), 241, 'Oliver', 'Colonel', 'Shinto', 'Hudson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-06-1986', 'dd-mm-yyyy'), 242, 'Ernest', 'Corporal', 'Jainism', 'Henstridge');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-02-1991', 'dd-mm-yyyy'), 243, 'Vin', 'Lieutenant', 'Jainism', 'Carradine');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-06-1994', 'dd-mm-yyyy'), 244, 'Queen', 'Corporal', 'Judaism', 'Santa Rosa');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-07-2009', 'dd-mm-yyyy'), 245, 'Jet', 'Corporal', 'Sikhism', 'Guinness');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-08-2009', 'dd-mm-yyyy'), 246, 'Shannon', 'Major General', 'Buddhism', 'Sandler');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-01-1990', 'dd-mm-yyyy'), 247, 'Jill', 'Private', 'Hinduism', 'Feuerstein');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-08-2008', 'dd-mm-yyyy'), 248, 'Gabrielle', 'Sergeant', 'Buddhism', 'Scaggs');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-09-2015', 'dd-mm-yyyy'), 249, 'Louise', 'Sergeant', 'Hinduism', 'Englund');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-11-1995', 'dd-mm-yyyy'), 250, 'Adina', 'Major', 'Jainism', 'Duke');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-11-2010', 'dd-mm-yyyy'), 251, 'Debra', 'Major', 'Hinduism', 'Place');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-06-1988', 'dd-mm-yyyy'), 252, 'Parker', 'Captain', 'Jainism', 'Klugh');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-04-2003', 'dd-mm-yyyy'), 253, 'Judy', 'Sergeant', 'Christianity', 'Morrison');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-09-2014', 'dd-mm-yyyy'), 254, 'Rickie', 'Sergeant', 'Hinduism', 'Condition');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-08-1997', 'dd-mm-yyyy'), 255, 'Chely', 'Sergeant', 'Bahaai', 'Bello');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-06-1989', 'dd-mm-yyyy'), 256, 'Kate', 'Brigadier General', 'Taoism', 'Harrison');
commit;
prompt 700 records committed...
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-06-2000', 'dd-mm-yyyy'), 257, 'Doug', 'General', 'Jainism', 'Pacino');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-09-2015', 'dd-mm-yyyy'), 258, 'Ed', 'Sergeant', 'Shinto', 'Hirsch');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-08-2019', 'dd-mm-yyyy'), 259, 'Timothy', 'Sergeant', 'Hinduism', 'Weller');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-04-2009', 'dd-mm-yyyy'), 260, 'Jim', 'General', 'Christianity', 'Baker');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-07-2019', 'dd-mm-yyyy'), 261, 'Louise', 'General', 'Islam', 'Hornsby');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-11-2023', 'dd-mm-yyyy'), 262, 'Lynette', 'Sergeant', 'Bahaai', 'Gordon');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-06-2009', 'dd-mm-yyyy'), 263, 'Jill', 'Captain', 'Hinduism', 'Koteas');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-11-2012', 'dd-mm-yyyy'), 264, 'Patrick', 'Major', 'Jainism', 'Gaines');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-06-2001', 'dd-mm-yyyy'), 265, 'Bob', 'Private', 'Islam', 'Butler');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-01-2023', 'dd-mm-yyyy'), 266, 'Janice', 'Major', 'Sikhism', 'Nicholson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('31-05-1994', 'dd-mm-yyyy'), 267, 'Halle', 'Major General', 'Bahaai', 'Dooley');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-02-1990', 'dd-mm-yyyy'), 268, 'Rutger', 'Brigadier General', 'Hinduism', 'Lennix');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-06-2005', 'dd-mm-yyyy'), 269, 'Wendy', 'Lieutenant', 'Bahaai', 'Maxwell');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-11-2001', 'dd-mm-yyyy'), 270, 'Rosco', 'Private', 'Hinduism', 'Brando');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-05-2005', 'dd-mm-yyyy'), 271, 'Hope', 'Sergeant', 'Islam', 'Kimball');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-07-1996', 'dd-mm-yyyy'), 272, 'Julianne', 'Private', 'Jainism', 'Yulin');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-11-1989', 'dd-mm-yyyy'), 273, 'Keanu', 'Major', 'Bahaai', 'Taha');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-12-2021', 'dd-mm-yyyy'), 274, 'Gin', 'Captain', 'Buddhism', 'Glover');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-03-1990', 'dd-mm-yyyy'), 275, 'Brothers', 'Brigadier General', 'Sikhism', 'LaMond');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-05-2024', 'dd-mm-yyyy'), 276, 'Suzi', 'Corporal', 'Islam', 'Austin');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-01-2022', 'dd-mm-yyyy'), 277, 'Edward', 'Sergeant', 'Buddhism', 'Buffalo');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-12-2023', 'dd-mm-yyyy'), 278, 'Ed', 'Sergeant', 'Judaism', 'Idol');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-11-1988', 'dd-mm-yyyy'), 279, 'Grant', 'General', 'Bahaai', 'Quinlan');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('17-08-1988', 'dd-mm-yyyy'), 280, 'Kristin', 'Corporal', 'Christianity', 'Atkinson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-11-2010', 'dd-mm-yyyy'), 281, 'Emm', 'General', 'Jainism', 'Zane');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-07-1991', 'dd-mm-yyyy'), 282, 'Rebecca', 'Brigadier General', 'Taoism', 'Biehn');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-05-2019', 'dd-mm-yyyy'), 283, 'Lizzy', 'Lieutenant', 'Buddhism', 'Byrd');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-07-2004', 'dd-mm-yyyy'), 284, 'Juan', 'Major', 'Jainism', 'Coward');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-02-2012', 'dd-mm-yyyy'), 285, 'Nina', 'Corporal', 'Buddhism', 'Bonneville');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-03-2011', 'dd-mm-yyyy'), 286, 'Veruca', 'General', 'Bahaai', 'Harrelson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-10-1989', 'dd-mm-yyyy'), 287, 'Javon', 'Lieutenant', 'Islam', 'Hamilton');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-05-2013', 'dd-mm-yyyy'), 288, 'Brittany', 'Colonel', 'Jainism', 'Li');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-08-1987', 'dd-mm-yyyy'), 289, 'Gabrielle', 'Colonel', 'Bahaai', 'Hawke');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-09-2012', 'dd-mm-yyyy'), 290, 'Lili', 'Corporal', 'Christianity', 'Orlando');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-08-2002', 'dd-mm-yyyy'), 291, 'Rachid', 'Captain', 'Taoism', 'Schreiber');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-10-2005', 'dd-mm-yyyy'), 292, 'Hookah', 'Major General', 'Hinduism', 'MacPherson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-11-2009', 'dd-mm-yyyy'), 293, 'Chaka', 'Sergeant', 'Christianity', 'Richter');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-01-1994', 'dd-mm-yyyy'), 294, 'Brenda', 'Captain', 'Jainism', 'Alexander');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-01-2021', 'dd-mm-yyyy'), 295, 'Robbie', 'Corporal', 'Jainism', 'Gracie');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-10-1996', 'dd-mm-yyyy'), 296, 'Jeremy', 'Sergeant', 'Taoism', 'Esposito');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-04-2005', 'dd-mm-yyyy'), 297, 'Brenda', 'Major General', 'Islam', 'Macht');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-06-1987', 'dd-mm-yyyy'), 298, 'Miranda', 'Private', 'Shinto', 'Bancroft');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-11-2023', 'dd-mm-yyyy'), 299, 'Suzi', 'Lieutenant', 'Hinduism', 'Carlton');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-10-2007', 'dd-mm-yyyy'), 300, 'Reese', 'Captain', 'Islam', 'Colin Young');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('17-10-2011', 'dd-mm-yyyy'), 301, 'Gena', 'Major', 'Taoism', 'Brando');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-10-2008', 'dd-mm-yyyy'), 302, 'Merillee', 'Corporal', 'Taoism', 'Diaz');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-01-1986', 'dd-mm-yyyy'), 747, 'Terence', 'Lieutenant', 'Jainism', 'Tilly');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-04-2011', 'dd-mm-yyyy'), 748, 'Kid', 'Major General', 'Bahaai', 'Peniston');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-01-2004', 'dd-mm-yyyy'), 749, 'Freddy', 'Brigadier General', 'Christianity', 'Trevino');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('01-08-1991', 'dd-mm-yyyy'), 750, 'Omar', 'Colonel', 'Islam', 'Malkovich');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('17-02-2015', 'dd-mm-yyyy'), 751, 'Lesley', 'Colonel', 'Hinduism', 'Oszajca');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-09-2002', 'dd-mm-yyyy'), 752, 'Balthazar', 'Major', 'Christianity', 'Miles');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-03-1994', 'dd-mm-yyyy'), 753, 'Emm', 'Private', 'Hinduism', 'Lofgren');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-09-1995', 'dd-mm-yyyy'), 754, 'Vin', 'Lieutenant', 'Bahaai', 'Checker');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-07-1992', 'dd-mm-yyyy'), 755, 'Aaron', 'Major', 'Islam', 'Wilder');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-10-1986', 'dd-mm-yyyy'), 756, 'Meg', 'Sergeant', 'Jainism', 'Browne');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-01-2019', 'dd-mm-yyyy'), 757, 'Merrilee', 'Major General', 'Taoism', 'Bryson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-04-2005', 'dd-mm-yyyy'), 758, 'Edwin', 'Private', 'Christianity', 'D''Onofrio');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-05-2019', 'dd-mm-yyyy'), 759, 'Aidan', 'Colonel', 'Christianity', 'Vince');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-01-2002', 'dd-mm-yyyy'), 760, 'Lauren', 'Corporal', 'Hinduism', 'Rauhofer');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-02-1999', 'dd-mm-yyyy'), 761, 'Freda', 'Private', 'Judaism', 'Lofgren');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-02-2022', 'dd-mm-yyyy'), 762, 'Hilary', 'General', 'Hinduism', 'Jackson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-07-1998', 'dd-mm-yyyy'), 763, 'Sean', 'Colonel', 'Shinto', 'Peet');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-10-2010', 'dd-mm-yyyy'), 764, 'Oded', 'Lieutenant', 'Islam', 'Hartnett');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-08-2000', 'dd-mm-yyyy'), 765, 'Lizzy', 'Brigadier General', 'Buddhism', 'Kapanka');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-03-2016', 'dd-mm-yyyy'), 766, 'Christina', 'Lieutenant', 'Islam', 'Connick');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-08-2023', 'dd-mm-yyyy'), 767, 'Blair', 'Brigadier General', 'Jainism', 'Knight');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-05-1999', 'dd-mm-yyyy'), 768, 'Eric', 'Colonel', 'Taoism', 'Lange');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-12-2013', 'dd-mm-yyyy'), 769, 'Demi', 'Major General', 'Taoism', 'De Almeida');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-09-2006', 'dd-mm-yyyy'), 770, 'Angela', 'Corporal', 'Hinduism', 'Gosdin');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-10-1993', 'dd-mm-yyyy'), 771, 'Bernard', 'Private', 'Buddhism', 'Head');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('17-07-1999', 'dd-mm-yyyy'), 772, 'Vendetta', 'Major', 'Jainism', 'Ruiz');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-02-1989', 'dd-mm-yyyy'), 773, 'Joely', 'Private', 'Shinto', 'Guinness');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-04-1989', 'dd-mm-yyyy'), 774, 'Tracy', 'Sergeant', 'Judaism', 'Kier');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-06-2000', 'dd-mm-yyyy'), 775, 'Lindsay', 'Lieutenant', 'Judaism', 'Lizzy');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-08-2001', 'dd-mm-yyyy'), 776, 'Mary-Louise', 'Private', 'Hinduism', 'Playboys');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-06-1999', 'dd-mm-yyyy'), 777, 'Gil', 'Brigadier General', 'Buddhism', 'Satriani');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-04-2019', 'dd-mm-yyyy'), 778, 'Chi', 'Colonel', 'Buddhism', 'Lang');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-09-1997', 'dd-mm-yyyy'), 779, 'Glen', 'Lieutenant', 'Taoism', 'Pollack');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-11-2016', 'dd-mm-yyyy'), 780, 'Alannah', 'Brigadier General', 'Judaism', 'Nakai');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-06-1987', 'dd-mm-yyyy'), 781, 'Michelle', 'Captain', 'Sikhism', 'Rhymes');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-06-1989', 'dd-mm-yyyy'), 782, 'Willie', 'Private', 'Shinto', 'Sylvian');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-08-2008', 'dd-mm-yyyy'), 783, 'Matthew', 'Lieutenant', 'Hinduism', 'Conlee');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-11-2005', 'dd-mm-yyyy'), 784, 'Darren', 'Colonel', 'Taoism', 'Polito');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-05-1999', 'dd-mm-yyyy'), 785, 'Holly', 'Corporal', 'Bahaai', 'Brock');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-05-2015', 'dd-mm-yyyy'), 786, 'Heather', 'Lieutenant', 'Bahaai', 'Iglesias');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-05-2024', 'dd-mm-yyyy'), 787, 'Andrea', 'General', 'Hinduism', 'Pierce');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-02-1989', 'dd-mm-yyyy'), 788, 'Katrin', 'Sergeant', 'Bahaai', 'Portman');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-04-1990', 'dd-mm-yyyy'), 789, 'Dorry', 'Lieutenant', 'Christianity', 'Murphy');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-11-2011', 'dd-mm-yyyy'), 790, 'Robby', 'Major General', 'Islam', 'Stampley');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-05-2008', 'dd-mm-yyyy'), 791, 'Brittany', 'Brigadier General', 'Bahaai', 'Dale');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-03-1998', 'dd-mm-yyyy'), 792, 'Sarah', 'Major', 'Islam', 'Kudrow');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-10-2009', 'dd-mm-yyyy'), 793, 'Rowan', 'General', 'Taoism', 'Lofgren');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-02-2018', 'dd-mm-yyyy'), 794, 'Brian', 'Lieutenant', 'Judaism', 'Fender');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-09-2001', 'dd-mm-yyyy'), 795, 'Oded', 'General', 'Shinto', 'Schwarzenegger');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-10-2007', 'dd-mm-yyyy'), 796, 'Reese', 'Major General', 'Buddhism', 'O''Sullivan');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-04-1986', 'dd-mm-yyyy'), 797, 'James', 'Colonel', 'Jainism', 'Vance');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-08-1989', 'dd-mm-yyyy'), 798, 'Alfie', 'Brigadier General', 'Judaism', 'Carrey');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-07-2020', 'dd-mm-yyyy'), 799, 'Temuera', 'Lieutenant', 'Bahaai', 'Pollack');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-08-1994', 'dd-mm-yyyy'), 800, 'Ossie', 'Sergeant', 'Taoism', 'Stanley');
commit;
prompt 800 records committed...
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-11-2016', 'dd-mm-yyyy'), 801, 'Maury', 'General', 'Buddhism', 'Griffith');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-02-2011', 'dd-mm-yyyy'), 802, 'Nanci', 'Brigadier General', 'Jainism', 'Streep');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-11-1994', 'dd-mm-yyyy'), 803, 'Thin', 'Major General', 'Hinduism', 'Morse');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-05-2010', 'dd-mm-yyyy'), 804, 'Zooey', 'Lieutenant', 'Jainism', 'Kapanka');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-08-2011', 'dd-mm-yyyy'), 805, 'Dave', 'Colonel', 'Buddhism', 'Nightingale');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-05-2019', 'dd-mm-yyyy'), 806, 'Edgar', 'Sergeant', 'Shinto', 'Travolta');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-03-2005', 'dd-mm-yyyy'), 807, 'Junior', 'Corporal', 'Sikhism', 'Karyo');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-04-2005', 'dd-mm-yyyy'), 808, 'Sheryl', 'Major', 'Islam', 'Ramis');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-07-2007', 'dd-mm-yyyy'), 809, 'Oliver', 'Major', 'Christianity', 'Dillon');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-07-2008', 'dd-mm-yyyy'), 810, 'Jude', 'Private', 'Judaism', 'Hawkins');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-08-1993', 'dd-mm-yyyy'), 811, 'Rhea', 'Major', 'Jainism', 'Kershaw');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('31-08-2009', 'dd-mm-yyyy'), 812, 'Latin', 'Sergeant', 'Jainism', 'Van Helden');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-11-2020', 'dd-mm-yyyy'), 813, 'Armand', 'Brigadier General', 'Sikhism', 'Gershon');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-11-2022', 'dd-mm-yyyy'), 814, 'Samantha', 'Major', 'Bahaai', 'Mraz');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-12-2005', 'dd-mm-yyyy'), 815, 'Freda', 'Brigadier General', 'Bahaai', 'Cotton');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-05-2002', 'dd-mm-yyyy'), 816, 'Wally', 'Sergeant', 'Christianity', 'Idol');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-12-1992', 'dd-mm-yyyy'), 817, 'Taryn', 'Brigadier General', 'Islam', 'Brolin');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-05-1991', 'dd-mm-yyyy'), 818, 'Miguel', 'Private', 'Sikhism', 'Posener');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-02-2004', 'dd-mm-yyyy'), 819, 'Spencer', 'Major General', 'Jainism', 'Rizzo');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-09-2013', 'dd-mm-yyyy'), 820, 'Penelope', 'Colonel', 'Shinto', 'Hannah');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-01-2004', 'dd-mm-yyyy'), 821, 'Morgan', 'Major General', 'Islam', 'Stiers');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-06-2016', 'dd-mm-yyyy'), 822, 'Debby', 'Colonel', 'Jainism', 'Dern');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-11-2013', 'dd-mm-yyyy'), 823, 'Isabella', 'Lieutenant', 'Islam', 'McIntyre');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('31-08-2006', 'dd-mm-yyyy'), 824, 'Larenz', 'General', 'Islam', 'Blair');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-06-2004', 'dd-mm-yyyy'), 825, 'Isaac', 'Brigadier General', 'Sikhism', 'Everett');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-06-2021', 'dd-mm-yyyy'), 826, 'Roger', 'Private', 'Sikhism', 'Dolenz');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-08-2016', 'dd-mm-yyyy'), 827, 'Annie', 'Lieutenant', 'Jainism', 'Dunn');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-10-1986', 'dd-mm-yyyy'), 828, 'Sylvester', 'Major', 'Judaism', 'Dillon');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-03-1998', 'dd-mm-yyyy'), 829, 'Olga', 'Sergeant', 'Jainism', 'Levin');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-05-2011', 'dd-mm-yyyy'), 830, 'Fairuza', 'Captain', 'Shinto', 'Beckinsale');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-05-2019', 'dd-mm-yyyy'), 831, 'Arturo', 'Major General', 'Sikhism', 'Dourif');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-08-2020', 'dd-mm-yyyy'), 832, 'Embeth', 'Sergeant', 'Hinduism', 'Zane');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-03-2024', 'dd-mm-yyyy'), 833, 'Ty', 'Sergeant', 'Taoism', 'Cattrall');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-02-1988', 'dd-mm-yyyy'), 834, 'Joey', 'Sergeant', 'Christianity', 'Durning');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-09-2004', 'dd-mm-yyyy'), 835, 'Freddie', 'Lieutenant', 'Shinto', 'Askew');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-05-2008', 'dd-mm-yyyy'), 836, 'Manu', 'General', 'Hinduism', 'Shaye');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-04-1995', 'dd-mm-yyyy'), 837, 'Roddy', 'Colonel', 'Christianity', 'Harrelson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-03-2015', 'dd-mm-yyyy'), 838, 'Kirk', 'Colonel', 'Jainism', 'Delta');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-08-2017', 'dd-mm-yyyy'), 839, 'Jeremy', 'Corporal', 'Bahaai', 'Deejay');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-03-2003', 'dd-mm-yyyy'), 840, 'Stellan', 'Lieutenant', 'Taoism', 'Favreau');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-09-2005', 'dd-mm-yyyy'), 841, 'Hookah', 'Major', 'Sikhism', 'Quinones');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-07-1999', 'dd-mm-yyyy'), 842, 'Ellen', 'General', 'Buddhism', 'Tyson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-07-1995', 'dd-mm-yyyy'), 843, 'Simon', 'Lieutenant', 'Jainism', 'Emmerich');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-01-2005', 'dd-mm-yyyy'), 844, 'Jimmy', 'Brigadier General', 'Sikhism', 'Bean');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-05-2017', 'dd-mm-yyyy'), 845, 'Earl', 'Major General', 'Taoism', 'Brock');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-03-2015', 'dd-mm-yyyy'), 846, 'Sandra', 'Major General', 'Sikhism', 'Plummer');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-07-2006', 'dd-mm-yyyy'), 847, 'Jaime', 'Corporal', 'Taoism', 'McCormack');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-09-2002', 'dd-mm-yyyy'), 848, 'Bill', 'Colonel', 'Hinduism', 'Green');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-09-2023', 'dd-mm-yyyy'), 849, 'Vienna', 'Private', 'Shinto', 'Bancroft');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-03-2017', 'dd-mm-yyyy'), 850, 'Christine', 'General', 'Shinto', 'Reeves');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-03-2015', 'dd-mm-yyyy'), 851, 'Bret', 'Lieutenant', 'Taoism', 'Bale');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-11-1991', 'dd-mm-yyyy'), 852, 'Tobey', 'Sergeant', 'Jainism', 'Gill');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-05-2009', 'dd-mm-yyyy'), 853, 'Famke', 'Major', 'Shinto', 'Spader');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-01-2023', 'dd-mm-yyyy'), 854, 'Isaac', 'Major General', 'Hinduism', 'Sampson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-08-2016', 'dd-mm-yyyy'), 855, 'Gates', 'Major General', 'Hinduism', 'Paquin');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-09-2019', 'dd-mm-yyyy'), 856, 'Aida', 'Corporal', 'Christianity', 'Lovitz');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('01-03-2007', 'dd-mm-yyyy'), 857, 'Aida', 'Colonel', 'Hinduism', 'Gooding');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-09-2018', 'dd-mm-yyyy'), 858, 'Chubby', 'Private', 'Taoism', 'Reeve');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-06-1988', 'dd-mm-yyyy'), 859, 'Murray', 'Captain', 'Jainism', 'Mars');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-12-2004', 'dd-mm-yyyy'), 860, 'Rachel', 'Major', 'Judaism', 'Lowe');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-11-2016', 'dd-mm-yyyy'), 861, 'Shirley', 'Private', 'Bahaai', 'Rhodes');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-09-2024', 'dd-mm-yyyy'), 862, 'Brad', 'Colonel', 'Taoism', 'Dillon');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-04-2016', 'dd-mm-yyyy'), 863, 'Steven', 'Captain', 'Christianity', 'Ellis');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-05-1988', 'dd-mm-yyyy'), 864, 'Steve', 'Corporal', 'Judaism', 'Sandler');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-06-1991', 'dd-mm-yyyy'), 865, 'Gabrielle', 'Major General', 'Taoism', 'Arthur');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-08-1987', 'dd-mm-yyyy'), 866, 'Cheryl', 'Captain', 'Sikhism', 'Azaria');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-05-2020', 'dd-mm-yyyy'), 867, 'Pierce', 'Colonel', 'Judaism', 'Morrison');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-01-1996', 'dd-mm-yyyy'), 868, 'Johnnie', 'Brigadier General', 'Bahaai', 'Sizemore');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-02-1986', 'dd-mm-yyyy'), 869, 'Alessandro', 'Private', 'Taoism', 'Katt');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-01-1991', 'dd-mm-yyyy'), 870, 'Tea', 'Private', 'Christianity', 'Wong');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-06-2005', 'dd-mm-yyyy'), 871, 'Caroline', 'Lieutenant', 'Bahaai', 'Jay');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-06-1995', 'dd-mm-yyyy'), 872, 'Ann', 'Lieutenant', 'Hinduism', 'LaMond');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-11-1992', 'dd-mm-yyyy'), 873, 'Barbara', 'Colonel', 'Buddhism', 'Lucas');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-05-2003', 'dd-mm-yyyy'), 874, 'Giancarlo', 'Lieutenant', 'Sikhism', 'Bailey');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-07-2008', 'dd-mm-yyyy'), 875, 'Chalee', 'General', 'Shinto', 'Marx');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-03-2004', 'dd-mm-yyyy'), 876, 'Eliza', 'Private', 'Christianity', 'Stoltz');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-06-2005', 'dd-mm-yyyy'), 877, 'Ricardo', 'Major', 'Islam', 'Cleese');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('31-12-1987', 'dd-mm-yyyy'), 878, 'Chaka', 'Major', 'Bahaai', 'Frampton');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-09-2022', 'dd-mm-yyyy'), 879, 'Hex', 'Sergeant', 'Shinto', 'Furtado');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-09-1993', 'dd-mm-yyyy'), 880, 'Cuba', 'Sergeant', 'Bahaai', 'Crowell');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-01-2012', 'dd-mm-yyyy'), 881, 'Debby', 'Captain', 'Sikhism', 'Swinton');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('01-11-2001', 'dd-mm-yyyy'), 882, 'Maceo', 'Colonel', 'Bahaai', 'Farris');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-01-1988', 'dd-mm-yyyy'), 883, 'Melanie', 'Major', 'Jainism', 'David');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-07-2016', 'dd-mm-yyyy'), 884, 'Geoff', 'Sergeant', 'Bahaai', 'Romijn-Stamos');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-07-2012', 'dd-mm-yyyy'), 885, 'Pete', 'Private', 'Shinto', 'Sinise');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-05-1997', 'dd-mm-yyyy'), 886, 'Gerald', 'Sergeant', 'Sikhism', 'Quinones');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-08-1990', 'dd-mm-yyyy'), 887, 'Ian', 'Sergeant', 'Hinduism', 'Moorer');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-05-1986', 'dd-mm-yyyy'), 888, 'Brendan', 'Sergeant', 'Jainism', 'Mathis');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-10-2010', 'dd-mm-yyyy'), 889, 'Lucy', 'Brigadier General', 'Christianity', 'DiCaprio');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-01-1987', 'dd-mm-yyyy'), 890, 'Matt', 'Colonel', 'Taoism', 'Renfro');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-12-2001', 'dd-mm-yyyy'), 891, 'Gordie', 'Corporal', 'Judaism', 'Mars');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-02-1988', 'dd-mm-yyyy'), 892, 'Dustin', 'Lieutenant', 'Hinduism', 'Greenwood');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-01-2021', 'dd-mm-yyyy'), 893, 'Aidan', 'General', 'Bahaai', 'Sweet');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-01-1993', 'dd-mm-yyyy'), 894, 'Bradley', 'Major General', 'Buddhism', 'Esposito');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-03-2020', 'dd-mm-yyyy'), 895, 'Jann', 'Major', 'Bahaai', 'Arthur');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-11-2018', 'dd-mm-yyyy'), 896, 'Jim', 'Lieutenant', 'Jainism', 'Feuerstein');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-03-2018', 'dd-mm-yyyy'), 897, 'Isaiah', 'Captain', 'Bahaai', 'Weisz');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-01-1992', 'dd-mm-yyyy'), 898, 'Sinead', 'Brigadier General', 'Buddhism', 'Pierce');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-02-2003', 'dd-mm-yyyy'), 899, 'Ceili', 'Captain', 'Hinduism', 'Ferrell');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-02-2020', 'dd-mm-yyyy'), 900, 'Trey', 'Lieutenant', 'Taoism', 'Gooding');
commit;
prompt 900 records committed...
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-08-2008', 'dd-mm-yyyy'), 901, 'Sandra', 'Captain', 'Hinduism', 'Young');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-07-2000', 'dd-mm-yyyy'), 902, 'Morris', 'Brigadier General', 'Buddhism', 'Lavigne');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-06-2007', 'dd-mm-yyyy'), 903, 'Jake', 'Major', 'Jainism', 'Gano');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-08-2016', 'dd-mm-yyyy'), 904, 'Claude', 'Captain', 'Jainism', 'Browne');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-07-2014', 'dd-mm-yyyy'), 905, 'Jonathan', 'General', 'Taoism', 'Tillis');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-02-2022', 'dd-mm-yyyy'), 906, 'Fisher', 'Corporal', 'Bahaai', 'Culkin');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-05-2021', 'dd-mm-yyyy'), 907, 'Andrew', 'Brigadier General', 'Jainism', 'Bruce');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-06-1994', 'dd-mm-yyyy'), 908, 'Pete', 'Major', 'Judaism', 'Numan');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-06-2011', 'dd-mm-yyyy'), 909, 'Terri', 'Colonel', 'Christianity', 'Gyllenhaal');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-12-2021', 'dd-mm-yyyy'), 910, 'Jesus', 'Corporal', 'Shinto', 'Thurman');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-07-2001', 'dd-mm-yyyy'), 911, 'Frank', 'General', 'Judaism', 'Irons');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-03-2016', 'dd-mm-yyyy'), 912, 'Uma', 'Private', 'Judaism', 'Sedgwick');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-07-2022', 'dd-mm-yyyy'), 913, 'Sammy', 'Lieutenant', 'Sikhism', 'Banderas');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-07-2020', 'dd-mm-yyyy'), 914, 'Willie', 'Private', 'Christianity', 'Carrey');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-12-2011', 'dd-mm-yyyy'), 915, 'Sally', 'Colonel', 'Christianity', 'Shue');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-12-1990', 'dd-mm-yyyy'), 916, 'Tori', 'Major', 'Bahaai', 'Pollack');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-12-1997', 'dd-mm-yyyy'), 917, 'Tramaine', 'Lieutenant', 'Buddhism', 'Eder');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-08-2022', 'dd-mm-yyyy'), 918, 'Avenged', 'Major General', 'Taoism', 'Alexander');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-03-2020', 'dd-mm-yyyy'), 919, 'Frederic', 'Major', 'Christianity', 'Cohn');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-08-2007', 'dd-mm-yyyy'), 920, 'Campbell', 'Brigadier General', 'Shinto', 'Leary');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-05-2016', 'dd-mm-yyyy'), 921, 'Cheryl', 'Major', 'Hinduism', 'Hidalgo');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-10-2011', 'dd-mm-yyyy'), 922, 'Julianne', 'Corporal', 'Shinto', 'Rankin');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-06-2008', 'dd-mm-yyyy'), 923, 'Neneh', 'Corporal', 'Sikhism', 'Idol');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-05-2004', 'dd-mm-yyyy'), 924, 'Joy', 'Corporal', 'Christianity', 'Union');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-08-1987', 'dd-mm-yyyy'), 925, 'Ann', 'General', 'Sikhism', 'Snider');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-10-2016', 'dd-mm-yyyy'), 926, 'Lena', 'Private', 'Buddhism', 'Adams');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-10-2013', 'dd-mm-yyyy'), 927, 'Garry', 'General', 'Bahaai', 'Shand');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-06-2014', 'dd-mm-yyyy'), 928, 'Rosanne', 'Private', 'Islam', 'Paltrow');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-09-1997', 'dd-mm-yyyy'), 929, 'Hugh', 'Sergeant', 'Islam', 'Gary');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-01-1994', 'dd-mm-yyyy'), 930, 'Arnold', 'Sergeant', 'Shinto', 'Sevigny');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-02-1995', 'dd-mm-yyyy'), 931, 'Penelope', 'Colonel', 'Buddhism', 'Puckett');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-11-2015', 'dd-mm-yyyy'), 932, 'Carole', 'Corporal', 'Buddhism', 'Burmester');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-01-1988', 'dd-mm-yyyy'), 933, 'Machine', 'Colonel', 'Judaism', 'Elwes');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-12-2019', 'dd-mm-yyyy'), 934, 'Claude', 'Lieutenant', 'Christianity', 'Stormare');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-12-2016', 'dd-mm-yyyy'), 935, 'Gabrielle', 'Private', 'Judaism', 'Nicks');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-05-2019', 'dd-mm-yyyy'), 936, 'Lee', 'General', 'Judaism', 'Lennox');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-04-2007', 'dd-mm-yyyy'), 937, 'Glenn', 'Captain', 'Taoism', 'Almond');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-08-2009', 'dd-mm-yyyy'), 938, 'Mary-Louise', 'Colonel', 'Sikhism', 'Hoffman');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-04-2006', 'dd-mm-yyyy'), 939, 'Seth', 'Major General', 'Judaism', 'Whitford');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-01-1988', 'dd-mm-yyyy'), 940, 'Rosanna', 'General', 'Buddhism', 'Beatty');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-04-2021', 'dd-mm-yyyy'), 941, 'Natalie', 'Major General', 'Islam', 'Eat World');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-12-2022', 'dd-mm-yyyy'), 942, 'Arnold', 'General', 'Islam', 'Cooper');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-10-2019', 'dd-mm-yyyy'), 943, 'Temuera', 'Private', 'Buddhism', 'Bates');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-05-2009', 'dd-mm-yyyy'), 944, 'Thora', 'Brigadier General', 'Christianity', 'Crouse');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-06-1991', 'dd-mm-yyyy'), 945, 'Kirsten', 'Captain', 'Taoism', 'Haggard');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-12-2002', 'dd-mm-yyyy'), 946, 'Nastassja', 'Brigadier General', 'Christianity', 'Black');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-06-2023', 'dd-mm-yyyy'), 947, 'Jean-Claude', 'Colonel', 'Judaism', 'Diehl');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-11-2018', 'dd-mm-yyyy'), 948, 'Janice', 'Sergeant', 'Shinto', 'Brooke');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-01-2007', 'dd-mm-yyyy'), 949, 'Anthony', 'Major', 'Jainism', 'Secada');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-10-1987', 'dd-mm-yyyy'), 950, 'Nik', 'Sergeant', 'Hinduism', 'Giannini');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-12-1987', 'dd-mm-yyyy'), 951, 'Tal', 'Private', 'Islam', 'Murdock');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-12-2023', 'dd-mm-yyyy'), 952, 'Ronny', 'Sergeant', 'Hinduism', 'Forrest');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-07-1993', 'dd-mm-yyyy'), 953, 'Neve', 'Corporal', 'Taoism', 'Eldard');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-10-2012', 'dd-mm-yyyy'), 954, 'Spike', 'Corporal', 'Shinto', 'Perlman');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-07-2020', 'dd-mm-yyyy'), 955, 'Davy', 'Sergeant', 'Judaism', 'Palminteri');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-09-1990', 'dd-mm-yyyy'), 956, 'Oliver', 'Lieutenant', 'Hinduism', 'Shalhoub');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-08-2008', 'dd-mm-yyyy'), 957, 'Micky', 'Major General', 'Sikhism', 'Emmerich');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-07-2021', 'dd-mm-yyyy'), 958, 'Frankie', 'Captain', 'Christianity', 'Lapointe');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-08-1992', 'dd-mm-yyyy'), 959, 'Stellan', 'Captain', 'Hinduism', 'Blackwell');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-09-2009', 'dd-mm-yyyy'), 960, 'Roberta', 'Private', 'Shinto', 'Drive');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-07-2006', 'dd-mm-yyyy'), 961, 'Walter', 'Lieutenant', 'Islam', 'Witherspoon');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-09-1996', 'dd-mm-yyyy'), 962, 'Jon', 'Colonel', 'Islam', 'Visnjic');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-07-2002', 'dd-mm-yyyy'), 963, 'Drew', 'General', 'Judaism', 'Isaak');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-02-2002', 'dd-mm-yyyy'), 964, 'Rich', 'Major General', 'Sikhism', 'Ramis');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-04-2023', 'dd-mm-yyyy'), 965, 'Rowan', 'Major General', 'Buddhism', 'Shandling');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-04-1987', 'dd-mm-yyyy'), 966, 'Robert', 'Brigadier General', 'Sikhism', 'Washington');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-06-2020', 'dd-mm-yyyy'), 967, 'Warren', 'General', 'Buddhism', 'Rivers');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-09-1990', 'dd-mm-yyyy'), 968, 'Tcheky', 'Sergeant', 'Taoism', 'Robinson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-09-1993', 'dd-mm-yyyy'), 969, 'Johnnie', 'Captain', 'Judaism', 'Akins');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-07-1988', 'dd-mm-yyyy'), 970, 'Lynn', 'Private', 'Sikhism', 'Chilton');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-03-1997', 'dd-mm-yyyy'), 971, 'Rupert', 'Colonel', 'Hinduism', 'May');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-03-2022', 'dd-mm-yyyy'), 972, 'Melanie', 'Brigadier General', 'Jainism', 'Browne');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-09-2018', 'dd-mm-yyyy'), 973, 'Tea', 'Captain', 'Hinduism', 'Buffalo');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-10-1994', 'dd-mm-yyyy'), 974, 'Sam', 'Corporal', 'Jainism', 'Chappelle');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-02-2011', 'dd-mm-yyyy'), 975, 'Lin', 'General', 'Jainism', 'Gertner');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-10-2005', 'dd-mm-yyyy'), 976, 'Merillee', 'General', 'Islam', 'Kweller');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-03-1999', 'dd-mm-yyyy'), 977, 'John', 'Sergeant', 'Shinto', 'Crosby');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-01-2006', 'dd-mm-yyyy'), 978, 'Harris', 'Private', 'Shinto', 'Twilley');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-02-2001', 'dd-mm-yyyy'), 979, 'Kurtwood', 'Captain', 'Taoism', 'Mueller-Stahl');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-08-2014', 'dd-mm-yyyy'), 980, 'Clea', 'Sergeant', 'Jainism', 'Rhymes');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-10-2020', 'dd-mm-yyyy'), 981, 'Katrin', 'Sergeant', 'Judaism', 'Fraser');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-04-2016', 'dd-mm-yyyy'), 982, 'Judy', 'Lieutenant', 'Bahaai', 'de Lancie');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-11-2003', 'dd-mm-yyyy'), 983, 'Cameron', 'Private', 'Hinduism', 'Tyler');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-08-2010', 'dd-mm-yyyy'), 984, 'Isaiah', 'Major', 'Taoism', 'McKean');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-01-1998', 'dd-mm-yyyy'), 985, 'Derrick', 'Lieutenant', 'Buddhism', 'Cruise');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-02-2018', 'dd-mm-yyyy'), 986, 'Peabo', 'Private', 'Christianity', 'Carrack');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-09-1995', 'dd-mm-yyyy'), 987, 'Garth', 'General', 'Buddhism', 'Campbell');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-01-1987', 'dd-mm-yyyy'), 988, 'Judi', 'Lieutenant', 'Buddhism', 'Balin');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-04-2018', 'dd-mm-yyyy'), 989, 'Emmylou', 'Sergeant', 'Shinto', 'Loggins');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-01-1992', 'dd-mm-yyyy'), 990, 'Raymond', 'Major General', 'Shinto', 'Charles');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-11-2003', 'dd-mm-yyyy'), 991, 'Ann', 'Corporal', 'Taoism', 'Dorn');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-06-2015', 'dd-mm-yyyy'), 992, 'Christmas', 'Corporal', 'Christianity', 'Kurtz');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-09-1992', 'dd-mm-yyyy'), 993, 'Gordon', 'Major General', 'Sikhism', 'Cube');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-05-2013', 'dd-mm-yyyy'), 994, 'Darren', 'Lieutenant', 'Christianity', 'Murdock');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-09-1995', 'dd-mm-yyyy'), 995, 'Pam', 'General', 'Taoism', 'Rydell');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-03-2003', 'dd-mm-yyyy'), 996, 'Jean-Luc', 'General', 'Judaism', 'Richter');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-12-1996', 'dd-mm-yyyy'), 997, 'Glen', 'Captain', 'Bahaai', 'Gayle');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('17-01-1997', 'dd-mm-yyyy'), 998, 'Beverley', 'Sergeant', 'Taoism', 'Gray');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-10-1997', 'dd-mm-yyyy'), 999, 'Nanci', 'Private', 'Christianity', 'Moore');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-07-1991', 'dd-mm-yyyy'), 1000, 'Jean-Luc', 'Lieutenant', 'Islam', 'Madsen');
commit;
prompt 1000 records committed...
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-03-2004', 'dd-mm-yyyy'), 1001, 'Luke', 'Private', 'Christianity', 'Winter');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-07-2011', 'dd-mm-yyyy'), 1002, 'Geggy', 'Major General', 'Buddhism', 'Isaak');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-05-2011', 'dd-mm-yyyy'), 1003, 'Arnold', 'General', 'Bahaai', 'Paige');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-02-2003', 'dd-mm-yyyy'), 1004, 'Lennie', 'Colonel', 'Jainism', 'DiCaprio');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-11-2024', 'dd-mm-yyyy'), 1005, 'Chi', 'Brigadier General', 'Taoism', 'Shand');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-06-2000', 'dd-mm-yyyy'), 1006, 'Edie', 'Private', 'Judaism', 'Banderas');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('01-02-2000', 'dd-mm-yyyy'), 1007, 'Emma', 'Private', 'Taoism', 'McCormack');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-12-2013', 'dd-mm-yyyy'), 1008, 'Mac', 'General', 'Christianity', 'Wilkinson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-10-1997', 'dd-mm-yyyy'), 1009, 'Harrison', 'Major', 'Buddhism', 'Estevez');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-02-2019', 'dd-mm-yyyy'), 1010, 'Arturo', 'General', 'Bahaai', 'Lemmon');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-05-2004', 'dd-mm-yyyy'), 1011, 'Miguel', 'Private', 'Hinduism', 'Ammons');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('31-12-2014', 'dd-mm-yyyy'), 1012, 'Emm', 'Major General', 'Hinduism', 'Hewitt');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-11-1998', 'dd-mm-yyyy'), 1013, 'Alfie', 'Captain', 'Jainism', 'Soul');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-03-1998', 'dd-mm-yyyy'), 1014, 'Morgan', 'Captain', 'Bahaai', 'Torn');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-01-2015', 'dd-mm-yyyy'), 1015, 'Ben', 'Major', 'Judaism', 'Laurie');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-09-2016', 'dd-mm-yyyy'), 1016, 'Lena', 'Private', 'Bahaai', 'Mitchell');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-07-2015', 'dd-mm-yyyy'), 1017, 'Robert', 'Lieutenant', 'Christianity', 'Lewin');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-06-2007', 'dd-mm-yyyy'), 1018, 'Shannyn', 'Brigadier General', 'Islam', 'Berkeley');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-10-1991', 'dd-mm-yyyy'), 1019, 'Freddie', 'Private', 'Jainism', 'Valentin');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-05-2019', 'dd-mm-yyyy'), 1020, 'Jonathan', 'Major', 'Taoism', 'Weisz');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-12-1987', 'dd-mm-yyyy'), 1021, 'Cevin', 'Captain', 'Jainism', 'Numan');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-01-2011', 'dd-mm-yyyy'), 1022, 'Treat', 'Corporal', 'Shinto', 'Mazzello');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-10-1990', 'dd-mm-yyyy'), 1023, 'Hector', 'Sergeant', 'Bahaai', 'Utada');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-09-2018', 'dd-mm-yyyy'), 1024, 'Mandy', 'Colonel', 'Judaism', 'Wine');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-08-2009', 'dd-mm-yyyy'), 1025, 'Edgar', 'General', 'Christianity', 'Rebhorn');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-12-1989', 'dd-mm-yyyy'), 1026, 'Nick', 'Sergeant', 'Bahaai', 'Kudrow');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-12-1986', 'dd-mm-yyyy'), 1027, 'Maury', 'Major', 'Christianity', 'Walsh');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-10-2009', 'dd-mm-yyyy'), 1028, 'Derrick', 'Private', 'Islam', 'McGregor');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-03-2004', 'dd-mm-yyyy'), 1029, 'Donna', 'Sergeant', 'Christianity', 'Quinones');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('31-05-1988', 'dd-mm-yyyy'), 1030, 'Liam', 'Brigadier General', 'Sikhism', 'Koteas');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-12-1999', 'dd-mm-yyyy'), 1031, 'Selma', 'General', 'Buddhism', 'Quaid');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-08-2000', 'dd-mm-yyyy'), 1032, 'Praga', 'Corporal', 'Hinduism', 'Costello');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-02-1999', 'dd-mm-yyyy'), 1033, 'Kimberly', 'Brigadier General', 'Hinduism', 'Wong');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-12-2004', 'dd-mm-yyyy'), 1034, 'Randall', 'Colonel', 'Shinto', 'Schwimmer');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-09-2010', 'dd-mm-yyyy'), 1035, 'Kenny', 'Corporal', 'Islam', 'Gaynor');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-11-2017', 'dd-mm-yyyy'), 1036, 'Carla', 'Lieutenant', 'Christianity', 'Farrow');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-12-2019', 'dd-mm-yyyy'), 1037, 'Rascal', 'Brigadier General', 'Buddhism', 'Blackwell');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-03-2006', 'dd-mm-yyyy'), 1038, 'Glenn', 'Colonel', 'Judaism', 'Hatfield');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-10-2023', 'dd-mm-yyyy'), 1039, 'Night', 'Major General', 'Hinduism', 'Carlisle');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-11-2018', 'dd-mm-yyyy'), 1040, 'Demi', 'Brigadier General', 'Taoism', 'Bening');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-08-2005', 'dd-mm-yyyy'), 1041, 'Julianne', 'Private', 'Hinduism', 'Spiner');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-12-2002', 'dd-mm-yyyy'), 1042, 'Beth', 'General', 'Shinto', 'Penders');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-11-2017', 'dd-mm-yyyy'), 1043, 'Nickel', 'Sergeant', 'Hinduism', 'DeGraw');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-03-2023', 'dd-mm-yyyy'), 1044, 'Larenz', 'General', 'Buddhism', 'O''Connor');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-08-1996', 'dd-mm-yyyy'), 1045, 'Lennie', 'Sergeant', 'Taoism', 'Pacino');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-04-2019', 'dd-mm-yyyy'), 1046, 'Meryl', 'Sergeant', 'Hinduism', 'Holm');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-01-2001', 'dd-mm-yyyy'), 1047, 'Albertina', 'General', 'Islam', 'Imperioli');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-12-2008', 'dd-mm-yyyy'), 1048, 'Greg', 'General', 'Shinto', 'Driver');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-08-2000', 'dd-mm-yyyy'), 1049, 'Joaquim', 'Private', 'Shinto', 'Lachey');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-05-1990', 'dd-mm-yyyy'), 1050, 'Sam', 'Sergeant', 'Jainism', 'Bacon');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-04-2011', 'dd-mm-yyyy'), 1051, 'Harris', 'Major General', 'Jainism', 'Mazar');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-07-2021', 'dd-mm-yyyy'), 1052, 'Loren', 'Sergeant', 'Islam', 'Goldblum');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-03-2004', 'dd-mm-yyyy'), 1053, 'Crispin', 'Major General', 'Islam', 'Herndon');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-08-1986', 'dd-mm-yyyy'), 1054, 'Helen', 'Private', 'Christianity', 'Payne');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-02-1987', 'dd-mm-yyyy'), 1055, 'Carl', 'Sergeant', 'Islam', 'Pride');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('17-08-2021', 'dd-mm-yyyy'), 1056, 'Rita', 'Major General', 'Shinto', 'Kapanka');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-02-2021', 'dd-mm-yyyy'), 1057, 'Toni', 'Corporal', 'Bahaai', 'Saucedo');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-06-1999', 'dd-mm-yyyy'), 1058, 'Nelly', 'Private', 'Bahaai', 'Caan');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-08-1991', 'dd-mm-yyyy'), 1059, 'Robbie', 'Corporal', 'Taoism', 'Tyson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-02-2018', 'dd-mm-yyyy'), 1060, 'Brian', 'Major', 'Buddhism', 'Lynskey');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-01-2002', 'dd-mm-yyyy'), 1061, 'Steve', 'Captain', 'Jainism', 'Carnes');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-02-2018', 'dd-mm-yyyy'), 1062, 'Teena', 'Sergeant', 'Buddhism', 'Kinney');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-06-1993', 'dd-mm-yyyy'), 1063, 'Benjamin', 'Major General', 'Buddhism', 'Cooper');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-04-1992', 'dd-mm-yyyy'), 1064, 'Wade', 'Private', 'Judaism', 'Morrison');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-09-2024', 'dd-mm-yyyy'), 1065, 'Balthazar', 'Major General', 'Shinto', 'Arkin');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-02-2003', 'dd-mm-yyyy'), 1066, 'Mykelti', 'Sergeant', 'Islam', 'Fiorentino');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-09-2018', 'dd-mm-yyyy'), 1067, 'Brent', 'Private', 'Hinduism', 'Weller');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-11-2022', 'dd-mm-yyyy'), 1068, 'Boz', 'Lieutenant', 'Christianity', 'Kelly');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-05-2021', 'dd-mm-yyyy'), 1069, 'Sean', 'Captain', 'Judaism', 'Curry');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-02-1998', 'dd-mm-yyyy'), 1070, 'Nikki', 'Brigadier General', 'Bahaai', 'Wen');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-05-2015', 'dd-mm-yyyy'), 1071, 'Casey', 'Sergeant', 'Christianity', 'Hawthorne');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-07-2020', 'dd-mm-yyyy'), 1072, 'Terry', 'Corporal', 'Islam', 'Forrest');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-07-1990', 'dd-mm-yyyy'), 1073, 'LeVar', 'Major General', 'Bahaai', 'McGovern');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-08-2006', 'dd-mm-yyyy'), 1074, 'Brent', 'Lieutenant', 'Shinto', 'Furtado');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-05-1990', 'dd-mm-yyyy'), 1075, 'Viggo', 'General', 'Bahaai', 'Wariner');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-01-2009', 'dd-mm-yyyy'), 1076, 'Jena', 'Brigadier General', 'Sikhism', 'Allan');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-12-2008', 'dd-mm-yyyy'), 1077, 'Gladys', 'Sergeant', 'Bahaai', 'Douglas');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-11-2009', 'dd-mm-yyyy'), 1078, 'Saffron', 'Brigadier General', 'Jainism', 'Logue');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-09-2012', 'dd-mm-yyyy'), 1079, 'Gena', 'Brigadier General', 'Hinduism', 'Grant');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-11-1988', 'dd-mm-yyyy'), 1080, 'Illeana', 'Corporal', 'Jainism', 'Belles');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-09-1993', 'dd-mm-yyyy'), 1081, 'Donal', 'Private', 'Shinto', 'Gough');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-05-2006', 'dd-mm-yyyy'), 1082, 'Carlos', 'Captain', 'Bahaai', 'Broadbent');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-01-2001', 'dd-mm-yyyy'), 1083, 'Liv', 'Corporal', 'Judaism', 'Tah');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-08-1991', 'dd-mm-yyyy'), 1084, 'Toni', 'Private', 'Shinto', 'Hackman');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('29-10-1995', 'dd-mm-yyyy'), 1085, 'Colin', 'Lieutenant', 'Jainism', 'de Lancie');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-08-2002', 'dd-mm-yyyy'), 1086, 'Diane', 'Sergeant', 'Buddhism', 'Newman');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-08-2000', 'dd-mm-yyyy'), 1087, 'Candice', 'General', 'Judaism', 'Guest');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-10-2002', 'dd-mm-yyyy'), 1088, 'Graham', 'Colonel', 'Sikhism', 'Sepulveda');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-06-2018', 'dd-mm-yyyy'), 1089, 'Carrie-Anne', 'Colonel', 'Christianity', 'Avital');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-06-2008', 'dd-mm-yyyy'), 1090, 'Elizabeth', 'Private', 'Bahaai', 'Carlyle');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('13-04-1989', 'dd-mm-yyyy'), 1091, 'Judi', 'Captain', 'Bahaai', 'Lynne');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-01-1991', 'dd-mm-yyyy'), 1092, 'Marisa', 'Lieutenant', 'Christianity', 'Saucedo');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-02-2004', 'dd-mm-yyyy'), 1093, 'Simon', 'Major', 'Hinduism', 'Slater');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-08-1987', 'dd-mm-yyyy'), 1094, 'Scott', 'Lieutenant', 'Islam', 'Drive');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-12-2015', 'dd-mm-yyyy'), 1095, 'Andrew', 'Major', 'Sikhism', 'Northam');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-08-2014', 'dd-mm-yyyy'), 1096, 'Mary-Louise', 'Colonel', 'Shinto', 'Klugh');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-02-2018', 'dd-mm-yyyy'), 1097, 'Angie', 'General', 'Buddhism', 'Baldwin');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-02-1992', 'dd-mm-yyyy'), 1098, 'Miriam', 'Lieutenant', 'Jainism', 'Kleinenberg');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-04-2003', 'dd-mm-yyyy'), 1099, 'Lionel', 'Major General', 'Islam', 'Elliott');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-02-1999', 'dd-mm-yyyy'), 1100, 'Javon', 'Major', 'Taoism', 'Hampton');
commit;
prompt 1100 records committed...
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-08-2005', 'dd-mm-yyyy'), 1101, 'Emma', 'Major', 'Judaism', 'Farrow');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-08-2021', 'dd-mm-yyyy'), 1102, 'Kurtwood', 'Sergeant', 'Jainism', 'Sedgwick');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('31-08-1998', 'dd-mm-yyyy'), 1103, 'Judy', 'Lieutenant', 'Judaism', 'Taha');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-06-1995', 'dd-mm-yyyy'), 1104, 'Ali', 'General', 'Islam', 'Hutton');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-10-1986', 'dd-mm-yyyy'), 1105, 'Scarlett', 'Major', 'Hinduism', 'Morales');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-07-2011', 'dd-mm-yyyy'), 1106, 'Cameron', 'Brigadier General', 'Sikhism', 'English');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-07-1990', 'dd-mm-yyyy'), 1107, 'Caroline', 'Major General', 'Shinto', 'Overstreet');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('17-08-1986', 'dd-mm-yyyy'), 1108, 'Clive', 'Lieutenant', 'Islam', 'Sossamon');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-08-2009', 'dd-mm-yyyy'), 1109, 'Tamala', 'Lieutenant', 'Bahaai', 'Dunn');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-10-2017', 'dd-mm-yyyy'), 1110, 'Randall', 'Major', 'Buddhism', 'Schiavelli');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-01-2016', 'dd-mm-yyyy'), 1111, 'Lennie', 'Major General', 'Hinduism', 'Kilmer');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-09-1992', 'dd-mm-yyyy'), 1112, 'Nick', 'Major', 'Judaism', 'Costello');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-04-2004', 'dd-mm-yyyy'), 1113, 'Eileen', 'Private', 'Shinto', 'Evett');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-10-2007', 'dd-mm-yyyy'), 1114, 'Victoria', 'Colonel', 'Hinduism', 'Secada');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-08-2008', 'dd-mm-yyyy'), 1115, 'Sylvester', 'Corporal', 'Hinduism', 'Adkins');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-05-1991', 'dd-mm-yyyy'), 1116, 'Rufus', 'Corporal', 'Shinto', 'Matarazzo');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-09-2006', 'dd-mm-yyyy'), 1117, 'Marina', 'General', 'Hinduism', 'Faithfull');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-04-2007', 'dd-mm-yyyy'), 1118, 'Domingo', 'Corporal', 'Sikhism', 'Stuart');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-09-2012', 'dd-mm-yyyy'), 1119, 'Sonny', 'Private', 'Shinto', 'Ness');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-12-1994', 'dd-mm-yyyy'), 1120, 'Selma', 'Major General', 'Hinduism', 'Birch');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-06-2020', 'dd-mm-yyyy'), 1121, 'Candice', 'Corporal', 'Bahaai', 'Lovitz');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-10-1993', 'dd-mm-yyyy'), 1122, 'Salma', 'Private', 'Bahaai', 'Clooney');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-04-2001', 'dd-mm-yyyy'), 1123, 'Fionnula', 'Major General', 'Christianity', 'Klein');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-08-2013', 'dd-mm-yyyy'), 1124, 'Bobby', 'Major General', 'Taoism', 'Johansson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-07-2002', 'dd-mm-yyyy'), 1125, 'Boz', 'Corporal', 'Christianity', 'Heald');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-10-1993', 'dd-mm-yyyy'), 1126, 'Dabney', 'General', 'Jainism', 'Leguizamo');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('01-07-2020', 'dd-mm-yyyy'), 1127, 'Lucinda', 'Brigadier General', 'Shinto', 'Hawke');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-07-1994', 'dd-mm-yyyy'), 1128, 'Nina', 'Major General', 'Christianity', 'Yorn');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-08-2002', 'dd-mm-yyyy'), 1129, 'Emilio', 'Captain', 'Islam', 'Walsh');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-02-1988', 'dd-mm-yyyy'), 1130, 'Christopher', 'Corporal', 'Judaism', 'Holmes');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-03-1994', 'dd-mm-yyyy'), 1131, 'Mandy', 'Sergeant', 'Christianity', 'Gellar');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-10-1991', 'dd-mm-yyyy'), 1132, 'Fairuza', 'Captain', 'Sikhism', 'Allen');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-07-1986', 'dd-mm-yyyy'), 1133, 'Natasha', 'Colonel', 'Judaism', 'Boothe');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('07-02-1986', 'dd-mm-yyyy'), 1134, 'Lois', 'Major General', 'Christianity', 'Driver');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-03-2010', 'dd-mm-yyyy'), 1135, 'Gilbert', 'Lieutenant', 'Christianity', 'Crimson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-03-2013', 'dd-mm-yyyy'), 1136, 'Rowan', 'Sergeant', 'Bahaai', 'Dunn');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('17-12-2016', 'dd-mm-yyyy'), 1137, 'Chaka', 'Captain', 'Christianity', 'Llewelyn');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-06-2009', 'dd-mm-yyyy'), 1138, 'Jim', 'General', 'Bahaai', 'Kahn');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-12-2011', 'dd-mm-yyyy'), 1139, 'Dwight', 'Major General', 'Buddhism', 'Preston');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-09-2014', 'dd-mm-yyyy'), 1140, 'Miles', 'General', 'Bahaai', 'Karyo');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-01-1990', 'dd-mm-yyyy'), 1141, 'Warren', 'Brigadier General', 'Hinduism', 'Matthau');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('31-08-2013', 'dd-mm-yyyy'), 1142, 'Andrew', 'Captain', 'Sikhism', 'Mahood');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('17-07-2009', 'dd-mm-yyyy'), 1143, 'Glen', 'Private', 'Shinto', 'Matheson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-06-2013', 'dd-mm-yyyy'), 1144, 'Olympia', 'Lieutenant', 'Buddhism', 'Jovovich');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-07-2010', 'dd-mm-yyyy'), 1145, 'Maggie', 'Private', 'Judaism', 'Hong');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-11-2015', 'dd-mm-yyyy'), 1146, 'Joanna', 'Corporal', 'Buddhism', 'Elizondo');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-03-1987', 'dd-mm-yyyy'), 1147, 'Cornell', 'Captain', 'Judaism', 'Hawke');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-10-1990', 'dd-mm-yyyy'), 1148, 'Ricardo', 'Corporal', 'Bahaai', 'Tate');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-11-2000', 'dd-mm-yyyy'), 1149, 'Queen', 'Lieutenant', 'Jainism', 'Jessee');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-10-2007', 'dd-mm-yyyy'), 1150, 'Nicolas', 'Corporal', 'Bahaai', 'Bosco');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-10-2017', 'dd-mm-yyyy'), 1151, 'Larenz', 'Colonel', 'Buddhism', 'Hubbard');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-01-2007', 'dd-mm-yyyy'), 1152, 'Rory', 'Major General', 'Christianity', 'Hanks');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-01-1995', 'dd-mm-yyyy'), 1153, 'Nastassja', 'General', 'Christianity', 'Summer');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('23-09-2020', 'dd-mm-yyyy'), 1154, 'Celia', 'Brigadier General', 'Jainism', 'Stevenson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-03-2013', 'dd-mm-yyyy'), 1155, 'Eliza', 'Major General', 'Shinto', 'Daniels');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-08-2020', 'dd-mm-yyyy'), 1156, 'Kenny', 'General', 'Shinto', 'Kimball');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-04-2007', 'dd-mm-yyyy'), 1157, 'Natasha', 'Colonel', 'Jainism', 'Levin');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-03-2017', 'dd-mm-yyyy'), 1158, 'Ruth', 'Lieutenant', 'Buddhism', 'Pastore');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-04-1992', 'dd-mm-yyyy'), 1159, 'Parker', 'Major General', 'Buddhism', 'Day-Lewis');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-08-2010', 'dd-mm-yyyy'), 1160, 'Nancy', 'Colonel', 'Judaism', 'Barnett');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-01-2009', 'dd-mm-yyyy'), 1161, 'Mia', 'Corporal', 'Hinduism', 'Merchant');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('02-11-1997', 'dd-mm-yyyy'), 1162, 'Jane', 'Colonel', 'Shinto', 'Plimpton');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('30-04-2004', 'dd-mm-yyyy'), 1163, 'Pierce', 'Lieutenant', 'Shinto', 'Logue');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-12-1992', 'dd-mm-yyyy'), 1164, 'Arturo', 'Brigadier General', 'Taoism', 'Rhodes');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-01-2015', 'dd-mm-yyyy'), 1165, 'Judge', 'Private', 'Judaism', 'Baldwin');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-02-2016', 'dd-mm-yyyy'), 1166, 'Curtis', 'Private', 'Jainism', 'Stigers');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('25-07-2021', 'dd-mm-yyyy'), 1167, 'Temuera', 'Major', 'Buddhism', 'Wilkinson');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-07-2002', 'dd-mm-yyyy'), 1168, 'Luis', 'Lieutenant', 'Islam', 'Roy Parnell');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-03-2014', 'dd-mm-yyyy'), 1169, 'Orlando', 'Captain', 'Islam', 'Gilley');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-08-2002', 'dd-mm-yyyy'), 1170, 'Phoebe', 'Major General', 'Shinto', 'Rivers');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('21-08-2012', 'dd-mm-yyyy'), 1171, 'Rosie', 'Major', 'Hinduism', 'Drive');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('24-07-2001', 'dd-mm-yyyy'), 1172, 'Julianne', 'Captain', 'Christianity', 'Andrews');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-02-1998', 'dd-mm-yyyy'), 1173, 'Marie', 'Major General', 'Judaism', 'Dushku');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-08-2007', 'dd-mm-yyyy'), 1174, 'Fred', 'Colonel', 'Jainism', 'Statham');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('26-10-2023', 'dd-mm-yyyy'), 1175, 'Kris', 'Brigadier General', 'Buddhism', 'Armstrong');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-09-2000', 'dd-mm-yyyy'), 1176, 'Hugh', 'Sergeant', 'Judaism', 'Gambon');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-11-1998', 'dd-mm-yyyy'), 1177, 'Heath', 'Major General', 'Christianity', 'Skaggs');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-07-2003', 'dd-mm-yyyy'), 1178, 'Kiefer', 'Captain', 'Bahaai', 'Boothe');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('04-05-1990', 'dd-mm-yyyy'), 1179, 'Darius', 'Lieutenant', 'Buddhism', 'Sossamon');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('22-09-2023', 'dd-mm-yyyy'), 1180, 'Kris', 'Captain', 'Taoism', 'O''Neill');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('14-08-2018', 'dd-mm-yyyy'), 1181, 'Merrilee', 'Private', 'Hinduism', 'El-Saher');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-08-1992', 'dd-mm-yyyy'), 1182, 'Juliette', 'Colonel', 'Judaism', 'Davidtz');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('03-12-2022', 'dd-mm-yyyy'), 1183, 'Stevie', 'Sergeant', 'Sikhism', 'O''Neal');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('15-04-2024', 'dd-mm-yyyy'), 1184, 'Olga', 'General', 'Sikhism', 'Bandy');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('09-12-2015', 'dd-mm-yyyy'), 1185, 'Chad', 'Private', 'Buddhism', 'Blige');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-10-2008', 'dd-mm-yyyy'), 1186, 'Delbert', 'Sergeant', 'Taoism', 'Trejo');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('10-07-2013', 'dd-mm-yyyy'), 1187, 'Robin', 'General', 'Taoism', 'Blanchett');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('18-04-1991', 'dd-mm-yyyy'), 1188, 'Mae', 'General', 'Jainism', 'Quinlan');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-01-2007', 'dd-mm-yyyy'), 1189, 'Boyd', 'Sergeant', 'Shinto', 'Carradine');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('17-03-2000', 'dd-mm-yyyy'), 1190, 'Oro', 'Sergeant', 'Sikhism', 'Young');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('08-01-1988', 'dd-mm-yyyy'), 1191, 'Luis', 'Brigadier General', 'Shinto', 'Makowicz');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('28-01-2020', 'dd-mm-yyyy'), 1192, 'Jeremy', 'Major', 'Judaism', 'Coburn');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('20-06-1998', 'dd-mm-yyyy'), 1193, 'Albert', 'Colonel', 'Judaism', 'Shepherd');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('27-01-2019', 'dd-mm-yyyy'), 1194, 'Kevin', 'Corporal', 'Judaism', 'Katt');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('05-06-1991', 'dd-mm-yyyy'), 1195, 'Jodie', 'Major General', 'Jainism', 'Matarazzo');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('19-11-2019', 'dd-mm-yyyy'), 1196, 'Emm', 'Lieutenant', 'Christianity', 'Hawn');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('16-02-2023', 'dd-mm-yyyy'), 1197, 'Roscoe', 'General', 'Bahaai', 'Garr');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('06-06-2022', 'dd-mm-yyyy'), 1198, 'Frank', 'Captain', 'Jainism', 'LaMond');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('11-11-2016', 'dd-mm-yyyy'), 1199, 'Armand', 'Brigadier General', 'Judaism', 'Weisberg');
insert into SOLIDER (date_of_birth, id, first_name, rank, religion, last_name)
values (to_date('12-08-2024', 'dd-mm-yyyy'), 1200, 'Kid', 'Corporal', 'Judaism', 'Bush');
commit;
prompt 1200 records loaded
prompt Loading COMBAT_MEDIC...
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 0, 1);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 1, 2);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 0, 3);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 0, 4);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 1, 5);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 0, 6);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 1, 7);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 1, 8);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 1, 9);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 1, 10);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 1, 11);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 0, 12);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 0, 13);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 1, 14);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 0, 15);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 0, 16);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 0, 17);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 1, 18);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 1, 19);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 1, 20);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 0, 21);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 1, 22);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 1, 23);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 0, 24);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 0, 25);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 0, 26);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 0, 27);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 0, 28);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 1, 29);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 1, 30);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 1, 31);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 0, 32);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 1, 33);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 0, 34);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 1, 35);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 0, 36);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 0, 37);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 1, 38);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 0, 39);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 1, 40);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 0, 41);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 1, 42);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 0, 43);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 0, 44);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 1, 45);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 0, 46);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 1, 47);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 0, 48);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 1, 49);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 1, 50);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 0, 51);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 1, 52);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 1, 53);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 0, 54);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 0, 55);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 0, 56);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 1, 57);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 1, 58);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 1, 59);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 0, 60);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 1, 61);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 1, 62);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 0, 63);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 1, 64);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 0, 65);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 1, 66);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 1, 67);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 1, 68);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 0, 69);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 1, 70);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 0, 71);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 0, 72);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 0, 73);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 1, 74);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 0, 75);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 1, 76);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 1, 77);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 1, 78);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 1, 79);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 1, 80);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 1, 81);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 0, 82);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 1, 83);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 1, 84);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 0, 85);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 1, 86);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 1, 87);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 1, 88);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 1, 89);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 1, 90);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 0, 91);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 0, 92);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 0, 93);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 1, 94);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 1, 95);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 0, 96);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 0, 97);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 0, 98);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 1, 99);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 1, 100);
commit;
prompt 100 records committed...
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 0, 101);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 1, 102);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 1, 103);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 0, 104);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 0, 105);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 0, 106);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 0, 107);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 1, 108);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 0, 109);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 1, 110);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 0, 111);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 0, 112);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 0, 113);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 1, 114);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 0, 115);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 0, 116);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 0, 117);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 0, 118);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 0, 119);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 1, 120);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 1, 121);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 1, 122);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 0, 123);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 1, 124);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 0, 125);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 0, 126);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 0, 127);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 0, 128);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 0, 129);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 0, 130);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 0, 131);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 0, 132);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 0, 133);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 0, 134);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 0, 135);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 0, 136);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 1, 137);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 0, 138);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 1, 139);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 0, 140);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 0, 141);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 1, 142);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 1, 143);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 1, 144);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 1, 145);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 1, 146);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 1, 147);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 1, 148);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 0, 149);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 1, 150);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 0, 151);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 0, 152);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 0, 153);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 1, 154);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 1, 155);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 0, 156);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 1, 157);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 0, 158);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 1, 159);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 1, 160);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 0, 161);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 0, 162);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 1, 163);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 0, 164);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 1, 165);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 1, 166);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 0, 167);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 0, 168);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 1, 169);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 1, 170);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 1, 171);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 1, 172);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 0, 173);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 0, 174);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 1, 175);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 0, 176);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 1, 177);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 0, 178);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 1, 179);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 1, 180);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 1, 181);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 0, 182);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 0, 183);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 0, 184);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 1, 185);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 1, 186);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 1, 187);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 0, 188);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 1, 189);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 1, 190);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 0, 191);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 0, 192);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 0, 193);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 1, 194);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 1, 195);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 0, 196);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 1, 197);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 0, 198);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 1, 199);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 1, 200);
commit;
prompt 200 records committed...
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 0, 201);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 1, 202);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 1, 203);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 1, 204);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 0, 205);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 0, 206);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 1, 207);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 0, 208);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 1, 209);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 1, 210);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 0, 211);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 1, 212);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 1, 213);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 0, 214);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 0, 215);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 1, 216);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 1, 217);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 1, 218);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 1, 219);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 1, 220);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 0, 221);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 0, 222);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 1, 223);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 1, 224);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 0, 225);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 1, 226);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 0, 227);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 1, 228);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 1, 229);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 1, 230);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 0, 231);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 1, 232);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 0, 233);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 1, 234);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 1, 235);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 0, 236);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 1, 237);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 0, 238);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 0, 239);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 1, 240);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 0, 241);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 1, 242);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 0, 243);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 1, 244);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 1, 245);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 1, 246);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 1, 247);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 1, 248);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 1, 249);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 1, 250);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 1, 251);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 1, 252);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 0, 253);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 0, 254);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 0, 255);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 0, 256);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 0, 257);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 1, 258);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 0, 259);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 0, 260);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 0, 261);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 0, 262);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 0, 263);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 1, 264);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 1, 265);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 0, 266);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 1, 267);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 0, 268);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 0, 269);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 1, 270);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 0, 271);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 1, 272);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 1, 273);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 0, 274);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 1, 275);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 1, 276);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 0, 277);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 0, 278);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 1, 279);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 1, 280);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 0, 281);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 0, 282);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 1, 283);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 0, 284);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 1, 285);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 1, 286);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 0, 287);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 0, 288);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 1, 289);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 1, 290);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 1, 291);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 0, 292);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 1, 293);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 0, 294);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 1, 295);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 0, 296);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 1, 297);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 1, 298);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 0, 299);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 0, 300);
commit;
prompt 300 records committed...
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 1, 301);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 1, 302);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 1, 303);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 0, 304);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 1, 305);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 0, 306);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 0, 307);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 1, 308);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 1, 309);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 0, 310);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 0, 311);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 1, 312);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 1, 313);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 0, 314);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 1, 315);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 1, 316);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 1, 317);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 0, 318);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 1, 319);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 1, 320);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 0, 321);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 0, 322);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 0, 323);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 0, 324);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 0, 325);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 1, 326);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 0, 327);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 1, 328);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 0, 329);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 1, 330);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 1, 331);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 1, 332);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 0, 333);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 1, 334);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 1, 335);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 1, 336);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 1, 337);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 1, 338);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 1, 339);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 0, 340);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 1, 341);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 0, 342);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 1, 343);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 0, 344);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 1, 345);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 1, 346);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 1, 347);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 0, 348);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 0, 349);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 0, 350);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 1, 351);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 1, 352);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 0, 353);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 0, 354);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 0, 355);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 0, 356);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 1, 357);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 0, 358);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 0, 359);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 1, 360);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 1, 361);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 1, 362);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 1, 363);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 0, 364);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 1, 365);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 0, 366);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 1, 367);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 0, 368);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 1, 369);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 0, 370);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 0, 371);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 1, 372);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 0, 373);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 0, 374);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 0, 375);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 0, 376);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 0, 377);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 1, 378);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DDS', 1, 379);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 0, 380);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 1, 381);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 0, 382);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DVM', 1, 383);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 0, 384);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 0, 385);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('NP', 1, 386);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 0, 387);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 0, 388);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 0, 389);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 0, 390);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 1, 391);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('RN', 1, 392);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('OD', 0, 393);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 1, 394);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DMD', 1, 395);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PA', 1, 396);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 1, 397);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('MD', 0, 398);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('PharmD', 1, 399);
insert into COMBAT_MEDIC (qualification, in_training, id)
values ('DO', 0, 400);
commit;
prompt 400 records loaded
prompt Loading COMMANDER...
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Franz', 4, 1, 401);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Chris', 7, 4, 402);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Merrilee', 3, 4, 403);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Wally', 3, 4, 404);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Lindsay', 10, 1, 405);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Nikka', 1, 4, 406);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Marty', 4, 5, 407);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Breckin', 6, 3, 408);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Ann', 1, 1, 409);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Ramsey', 8, 1, 410);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Patty', 3, 5, 411);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('James', 8, 3, 412);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Tilda', 6, 4, 413);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Taye', 1, 1, 414);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Gilberto', 8, 5, 415);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Demi', 6, 5, 416);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Cliff', 10, 3, 417);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Vickie', 7, 5, 418);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Blair', 6, 3, 419);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Angie', 6, 1, 420);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Parker', 6, 3, 421);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Loretta', 4, 5, 422);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Frankie', 4, 5, 423);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Winona', 2, 1, 424);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Keith', 1, 2, 425);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Ossie', 1, 3, 426);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Jude', 5, 5, 427);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Hal', 10, 5, 428);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Nikki', 5, 5, 429);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Cuba', 1, 5, 430);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Renee', 1, 5, 431);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Liam', 10, 5, 432);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Franco', 4, 5, 433);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Teena', 8, 5, 434);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Jane', 9, 3, 435);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Delroy', 2, 2, 436);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Peabo', 4, 1, 437);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Liev', 6, 5, 438);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Doug', 9, 2, 439);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Henry', 4, 5, 440);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Davis', 4, 2, 441);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Night', 1, 5, 442);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Rip', 5, 5, 443);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Percy', 9, 5, 444);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Blair', 9, 4, 445);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Laurie', 6, 5, 446);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Nik', 5, 5, 447);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Linda', 3, 1, 448);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Donald', 8, 4, 449);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Vivica', 4, 4, 450);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Dorry', 2, 3, 451);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Nathan', 6, 5, 452);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Mandy', 2, 2, 453);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Kay', 8, 4, 454);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Juan', 2, 1, 455);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Mindy', 2, 3, 456);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Rueben', 2, 5, 457);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Gloria', 1, 1, 458);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Aimee', 4, 2, 459);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Burt', 3, 5, 460);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Charlie', 7, 2, 461);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Louise', 10, 5, 462);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Meredith', 4, 3, 463);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Murray', 1, 3, 464);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Stellan', 10, 4, 465);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Desmond', 8, 4, 466);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Frederic', 2, 5, 467);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Emma', 7, 5, 468);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Shannyn', 3, 1, 469);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Rosanne', 10, 2, 470);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Wang', 7, 5, 471);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Joan', 7, 5, 472);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Aimee', 8, 3, 473);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Karon', 6, 5, 474);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Joey', 6, 5, 475);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Yaphet', 2, 4, 476);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Nathan', 1, 2, 477);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Amanda', 4, 3, 478);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Julio', 2, 1, 479);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Gary', 1, 5, 480);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Night', 10, 4, 481);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Armin', 2, 4, 482);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Fisher', 6, 2, 483);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Burton', 10, 4, 484);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Solomon', 3, 2, 485);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Kurtwood', 1, 5, 486);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Kimberly', 6, 2, 487);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Cate', 8, 5, 488);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Nanci', 8, 5, 489);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Dick', 10, 1, 490);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Holly', 8, 5, 491);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Joshua', 3, 3, 492);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Kasey', 10, 3, 493);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Nina', 4, 5, 494);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Gran', 3, 5, 495);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Juliette', 8, 4, 496);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Cloris', 5, 5, 497);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Andrew', 4, 4, 498);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Mindy', 7, 5, 499);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Busta', 9, 5, 500);
commit;
prompt 100 records committed...
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Christmas', 5, 3, 501);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Geraldine', 7, 5, 502);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Judy', 10, 5, 503);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Jeffery', 1, 5, 504);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Irene', 9, 5, 505);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Yolanda', 6, 5, 506);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Naomi', 10, 1, 507);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Peabo', 8, 5, 508);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Mika', 3, 4, 509);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Nora', 6, 4, 510);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Geoffrey', 9, 2, 511);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('First', 2, 3, 512);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Alannah', 5, 4, 513);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('ChantÃƒÆ’Ã‚Â©', 9, 4, 514);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Jerry', 6, 5, 515);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Marianne', 7, 5, 516);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Norm', 5, 3, 517);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Murray', 7, 1, 518);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Melanie', 1, 2, 519);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Zooey', 10, 4, 520);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Maura', 3, 2, 521);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Laurence', 5, 5, 522);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Ossie', 6, 5, 523);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Merrilee', 3, 4, 524);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Shelby', 5, 4, 525);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Gwyneth', 3, 5, 526);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Gates', 4, 5, 527);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Larnelle', 9, 1, 528);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Judi', 9, 3, 529);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Randy', 2, 1, 530);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Avenged', 7, 2, 531);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Steve', 6, 5, 532);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Eric', 7, 1, 533);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Ritchie', 3, 2, 534);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Wayne', 2, 4, 535);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Terry', 9, 5, 536);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Annette', 5, 3, 537);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Carrie-Anne', 10, 4, 538);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Courtney', 8, 1, 539);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Eliza', 3, 4, 540);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Radney', 1, 2, 541);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Gates', 9, 2, 542);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Sissy', 4, 1, 543);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Earl', 5, 5, 544);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Ramsey', 10, 5, 545);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Queen', 2, 2, 546);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Cheech', 2, 2, 547);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Oded', 4, 3, 548);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Nils', 2, 3, 549);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Robby', 9, 3, 550);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Lari', 9, 2, 551);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Gates', 4, 5, 552);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Sona', 5, 3, 553);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Judd', 9, 4, 554);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Simon', 9, 5, 555);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Kathleen', 6, 4, 556);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Dennis', 7, 5, 557);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Mili', 4, 2, 558);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Ty', 4, 2, 559);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Frankie', 9, 4, 560);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Debi', 10, 1, 561);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Kasey', 5, 5, 562);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Greg', 3, 5, 563);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Wallace', 10, 2, 564);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Dick', 8, 4, 565);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Oro', 6, 3, 566);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Colm', 8, 5, 567);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Tracy', 2, 3, 568);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Cyndi', 7, 2, 569);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Taye', 9, 1, 570);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Jonny', 1, 2, 571);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Lindsay', 6, 1, 572);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Nicholas', 6, 5, 573);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Stockard', 6, 4, 574);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Rawlins', 5, 4, 575);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Teri', 7, 5, 576);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Oliver', 8, 4, 577);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Wes', 6, 4, 578);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Claude', 7, 2, 579);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Chely', 7, 5, 580);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Roy', 10, 4, 581);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Loren', 3, 4, 582);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Joaquin', 9, 1, 583);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Maury', 6, 5, 584);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Ed', 1, 5, 585);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Gilbert', 9, 5, 586);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Jerry', 3, 5, 587);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Maxine', 4, 4, 588);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Jonny', 5, 2, 589);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Armin', 1, 2, 590);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Melba', 10, 4, 591);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Devon', 3, 1, 592);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Veruca', 3, 1, 593);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Sean', 5, 4, 594);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Neneh', 8, 4, 595);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Vendetta', 9, 5, 596);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Jimmie', 3, 5, 597);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Joanna', 3, 5, 598);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Gilberto', 5, 5, 599);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Woody', 7, 5, 600);
commit;
prompt 200 records committed...
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Regina', 5, 2, 601);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Jackson', 10, 1, 602);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Rebeka', 10, 3, 603);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Geena', 4, 4, 604);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Andre', 1, 5, 605);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Rascal', 5, 5, 606);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Nina', 4, 3, 607);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Toshiro', 4, 3, 608);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Rachael', 10, 5, 609);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Juliana', 7, 2, 610);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Kelli', 7, 5, 611);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Sam', 5, 4, 612);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Janice', 1, 5, 613);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('King', 4, 4, 614);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Casey', 4, 5, 615);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Steven', 7, 3, 616);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Elisabeth', 3, 4, 617);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Kay', 3, 5, 618);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Rufus', 4, 3, 619);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Geoffrey', 3, 5, 620);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Goran', 5, 2, 621);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Freddie', 4, 5, 622);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Sammy', 9, 1, 623);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Oro', 10, 2, 624);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Humberto', 8, 4, 625);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Anna', 5, 1, 626);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Joaquim', 7, 4, 627);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Maggie', 4, 3, 628);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Nikka', 10, 5, 629);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Chloe', 4, 2, 630);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Cuba', 7, 2, 631);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Alice', 2, 2, 632);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Gino', 4, 5, 633);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Rory', 10, 1, 634);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Casey', 10, 5, 635);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Toshiro', 7, 2, 636);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Deborah', 8, 5, 637);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Mike', 2, 3, 638);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Hilton', 1, 2, 639);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Trini', 6, 5, 640);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Tea', 4, 4, 641);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Kimberly', 7, 5, 642);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Jessica', 3, 3, 643);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Thelma', 6, 2, 644);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Devon', 1, 1, 645);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Victor', 1, 2, 646);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Roscoe', 3, 1, 647);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Keanu', 8, 3, 648);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Andrea', 1, 1, 649);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Jean-Claude', 7, 2, 650);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Connie', 7, 5, 651);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Lupe', 3, 5, 652);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Lance', 6, 3, 653);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Lea', 10, 3, 654);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Alannah', 1, 2, 655);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Carl', 1, 2, 656);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Hope', 6, 2, 657);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Sandra', 5, 5, 658);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Ewan', 8, 4, 659);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Ted', 6, 5, 660);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Dave', 3, 5, 661);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Ryan', 10, 5, 662);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Alfred', 4, 3, 663);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Jason', 8, 5, 664);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Bobby', 1, 5, 665);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Guy', 5, 3, 666);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Gabriel', 7, 3, 667);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Juliet', 2, 5, 668);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Mary-Louise', 9, 2, 669);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Linda', 1, 5, 670);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Kay', 8, 5, 671);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Kenny', 4, 5, 672);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Giancarlo', 3, 1, 673);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Ted', 10, 4, 674);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Kelli', 8, 5, 675);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Oded', 7, 3, 676);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Jamie', 2, 4, 677);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Arturo', 3, 4, 678);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Freddy', 1, 3, 679);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Hazel', 4, 4, 680);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Franco', 2, 5, 681);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Merrilee', 7, 5, 682);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Jeff', 3, 3, 683);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Cameron', 1, 5, 684);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Lily', 2, 1, 685);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Crispin', 2, 5, 686);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Malcolm', 6, 5, 687);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Noah', 10, 2, 688);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Timothy', 1, 3, 689);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Mel', 4, 4, 690);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Catherine', 6, 2, 691);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Ashley', 4, 3, 692);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Latin', 9, 5, 693);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Gabriel', 4, 5, 694);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Luke', 10, 1, 695);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Ashley', 10, 5, 696);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Sally', 2, 4, 697);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Harriet', 10, 5, 698);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Steven', 6, 5, 699);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Rick', 10, 2, 700);
commit;
prompt 300 records committed...
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Julianna', 3, 2, 701);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Scott', 8, 1, 702);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Rick', 7, 4, 703);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Clay', 6, 4, 704);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Gord', 1, 4, 705);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Arturo', 6, 4, 706);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Kevin', 9, 5, 707);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Rebecca', 7, 5, 708);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Juliana', 7, 3, 709);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Rob', 2, 5, 710);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Susan', 8, 3, 711);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Ronnie', 4, 1, 712);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Kate', 2, 4, 713);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Rachid', 7, 1, 714);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Dorry', 2, 5, 715);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Ewan', 8, 3, 716);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Stevie', 10, 1, 717);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Aimee', 8, 1, 718);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Campbell', 3, 4, 719);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Rawlins', 2, 3, 720);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Cate', 5, 1, 721);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Goldie', 1, 1, 722);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Christine', 4, 4, 723);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Jean-Claude', 1, 5, 724);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Morgan', 3, 4, 725);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Doug', 1, 5, 726);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Dean', 8, 3, 727);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Debbie', 4, 5, 728);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Blair', 9, 2, 729);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Desmond', 8, 3, 730);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Chloe', 8, 5, 731);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Gina', 6, 3, 732);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Treat', 4, 2, 733);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Colleen', 1, 5, 734);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Woody', 2, 3, 735);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Humberto', 7, 4, 736);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Isaac', 5, 5, 737);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Tracy', 6, 5, 738);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Kurt', 5, 1, 739);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Russell', 4, 5, 740);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Harriet', 8, 5, 741);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Ali', 9, 5, 742);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Greg', 3, 5, 743);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Marc', 7, 5, 744);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Millie', 8, 5, 745);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Jonatha', 1, 5, 746);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Brad', 4, 1, 747);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Denzel', 10, 2, 748);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Roscoe', 4, 1, 749);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Bette', 5, 4, 750);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Angela', 4, 5, 751);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Karen', 8, 4, 752);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Elizabeth', 10, 1, 753);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Kenneth', 3, 3, 754);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Sal', 3, 1, 755);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Mary', 6, 3, 756);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Warren', 8, 1, 757);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Casey', 5, 4, 758);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Nikka', 4, 4, 759);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Miranda', 9, 5, 760);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Todd', 3, 5, 761);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Jesse', 4, 2, 762);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Davey', 3, 3, 763);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Giovanni', 3, 1, 764);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Albert', 7, 3, 765);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Lily', 9, 3, 766);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Seann', 7, 3, 767);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Maura', 10, 2, 768);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Bob', 2, 4, 769);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Carlos', 10, 5, 770);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Susan', 9, 1, 771);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Rupert', 6, 5, 772);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Harrison', 6, 5, 773);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Gord', 7, 2, 774);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Armand', 6, 4, 775);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Woody', 7, 4, 776);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Judd', 2, 2, 777);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Kurtwood', 9, 5, 778);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Chuck', 5, 2, 779);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Pelvic', 10, 5, 780);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Maceo', 10, 5, 781);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Rosario', 4, 1, 782);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Stanley', 1, 1, 783);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Antonio', 9, 4, 784);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Rade', 1, 5, 785);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Debbie', 7, 3, 786);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Spike', 4, 2, 787);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Jeff', 1, 1, 788);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Dan', 10, 1, 789);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Ed', 3, 4, 790);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Hugo', 1, 4, 791);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Mary', 6, 2, 792);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Chaka', 8, 5, 793);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Latin', 6, 3, 794);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Talvin', 1, 4, 795);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Nile', 7, 4, 796);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Marie', 6, 1, 797);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Gene', 10, 1, 798);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Chloe', 7, 1, 799);
insert into COMMANDER (nickname, soliders_affection, security_clearance, id)
values ('Donald', 5, 3, 800);
commit;
prompt 400 records loaded
prompt Loading MILITARY_RABBI...
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Temani', 1, 1172);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Hasidic', 'Buchari', 0, 1173);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Iraqi', 1, 1174);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Temani', 0, 1175);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Sphard', 0, 1176);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Temani', 1, 1177);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Ashkenazi', 0, 1178);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Sphard', 0, 1179);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Sphard', 0, 1180);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Hasidic', 'Buchari', 0, 1181);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Iraqi', 0, 1182);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Buchari', 0, 1183);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Sphard', 1, 1184);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Sphard', 1, 1185);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Temani', 1, 1186);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Iraqi', 1, 1187);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Ashkenazi', 1, 1188);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Iraqi', 0, 1189);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Temani', 0, 1190);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Buchari', 0, 1191);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Hasidic', 'Iraqi', 0, 1192);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Iraqi', 1, 1193);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Sphard', 1, 1194);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Temani', 0, 1195);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Iraqi', 1, 1196);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Ashkenazi', 0, 1197);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Buchari', 0, 1198);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Iraqi', 1, 1199);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Sphard', 0, 1200);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Iraqi', 1, 801);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Iraqi', 0, 802);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Iraqi', 0, 803);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Temani', 1, 804);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Buchari', 1, 805);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Ashkenazi', 1, 806);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Iraqi', 0, 807);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Iraqi', 0, 808);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Sphard', 0, 809);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Ashkenazi', 1, 810);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Temani', 1, 811);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Ashkenazi', 1, 812);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Ashkenazi', 1, 813);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Sphard', 0, 814);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Temani', 1, 815);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Hasidic', 'Ashkenazi', 1, 816);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Hasidic', 'Ashkenazi', 0, 817);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Temani', 0, 818);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Iraqi', 1, 819);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Hasidic', 'Temani', 0, 820);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Ashkenazi', 1, 821);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Ashkenazi', 0, 822);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Buchari', 1, 823);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Buchari', 1, 824);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Temani', 0, 825);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Temani', 0, 826);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Ashkenazi', 1, 827);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Hasidic', 'Ashkenazi', 1, 828);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Sphard', 1, 829);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Temani', 1, 830);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Iraqi', 0, 831);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Ashkenazi', 0, 832);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Sphard', 1, 833);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Ashkenazi', 1, 834);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Ashkenazi', 1, 835);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Ashkenazi', 0, 836);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Iraqi', 0, 837);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Temani', 1, 838);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Temani', 0, 839);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Hasidic', 'Sphard', 0, 840);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Sphard', 1, 841);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Sphard', 1, 842);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Iraqi', 1, 843);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Iraqi', 0, 844);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Ashkenazi', 1, 845);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Iraqi', 0, 846);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Temani', 1, 847);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Buchari', 1, 848);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Iraqi', 0, 849);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Sphard', 1, 850);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Hasidic', 'Iraqi', 0, 851);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Iraqi', 0, 852);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Sphard', 1, 853);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Sphard', 1, 854);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Ashkenazi', 0, 855);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Hasidic', 'Ashkenazi', 1, 856);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Temani', 1, 857);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Iraqi', 0, 858);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Sphard', 0, 859);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Temani', 0, 860);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Buchari', 1, 861);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Ashkenazi', 0, 862);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Sphard', 0, 863);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Iraqi', 1, 864);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Sphard', 0, 865);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Buchari', 1, 866);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Iraqi', 1, 867);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Buchari', 0, 868);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Hasidic', 'Sphard', 0, 869);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Buchari', 0, 870);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Hasidic', 'Ashkenazi', 1, 871);
commit;
prompt 100 records committed...
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Iraqi', 1, 872);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Temani', 1, 873);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Hasidic', 'Sphard', 1, 874);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Ashkenazi', 0, 875);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Temani', 0, 876);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Ashkenazi', 1, 877);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Ashkenazi', 1, 878);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Buchari', 0, 879);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Sphard', 0, 880);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Iraqi', 0, 881);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Hasidic', 'Buchari', 1, 882);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Hasidic', 'Buchari', 0, 883);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Iraqi', 0, 884);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Ashkenazi', 1, 885);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Temani', 1, 886);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Hasidic', 'Iraqi', 0, 887);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Temani', 0, 888);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Iraqi', 1, 889);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Iraqi', 1, 890);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Ashkenazi', 1, 891);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Ashkenazi', 0, 892);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Sphard', 1, 893);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Buchari', 0, 894);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Hasidic', 'Temani', 0, 895);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Iraqi', 0, 896);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Temani', 0, 897);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Buchari', 1, 898);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Ashkenazi', 0, 899);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Sphard', 0, 900);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Hasidic', 'Buchari', 0, 901);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Temani', 0, 902);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Hasidic', 'Buchari', 0, 903);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Sphard', 0, 904);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Hasidic', 'Ashkenazi', 0, 905);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Iraqi', 0, 906);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Temani', 0, 907);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Ashkenazi', 1, 908);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Hasidic', 'Ashkenazi', 1, 909);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Temani', 0, 910);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Buchari', 1, 911);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Sphard', 1, 912);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Buchari', 1, 913);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Iraqi', 0, 914);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Iraqi', 0, 915);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Buchari', 0, 916);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Sphard', 1, 917);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Iraqi', 0, 918);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Ashkenazi', 0, 919);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Buchari', 1, 920);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Iraqi', 1, 921);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Temani', 0, 922);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Buchari', 1, 923);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Hasidic', 'Temani', 0, 924);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Sphard', 0, 925);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Ashkenazi', 1, 926);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Ashkenazi', 1, 927);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Sphard', 1, 928);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Iraqi', 1, 929);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Iraqi', 0, 930);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Ashkenazi', 0, 931);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Temani', 1, 932);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Hasidic', 'Temani', 1, 933);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Hasidic', 'Iraqi', 0, 934);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Temani', 1, 935);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Ashkenazi', 1, 936);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Iraqi', 0, 937);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Temani', 0, 938);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Buchari', 1, 939);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Temani', 1, 940);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Buchari', 0, 941);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Buchari', 1, 942);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Temani', 0, 943);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Ashkenazi', 0, 944);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Iraqi', 0, 945);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Buchari', 1, 946);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Temani', 1, 947);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Ashkenazi', 1, 948);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Sphard', 0, 949);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Sphard', 1, 950);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Iraqi', 1, 951);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Ashkenazi', 0, 952);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Buchari', 0, 953);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Temani', 1, 954);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Sphard', 0, 955);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Ashkenazi', 1, 956);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Buchari', 0, 957);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Temani', 1, 958);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Temani', 0, 959);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Ashkenazi', 0, 960);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Temani', 0, 961);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Ashkenazi', 1, 962);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Ashkenazi', 0, 963);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Iraqi', 1, 964);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Buchari', 1, 965);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Ashkenazi', 0, 966);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Buchari', 1, 967);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Buchari', 1, 968);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Buchari', 0, 969);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Hasidic', 'Ashkenazi', 1, 970);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Iraqi', 0, 971);
commit;
prompt 200 records committed...
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Ashkenazi', 0, 972);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Temani', 1, 973);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Ashkenazi', 0, 974);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Temani', 0, 975);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Ashkenazi', 1, 976);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Temani', 1, 977);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Iraqi', 0, 978);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Ashkenazi', 0, 979);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Sphard', 0, 980);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Hasidic', 'Buchari', 1, 981);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Ashkenazi', 1, 982);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Ashkenazi', 0, 983);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Buchari', 1, 984);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Iraqi', 0, 985);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Buchari', 0, 986);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Sphard', 1, 987);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Buchari', 1, 988);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Temani', 0, 989);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Buchari', 1, 990);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Buchari', 0, 991);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Iraqi', 1, 992);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Hasidic', 'Sphard', 1, 993);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Ashkenazi', 0, 994);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Hasidic', 'Temani', 0, 995);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Temani', 0, 996);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Ashkenazi', 0, 997);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Sphard', 0, 998);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Sphard', 0, 999);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Iraqi', 1, 1000);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Iraqi', 1, 1001);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Sphard', 0, 1002);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Iraqi', 1, 1003);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Iraqi', 0, 1004);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Temani', 0, 1005);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Ashkenazi', 0, 1006);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Temani', 0, 1007);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Ashkenazi', 0, 1008);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Buchari', 0, 1009);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Ashkenazi', 0, 1010);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Buchari', 0, 1011);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Ashkenazi', 0, 1012);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Iraqi', 1, 1013);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Hasidic', 'Temani', 1, 1014);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Buchari', 0, 1015);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Temani', 0, 1016);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Ashkenazi', 1, 1017);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Hasidic', 'Temani', 0, 1018);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Ashkenazi', 0, 1019);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Buchari', 1, 1020);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Sphard', 0, 1021);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Buchari', 1, 1022);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Ashkenazi', 0, 1023);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Temani', 0, 1024);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Sphard', 1, 1025);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Hasidic', 'Buchari', 1, 1026);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Ashkenazi', 1, 1027);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Ashkenazi', 0, 1028);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Iraqi', 1, 1029);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Ashkenazi', 1, 1030);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Iraqi', 1, 1031);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Buchari', 0, 1032);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Iraqi', 0, 1033);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Sphard', 0, 1034);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Iraqi', 0, 1035);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Iraqi', 0, 1036);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Hasidic', 'Sphard', 1, 1037);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Hasidic', 'Sphard', 0, 1038);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Buchari', 0, 1039);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Buchari', 0, 1040);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Iraqi', 0, 1041);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Ashkenazi', 1, 1042);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Sphard', 0, 1043);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Iraqi', 0, 1044);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Temani', 0, 1045);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Temani', 1, 1046);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Buchari', 1, 1047);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Sphard', 1, 1048);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Buchari', 1, 1049);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Iraqi', 1, 1050);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Temani', 1, 1051);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Iraqi', 0, 1052);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Hasidic', 'Buchari', 1, 1053);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Temani', 0, 1054);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Ashkenazi', 0, 1055);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Sphard', 0, 1056);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Iraqi', 1, 1057);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Sphard', 0, 1058);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Iraqi', 0, 1059);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Sphard', 1, 1060);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Iraqi', 0, 1061);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Hasidic', 'Ashkenazi', 0, 1062);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Hasidic', 'Ashkenazi', 0, 1063);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Buchari', 1, 1064);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Ashkenazi', 1, 1065);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Buchari', 0, 1066);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Buchari', 0, 1067);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Hasidic', 'Sphard', 1, 1068);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Sphard', 0, 1069);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Iraqi', 1, 1070);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Iraqi', 0, 1071);
commit;
prompt 300 records committed...
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Temani', 1, 1072);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Buchari', 1, 1073);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Temani', 1, 1074);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Temani', 1, 1075);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Hasidic', 'Buchari', 1, 1076);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Ashkenazi', 0, 1077);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Sphard', 1, 1078);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Ashkenazi', 0, 1079);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Temani', 1, 1080);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Sphard', 0, 1081);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Buchari', 1, 1082);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Iraqi', 1, 1083);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Ashkenazi', 1, 1084);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Hasidic', 'Iraqi', 1, 1085);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Sphard', 0, 1086);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Sphard', 1, 1087);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Sphard', 1, 1088);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Sphard', 1, 1089);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Buchari', 0, 1090);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Hasidic', 'Buchari', 0, 1091);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Temani', 0, 1092);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Hasidic', 'Sphard', 1, 1093);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Temani', 1, 1094);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Sphard', 1, 1095);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Sphard', 0, 1096);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Temani', 1, 1097);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Ashkenazi', 0, 1098);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Buchari', 0, 1099);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Hasidic', 'Temani', 1, 1100);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Temani', 0, 1101);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Buchari', 0, 1102);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Sphard', 1, 1103);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Iraqi', 1, 1104);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Iraqi', 0, 1105);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Buchari', 1, 1106);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Sphard', 0, 1107);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Buchari', 0, 1108);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Ashkenazi', 1, 1109);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Sphard', 1, 1110);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Iraqi', 0, 1111);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Iraqi', 0, 1112);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Ashkenazi', 1, 1113);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Ashkenazi', 1, 1114);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Hasidic', 'Iraqi', 1, 1115);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Ashkenazi', 1, 1116);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Sphard', 0, 1117);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Buchari', 0, 1118);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Sphard', 0, 1119);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Buchari', 1, 1120);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Buchari', 0, 1121);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Ashkenazi', 0, 1122);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Iraqi', 0, 1123);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Ashkenazi', 1, 1124);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Iraqi', 0, 1125);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Hasidic', 'Buchari', 1, 1126);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Temani', 0, 1127);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Iraqi', 1, 1128);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Ashkenazi', 0, 1129);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Hasidic', 'Temani', 0, 1130);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Buchari', 1, 1131);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Buchari', 0, 1132);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Temani', 1, 1133);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Sphard', 0, 1134);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Temani', 1, 1135);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Hasidic', 'Ashkenazi', 1, 1136);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Temani', 1, 1137);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Hasidic', 'Ashkenazi', 0, 1138);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Ashkenazi', 1, 1139);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Hasidic', 'Sphard', 1, 1140);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Buchari', 0, 1141);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Sphard', 0, 1142);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Hasidic', 'Temani', 0, 1143);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Ashkenazi', 0, 1144);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Temani', 1, 1145);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Temani', 0, 1146);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Sphard', 1, 1147);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Sphard', 1, 1148);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Temani', 0, 1149);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Iraqi', 0, 1150);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Iraqi', 1, 1151);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Ashkenazi', 1, 1152);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Sphard', 0, 1153);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Religous-Zionism', 'Iraqi', 0, 1154);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Sphard', 1, 1155);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Buchari', 1, 1156);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Iraqi', 0, 1157);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 0, 'Haredi-Litai', 'Sphard', 0, 1158);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Sphard', 0, 1159);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Temani', 1, 1160);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Sphard', 0, 1161);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Haredi-Litai', 'Iraqi', 1, 1162);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 1, 'Religous-Zionism', 'Iraqi', 0, 1163);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Religous-Zionism', 'Temani', 1, 1164);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Iraqi', 1, 1165);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Religous-Zionism', 'Buchari', 0, 1166);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Buchari', 0, 1167);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (1, 0, 'Haredi-Litai', 'Ashkenazi', 1, 1168);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Ashkenazi', 1, 1169);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Litai', 'Iraqi', 0, 1170);
insert into MILITARY_RABBI (certified_rabbi, payytan, sector, ethnicity, preacher, id)
values (0, 1, 'Haredi-Hasidic', 'Sphard', 0, 1171);
commit;
prompt 400 records loaded
prompt Loading TEAM...
insert into TEAM (team_number, name, religious, commander_id)
values (1, 'Chapel hill', 0, 401);
insert into TEAM (team_number, name, religious, commander_id)
values (2, 'Burlington', 0, 402);
insert into TEAM (team_number, name, religious, commander_id)
values (3, 'Lubbock', 1, 403);
insert into TEAM (team_number, name, religious, commander_id)
values (4, 'Pusan-city', 0, 404);
insert into TEAM (team_number, name, religious, commander_id)
values (5, 'Foster City', 0, 405);
insert into TEAM (team_number, name, religious, commander_id)
values (6, 'durham', 1, 406);
insert into TEAM (team_number, name, religious, commander_id)
values (7, 'Horsham', 1, 407);
insert into TEAM (team_number, name, religious, commander_id)
values (8, 'Mt. Laurel', 0, 408);
insert into TEAM (team_number, name, religious, commander_id)
values (9, 'Denver', 0, 409);
insert into TEAM (team_number, name, religious, commander_id)
values (10, 'Perth', 1, 410);
insert into TEAM (team_number, name, religious, commander_id)
values (11, 'Chinnor', 0, 411);
insert into TEAM (team_number, name, religious, commander_id)
values (12, 'Or-yehuda', 1, 412);
insert into TEAM (team_number, name, religious, commander_id)
values (13, 'Brossard', 0, 413);
insert into TEAM (team_number, name, religious, commander_id)
values (14, 'Augsburg', 1, 414);
insert into TEAM (team_number, name, religious, commander_id)
values (15, 'Monterrey', 1, 415);
insert into TEAM (team_number, name, religious, commander_id)
values (16, 'Traralgon', 1, 416);
insert into TEAM (team_number, name, religious, commander_id)
values (17, 'Kochi', 0, 417);
insert into TEAM (team_number, name, religious, commander_id)
values (18, 'NynÃƒÆ’Ã‚Â¤shamn', 0, 418);
insert into TEAM (team_number, name, religious, commander_id)
values (19, 'Suwon-city', 0, 419);
insert into TEAM (team_number, name, religious, commander_id)
values (20, 'Singapore', 0, 420);
insert into TEAM (team_number, name, religious, commander_id)
values (21, 'Rockland', 1, 421);
insert into TEAM (team_number, name, religious, commander_id)
values (22, 'Hartmannsdorf', 0, 422);
insert into TEAM (team_number, name, religious, commander_id)
values (23, 'QuÃƒÆ’Ã‚Â©bec', 1, 423);
insert into TEAM (team_number, name, religious, commander_id)
values (24, 'Bend', 1, 424);
insert into TEAM (team_number, name, religious, commander_id)
values (25, 'Montreal', 0, 425);
insert into TEAM (team_number, name, religious, commander_id)
values (26, 'Houston', 0, 426);
insert into TEAM (team_number, name, religious, commander_id)
values (27, 'West Launceston', 1, 427);
insert into TEAM (team_number, name, religious, commander_id)
values (28, 'Oak park', 1, 428);
insert into TEAM (team_number, name, religious, commander_id)
values (29, 'Saint Ouen', 1, 429);
insert into TEAM (team_number, name, religious, commander_id)
values (30, 'Rothenburg', 0, 430);
insert into TEAM (team_number, name, religious, commander_id)
values (31, 'Gifu', 1, 431);
insert into TEAM (team_number, name, religious, commander_id)
values (32, 'Nizhnevartovsk', 1, 432);
insert into TEAM (team_number, name, religious, commander_id)
values (33, 'Charleston', 1, 433);
insert into TEAM (team_number, name, religious, commander_id)
values (34, 'Manchester', 0, 434);
insert into TEAM (team_number, name, religious, commander_id)
values (35, 'Leimen', 1, 435);
insert into TEAM (team_number, name, religious, commander_id)
values (36, 'Dalmine', 0, 436);
insert into TEAM (team_number, name, religious, commander_id)
values (37, 'Yucca', 0, 437);
insert into TEAM (team_number, name, religious, commander_id)
values (38, 'High Wycombe', 1, 438);
insert into TEAM (team_number, name, religious, commander_id)
values (39, 'Brussel', 1, 439);
insert into TEAM (team_number, name, religious, commander_id)
values (40, 'Flower mound', 1, 440);
insert into TEAM (team_number, name, religious, commander_id)
values (41, 'Knoxville', 0, 441);
insert into TEAM (team_number, name, religious, commander_id)
values (42, 'Nizhnevartovsk', 1, 442);
insert into TEAM (team_number, name, religious, commander_id)
values (43, 'Brisbane', 0, 443);
insert into TEAM (team_number, name, religious, commander_id)
values (44, 'Shawnee', 1, 444);
insert into TEAM (team_number, name, religious, commander_id)
values (45, 'Farnham', 1, 445);
insert into TEAM (team_number, name, religious, commander_id)
values (46, 'Lexington', 1, 446);
insert into TEAM (team_number, name, religious, commander_id)
values (47, 'Ashdod', 0, 447);
insert into TEAM (team_number, name, religious, commander_id)
values (48, 'Guamo', 1, 448);
insert into TEAM (team_number, name, religious, commander_id)
values (49, 'Orange', 1, 449);
insert into TEAM (team_number, name, religious, commander_id)
values (50, 'Rancho Palos Verdes', 0, 450);
insert into TEAM (team_number, name, religious, commander_id)
values (51, 'Stanford', 1, 451);
insert into TEAM (team_number, name, religious, commander_id)
values (52, 'Buenos Aires', 0, 452);
insert into TEAM (team_number, name, religious, commander_id)
values (53, 'Maserada sul Piave', 1, 453);
insert into TEAM (team_number, name, religious, commander_id)
values (54, 'Kagoshima', 0, 454);
insert into TEAM (team_number, name, religious, commander_id)
values (55, 'South Hadley', 0, 455);
insert into TEAM (team_number, name, religious, commander_id)
values (56, 'Americana', 0, 456);
insert into TEAM (team_number, name, religious, commander_id)
values (57, 'Bethesda', 0, 457);
insert into TEAM (team_number, name, religious, commander_id)
values (58, 'Salzburg', 0, 458);
insert into TEAM (team_number, name, religious, commander_id)
values (59, 'Battle Creek', 0, 459);
insert into TEAM (team_number, name, religious, commander_id)
values (60, 'Neustadt', 1, 460);
insert into TEAM (team_number, name, religious, commander_id)
values (61, 'Kuraby', 1, 461);
insert into TEAM (team_number, name, religious, commander_id)
values (62, 'Eschborn', 0, 462);
insert into TEAM (team_number, name, religious, commander_id)
values (63, 'Herne', 0, 463);
insert into TEAM (team_number, name, religious, commander_id)
values (64, 'Chapel hill', 1, 464);
insert into TEAM (team_number, name, religious, commander_id)
values (65, 'Ciudad del Este', 0, 465);
insert into TEAM (team_number, name, religious, commander_id)
values (66, 'Aurora', 1, 466);
insert into TEAM (team_number, name, religious, commander_id)
values (67, 'Stony Point', 0, 467);
insert into TEAM (team_number, name, religious, commander_id)
values (68, 'Ferraz  vasconcelos', 1, 468);
insert into TEAM (team_number, name, religious, commander_id)
values (69, 'Radovljica', 1, 469);
insert into TEAM (team_number, name, religious, commander_id)
values (70, 'Farnham', 0, 470);
insert into TEAM (team_number, name, religious, commander_id)
values (71, 'Algermissen', 1, 471);
insert into TEAM (team_number, name, religious, commander_id)
values (72, 'Libertyville', 1, 472);
insert into TEAM (team_number, name, religious, commander_id)
values (73, 'Fairborn', 1, 473);
insert into TEAM (team_number, name, religious, commander_id)
values (74, 'Silverdale', 1, 474);
insert into TEAM (team_number, name, religious, commander_id)
values (75, 'Natal', 0, 475);
insert into TEAM (team_number, name, religious, commander_id)
values (76, 'Amarillo', 1, 476);
insert into TEAM (team_number, name, religious, commander_id)
values (77, 'Sale', 1, 477);
insert into TEAM (team_number, name, religious, commander_id)
values (78, 'Caguas', 0, 478);
insert into TEAM (team_number, name, religious, commander_id)
values (79, 'Barcelona', 1, 479);
insert into TEAM (team_number, name, religious, commander_id)
values (80, 'Salvador', 0, 480);
insert into TEAM (team_number, name, religious, commander_id)
values (81, 'Espoo', 1, 481);
insert into TEAM (team_number, name, religious, commander_id)
values (82, 'Menlo Park', 0, 482);
insert into TEAM (team_number, name, religious, commander_id)
values (83, 'Nara', 0, 483);
insert into TEAM (team_number, name, religious, commander_id)
values (84, 'Sorocaba', 1, 484);
insert into TEAM (team_number, name, religious, commander_id)
values (85, 'El Dorado Hills', 0, 485);
insert into TEAM (team_number, name, religious, commander_id)
values (86, 'Kerava', 0, 486);
insert into TEAM (team_number, name, religious, commander_id)
values (87, 'Bay Shore', 0, 487);
insert into TEAM (team_number, name, religious, commander_id)
values (88, 'Benbrook', 1, 488);
insert into TEAM (team_number, name, religious, commander_id)
values (89, 'Los Alamos', 1, 489);
insert into TEAM (team_number, name, religious, commander_id)
values (90, 'Stoneham', 1, 490);
insert into TEAM (team_number, name, religious, commander_id)
values (91, 'Canal Winchester', 0, 491);
insert into TEAM (team_number, name, religious, commander_id)
values (92, 'Rueil-Malmaison', 0, 492);
insert into TEAM (team_number, name, religious, commander_id)
values (93, 'Ramat Gan', 1, 493);
insert into TEAM (team_number, name, religious, commander_id)
values (94, 'Maintenon', 0, 494);
insert into TEAM (team_number, name, religious, commander_id)
values (95, 'Niles', 1, 495);
insert into TEAM (team_number, name, religious, commander_id)
values (96, 'Mendoza', 0, 496);
insert into TEAM (team_number, name, religious, commander_id)
values (97, 'Frankfurt am Main', 0, 497);
insert into TEAM (team_number, name, religious, commander_id)
values (98, 'Valencia', 1, 498);
insert into TEAM (team_number, name, religious, commander_id)
values (99, 'North Sydney', 0, 499);
insert into TEAM (team_number, name, religious, commander_id)
values (100, 'Coslada', 0, 500);
commit;
prompt 100 records committed...
insert into TEAM (team_number, name, religious, commander_id)
values (101, 'Thames Ditton', 1, 501);
insert into TEAM (team_number, name, religious, commander_id)
values (102, 'Monterey', 1, 502);
insert into TEAM (team_number, name, religious, commander_id)
values (103, 'Goiania', 1, 503);
insert into TEAM (team_number, name, religious, commander_id)
values (104, 'Edenbridge', 0, 504);
insert into TEAM (team_number, name, religious, commander_id)
values (105, 'Dietikon', 0, 505);
insert into TEAM (team_number, name, religious, commander_id)
values (106, 'Pandrup', 0, 506);
insert into TEAM (team_number, name, religious, commander_id)
values (107, 'Johor Bahru', 0, 507);
insert into TEAM (team_number, name, religious, commander_id)
values (108, 'Morioka', 0, 508);
insert into TEAM (team_number, name, religious, commander_id)
values (109, 'Leverkusen', 1, 509);
insert into TEAM (team_number, name, religious, commander_id)
values (110, 'Casselberry', 1, 510);
insert into TEAM (team_number, name, religious, commander_id)
values (111, 'Brossard', 1, 511);
insert into TEAM (team_number, name, religious, commander_id)
values (112, 'Laredo', 0, 512);
insert into TEAM (team_number, name, religious, commander_id)
values (113, 'Market Harborough', 1, 513);
insert into TEAM (team_number, name, religious, commander_id)
values (114, 'Cesena', 0, 514);
insert into TEAM (team_number, name, religious, commander_id)
values (115, 'Buffalo Grove', 0, 515);
insert into TEAM (team_number, name, religious, commander_id)
values (116, 'Vienna', 1, 516);
insert into TEAM (team_number, name, religious, commander_id)
values (117, 'Chambery', 1, 517);
insert into TEAM (team_number, name, religious, commander_id)
values (118, 'Edmonton', 1, 518);
insert into TEAM (team_number, name, religious, commander_id)
values (119, 'Aachen', 1, 519);
insert into TEAM (team_number, name, religious, commander_id)
values (120, 'Milan', 1, 520);
insert into TEAM (team_number, name, religious, commander_id)
values (121, 'Aomori', 1, 521);
insert into TEAM (team_number, name, religious, commander_id)
values (122, 'Gliwice', 0, 522);
insert into TEAM (team_number, name, religious, commander_id)
values (123, 'AniÃƒÆ’Ã‚Â¨res', 0, 523);
insert into TEAM (team_number, name, religious, commander_id)
values (124, 'Narrows', 0, 524);
insert into TEAM (team_number, name, religious, commander_id)
values (125, 'Odense', 1, 525);
insert into TEAM (team_number, name, religious, commander_id)
values (126, 'Lenexa', 0, 526);
insert into TEAM (team_number, name, religious, commander_id)
values (127, 'Spring City', 0, 527);
insert into TEAM (team_number, name, religious, commander_id)
values (128, 'Swannanoa', 0, 528);
insert into TEAM (team_number, name, religious, commander_id)
values (129, 'Tokushima', 0, 529);
insert into TEAM (team_number, name, religious, commander_id)
values (130, 'East sussex', 1, 530);
insert into TEAM (team_number, name, religious, commander_id)
values (131, 'Lenexa', 0, 531);
insert into TEAM (team_number, name, religious, commander_id)
values (132, 'Hyderabad', 1, 532);
insert into TEAM (team_number, name, religious, commander_id)
values (133, 'Bedfordshire', 1, 533);
insert into TEAM (team_number, name, religious, commander_id)
values (134, 'Macclesfield', 0, 534);
insert into TEAM (team_number, name, religious, commander_id)
values (135, 'Valencia', 0, 535);
insert into TEAM (team_number, name, religious, commander_id)
values (136, 'Chennai', 1, 536);
insert into TEAM (team_number, name, religious, commander_id)
values (137, 'Waltham', 0, 537);
insert into TEAM (team_number, name, religious, commander_id)
values (138, 'Shreveport', 0, 538);
insert into TEAM (team_number, name, religious, commander_id)
values (139, 'Kuraby', 1, 539);
insert into TEAM (team_number, name, religious, commander_id)
values (140, 'San Francisco', 1, 540);
insert into TEAM (team_number, name, religious, commander_id)
values (141, 'Angers', 0, 541);
insert into TEAM (team_number, name, religious, commander_id)
values (142, 'Soest', 0, 542);
insert into TEAM (team_number, name, religious, commander_id)
values (143, 'Douala', 1, 543);
insert into TEAM (team_number, name, religious, commander_id)
values (144, 'Lyon', 1, 544);
insert into TEAM (team_number, name, religious, commander_id)
values (145, 'Orleans', 0, 545);
insert into TEAM (team_number, name, religious, commander_id)
values (146, 'Prague', 1, 546);
insert into TEAM (team_number, name, religious, commander_id)
values (147, 'Solikamsk', 0, 547);
insert into TEAM (team_number, name, religious, commander_id)
values (148, 'Mississauga', 1, 548);
insert into TEAM (team_number, name, religious, commander_id)
values (149, 'Longueuil', 0, 549);
insert into TEAM (team_number, name, religious, commander_id)
values (150, 'Gennevilliers', 0, 550);
insert into TEAM (team_number, name, religious, commander_id)
values (151, 'Albuquerque', 1, 551);
insert into TEAM (team_number, name, religious, commander_id)
values (152, 'Vienna', 1, 552);
insert into TEAM (team_number, name, religious, commander_id)
values (153, 'Grand Rapids', 0, 553);
insert into TEAM (team_number, name, religious, commander_id)
values (154, 'Herford', 0, 554);
insert into TEAM (team_number, name, religious, commander_id)
values (155, 'Flushing', 0, 555);
insert into TEAM (team_number, name, religious, commander_id)
values (156, 'Horsens', 0, 556);
insert into TEAM (team_number, name, religious, commander_id)
values (157, 'Suwon', 0, 557);
insert into TEAM (team_number, name, religious, commander_id)
values (158, 'Herndon', 0, 558);
insert into TEAM (team_number, name, religious, commander_id)
values (159, 'Pulheim-brauweiler', 1, 559);
insert into TEAM (team_number, name, religious, commander_id)
values (160, 'Ternitz', 0, 560);
insert into TEAM (team_number, name, religious, commander_id)
values (161, 'Meerbusch', 1, 561);
insert into TEAM (team_number, name, religious, commander_id)
values (162, 'Los Alamos', 1, 562);
insert into TEAM (team_number, name, religious, commander_id)
values (163, 'Carlsbad', 1, 563);
insert into TEAM (team_number, name, religious, commander_id)
values (164, 'Waalwijk', 0, 564);
insert into TEAM (team_number, name, religious, commander_id)
values (165, 'Whitehouse Station', 0, 565);
insert into TEAM (team_number, name, religious, commander_id)
values (166, 'Thalwil', 0, 566);
insert into TEAM (team_number, name, religious, commander_id)
values (167, 'Louisville', 1, 567);
insert into TEAM (team_number, name, religious, commander_id)
values (168, 'Eden prairie', 1, 568);
insert into TEAM (team_number, name, religious, commander_id)
values (169, 'Hannover', 0, 569);
insert into TEAM (team_number, name, religious, commander_id)
values (170, 'Portland', 1, 570);
insert into TEAM (team_number, name, religious, commander_id)
values (171, 'Udine', 1, 571);
insert into TEAM (team_number, name, religious, commander_id)
values (172, 'Southampton', 1, 572);
insert into TEAM (team_number, name, religious, commander_id)
values (173, 'Milford', 1, 573);
insert into TEAM (team_number, name, religious, commander_id)
values (174, 'Ipswich', 1, 574);
insert into TEAM (team_number, name, religious, commander_id)
values (175, 'Melbourne', 1, 575);
insert into TEAM (team_number, name, religious, commander_id)
values (176, 'Freising', 0, 576);
insert into TEAM (team_number, name, religious, commander_id)
values (177, 'Augst', 0, 577);
insert into TEAM (team_number, name, religious, commander_id)
values (178, 'Bekescsaba', 1, 578);
insert into TEAM (team_number, name, religious, commander_id)
values (179, 'Bristol', 0, 579);
insert into TEAM (team_number, name, religious, commander_id)
values (180, 'Almaty', 0, 580);
insert into TEAM (team_number, name, religious, commander_id)
values (181, 'Rancho Palos Verdes', 1, 581);
insert into TEAM (team_number, name, religious, commander_id)
values (182, 'San Jose', 0, 582);
insert into TEAM (team_number, name, religious, commander_id)
values (183, 'Koppl', 1, 583);
insert into TEAM (team_number, name, religious, commander_id)
values (184, 'Nashua', 1, 584);
insert into TEAM (team_number, name, religious, commander_id)
values (185, 'Enschede', 0, 585);
insert into TEAM (team_number, name, religious, commander_id)
values (186, 'Charleston', 0, 586);
insert into TEAM (team_number, name, religious, commander_id)
values (187, 'Coimbra', 1, 587);
insert into TEAM (team_number, name, religious, commander_id)
values (188, 'Huntington Beach', 0, 588);
insert into TEAM (team_number, name, religious, commander_id)
values (189, 'Burgess Hill', 1, 589);
insert into TEAM (team_number, name, religious, commander_id)
values (190, 'Framingaham', 0, 590);
insert into TEAM (team_number, name, religious, commander_id)
values (191, 'Bay Shore', 0, 591);
insert into TEAM (team_number, name, religious, commander_id)
values (192, 'San Diego', 1, 592);
insert into TEAM (team_number, name, religious, commander_id)
values (193, 'Chinnor', 1, 593);
insert into TEAM (team_number, name, religious, commander_id)
values (194, 'Augst', 0, 594);
insert into TEAM (team_number, name, religious, commander_id)
values (195, 'Nantes', 1, 595);
insert into TEAM (team_number, name, religious, commander_id)
values (196, 'Aberdeen', 0, 596);
insert into TEAM (team_number, name, religious, commander_id)
values (197, 'Taoyuan', 0, 597);
insert into TEAM (team_number, name, religious, commander_id)
values (198, 'Yogyakarta', 0, 598);
insert into TEAM (team_number, name, religious, commander_id)
values (199, 'Bergen', 1, 599);
insert into TEAM (team_number, name, religious, commander_id)
values (200, 'Araras', 0, 600);
commit;
prompt 200 records committed...
insert into TEAM (team_number, name, religious, commander_id)
values (201, 'Caracas', 0, 601);
insert into TEAM (team_number, name, religious, commander_id)
values (202, 'Oulu', 1, 602);
insert into TEAM (team_number, name, religious, commander_id)
values (203, 'ThÃƒÆ’Ã‚Â¶rishaus', 1, 603);
insert into TEAM (team_number, name, religious, commander_id)
values (204, 'Lyngby', 0, 604);
insert into TEAM (team_number, name, religious, commander_id)
values (205, 'Zagreb', 1, 605);
insert into TEAM (team_number, name, religious, commander_id)
values (206, 'North Sydney', 0, 606);
insert into TEAM (team_number, name, religious, commander_id)
values (207, 'Redmond', 1, 607);
insert into TEAM (team_number, name, religious, commander_id)
values (208, 'Newton-le-willows', 0, 608);
insert into TEAM (team_number, name, religious, commander_id)
values (209, 'Kagoshima', 0, 609);
insert into TEAM (team_number, name, religious, commander_id)
values (210, 'Delafield', 0, 610);
insert into TEAM (team_number, name, religious, commander_id)
values (211, 'Chambersburg', 0, 611);
insert into TEAM (team_number, name, religious, commander_id)
values (212, 'Cannock', 0, 612);
insert into TEAM (team_number, name, religious, commander_id)
values (213, 'Vaduz', 1, 613);
insert into TEAM (team_number, name, religious, commander_id)
values (214, 'Oldenburg', 0, 614);
insert into TEAM (team_number, name, religious, commander_id)
values (215, 'Calgary', 0, 615);
insert into TEAM (team_number, name, religious, commander_id)
values (216, 'Bekescsaba', 0, 616);
insert into TEAM (team_number, name, religious, commander_id)
values (217, 'Hines', 0, 617);
insert into TEAM (team_number, name, religious, commander_id)
values (218, 'Oklahoma city', 0, 618);
insert into TEAM (team_number, name, religious, commander_id)
values (219, 'Edmonton', 0, 619);
insert into TEAM (team_number, name, religious, commander_id)
values (220, 'Gaithersburg', 1, 620);
insert into TEAM (team_number, name, religious, commander_id)
values (221, 'Batavia', 0, 621);
insert into TEAM (team_number, name, religious, commander_id)
values (222, 'Erlangen', 1, 622);
insert into TEAM (team_number, name, religious, commander_id)
values (223, 'El Masnou', 1, 623);
insert into TEAM (team_number, name, religious, commander_id)
values (224, 'Suwon-city', 1, 624);
insert into TEAM (team_number, name, religious, commander_id)
values (225, 'Maryville', 1, 625);
insert into TEAM (team_number, name, religious, commander_id)
values (226, 'Milton Keynes', 0, 626);
insert into TEAM (team_number, name, religious, commander_id)
values (227, 'Paal Beringen', 0, 627);
insert into TEAM (team_number, name, religious, commander_id)
values (228, 'Redwood Shores', 0, 628);
insert into TEAM (team_number, name, religious, commander_id)
values (229, 'Irving', 0, 629);
insert into TEAM (team_number, name, religious, commander_id)
values (230, 'Baltimore', 0, 630);
insert into TEAM (team_number, name, religious, commander_id)
values (231, 'Chirignago', 0, 631);
insert into TEAM (team_number, name, religious, commander_id)
values (232, 'Melbourne', 0, 632);
insert into TEAM (team_number, name, religious, commander_id)
values (233, 'WÃƒÆ’Ã‚Â¼rzburg', 1, 633);
insert into TEAM (team_number, name, religious, commander_id)
values (234, 'Mendoza', 1, 634);
insert into TEAM (team_number, name, religious, commander_id)
values (235, 'Pompeia', 0, 635);
insert into TEAM (team_number, name, religious, commander_id)
values (236, 'Jakarta', 1, 636);
insert into TEAM (team_number, name, religious, commander_id)
values (237, 'Middletown', 1, 637);
insert into TEAM (team_number, name, religious, commander_id)
values (238, 'Redding', 1, 638);
insert into TEAM (team_number, name, religious, commander_id)
values (239, 'Heubach', 0, 639);
insert into TEAM (team_number, name, religious, commander_id)
values (240, 'Aiken', 1, 640);
insert into TEAM (team_number, name, religious, commander_id)
values (241, 'Chennai', 0, 641);
insert into TEAM (team_number, name, religious, commander_id)
values (242, 'Drogenbos', 1, 642);
insert into TEAM (team_number, name, religious, commander_id)
values (243, 'Lublin', 1, 643);
insert into TEAM (team_number, name, religious, commander_id)
values (244, 'Hannover', 1, 644);
insert into TEAM (team_number, name, religious, commander_id)
values (245, 'Frederiksberg', 1, 645);
insert into TEAM (team_number, name, religious, commander_id)
values (246, 'Hiroshima', 0, 646);
insert into TEAM (team_number, name, religious, commander_id)
values (247, 'Paris', 0, 647);
insert into TEAM (team_number, name, religious, commander_id)
values (248, 'Karlsruhe', 0, 648);
insert into TEAM (team_number, name, religious, commander_id)
values (249, 'Milpitas', 0, 649);
insert into TEAM (team_number, name, religious, commander_id)
values (250, 'Clark', 1, 650);
insert into TEAM (team_number, name, religious, commander_id)
values (251, 'St. Petersburg', 1, 651);
insert into TEAM (team_number, name, religious, commander_id)
values (252, 'Pacific Grove', 1, 652);
insert into TEAM (team_number, name, religious, commander_id)
values (253, 'Royston', 0, 653);
insert into TEAM (team_number, name, religious, commander_id)
values (254, 'Suberg', 1, 654);
insert into TEAM (team_number, name, religious, commander_id)
values (255, 'Lubbock', 1, 655);
insert into TEAM (team_number, name, religious, commander_id)
values (256, 'Monument', 1, 656);
insert into TEAM (team_number, name, religious, commander_id)
values (257, 'Bedfordshire', 0, 657);
insert into TEAM (team_number, name, religious, commander_id)
values (258, 'Barcelona', 1, 658);
insert into TEAM (team_number, name, religious, commander_id)
values (259, 'Pretoria', 0, 659);
insert into TEAM (team_number, name, religious, commander_id)
values (260, 'League city', 0, 660);
insert into TEAM (team_number, name, religious, commander_id)
values (261, 'Rorschach', 0, 661);
insert into TEAM (team_number, name, religious, commander_id)
values (262, 'Laurel', 0, 662);
insert into TEAM (team_number, name, religious, commander_id)
values (263, 'Wetzlar', 1, 663);
insert into TEAM (team_number, name, religious, commander_id)
values (264, 'Bologna', 1, 664);
insert into TEAM (team_number, name, religious, commander_id)
values (265, 'Hermitage', 1, 665);
insert into TEAM (team_number, name, religious, commander_id)
values (266, 'Lakewood', 0, 666);
insert into TEAM (team_number, name, religious, commander_id)
values (267, 'Loveland', 0, 667);
insert into TEAM (team_number, name, religious, commander_id)
values (268, 'Paris', 0, 668);
insert into TEAM (team_number, name, religious, commander_id)
values (269, 'Jun-nam', 0, 669);
insert into TEAM (team_number, name, religious, commander_id)
values (270, 'MÃƒÆ’Ã‚Â¶nchengladbach', 0, 670);
insert into TEAM (team_number, name, religious, commander_id)
values (271, 'Seoul', 1, 671);
insert into TEAM (team_number, name, religious, commander_id)
values (272, 'Duesseldorf', 1, 672);
insert into TEAM (team_number, name, religious, commander_id)
values (273, 'Ipswich', 1, 673);
insert into TEAM (team_number, name, religious, commander_id)
values (274, 'Enschede', 1, 674);
insert into TEAM (team_number, name, religious, commander_id)
values (275, 'Seattle', 1, 675);
insert into TEAM (team_number, name, religious, commander_id)
values (276, 'Almaty', 1, 676);
insert into TEAM (team_number, name, religious, commander_id)
values (277, 'Gliwice', 0, 677);
insert into TEAM (team_number, name, religious, commander_id)
values (278, 'Runcorn', 1, 678);
insert into TEAM (team_number, name, religious, commander_id)
values (279, 'Los Angeles', 0, 679);
insert into TEAM (team_number, name, religious, commander_id)
values (280, 'Sutton', 1, 680);
insert into TEAM (team_number, name, religious, commander_id)
values (281, 'Waldorf', 1, 681);
insert into TEAM (team_number, name, religious, commander_id)
values (282, 'Joinville', 0, 682);
insert into TEAM (team_number, name, religious, commander_id)
values (283, 'Rotterdam', 0, 683);
insert into TEAM (team_number, name, religious, commander_id)
values (284, 'Lake Forest', 0, 684);
insert into TEAM (team_number, name, religious, commander_id)
values (285, 'Cherepovets', 0, 685);
insert into TEAM (team_number, name, religious, commander_id)
values (286, 'Concordville', 0, 686);
insert into TEAM (team_number, name, religious, commander_id)
values (287, 'Nizhnevartovsk', 1, 687);
insert into TEAM (team_number, name, religious, commander_id)
values (288, 'Aracruz', 1, 688);
insert into TEAM (team_number, name, religious, commander_id)
values (289, 'Sao roque', 0, 689);
insert into TEAM (team_number, name, religious, commander_id)
values (290, 'Oklahoma city', 1, 690);
insert into TEAM (team_number, name, religious, commander_id)
values (291, 'O''fallon', 1, 691);
insert into TEAM (team_number, name, religious, commander_id)
values (292, 'Richardson', 0, 692);
insert into TEAM (team_number, name, religious, commander_id)
values (293, 'Pensacola', 0, 693);
insert into TEAM (team_number, name, religious, commander_id)
values (294, 'Bingham Farms', 0, 694);
insert into TEAM (team_number, name, religious, commander_id)
values (295, 'NynÃƒÆ’Ã‚Â¤shamn', 0, 695);
insert into TEAM (team_number, name, religious, commander_id)
values (296, 'Key Biscayne', 1, 696);
insert into TEAM (team_number, name, religious, commander_id)
values (297, 'Ismaning', 0, 697);
insert into TEAM (team_number, name, religious, commander_id)
values (298, 'Woodland Hills', 1, 698);
insert into TEAM (team_number, name, religious, commander_id)
values (299, 'Summerside', 1, 699);
insert into TEAM (team_number, name, religious, commander_id)
values (300, 'Rorschach', 0, 700);
commit;
prompt 300 records committed...
insert into TEAM (team_number, name, religious, commander_id)
values (301, 'Kozani', 1, 701);
insert into TEAM (team_number, name, religious, commander_id)
values (302, 'Royston', 0, 702);
insert into TEAM (team_number, name, religious, commander_id)
values (303, 'Baltimore', 1, 703);
insert into TEAM (team_number, name, religious, commander_id)
values (304, 'NeuchÃƒÆ’Ã‚Â¢tel', 0, 704);
insert into TEAM (team_number, name, religious, commander_id)
values (305, 'Boulogne', 1, 705);
insert into TEAM (team_number, name, religious, commander_id)
values (306, 'Kreuzau', 1, 706);
insert into TEAM (team_number, name, religious, commander_id)
values (307, 'Dreieich', 0, 707);
insert into TEAM (team_number, name, religious, commander_id)
values (308, 'Limeira', 1, 708);
insert into TEAM (team_number, name, religious, commander_id)
values (309, 'Vancouver', 0, 709);
insert into TEAM (team_number, name, religious, commander_id)
values (310, 'Canberra', 0, 710);
insert into TEAM (team_number, name, religious, commander_id)
values (311, 'N. ft. Myers', 0, 711);
insert into TEAM (team_number, name, religious, commander_id)
values (312, 'Newnan', 1, 712);
insert into TEAM (team_number, name, religious, commander_id)
values (313, 'Kochi', 1, 713);
insert into TEAM (team_number, name, religious, commander_id)
values (314, 'Adamstown', 1, 714);
insert into TEAM (team_number, name, religious, commander_id)
values (315, 'Kista', 1, 715);
insert into TEAM (team_number, name, religious, commander_id)
values (316, 'GenÃƒÆ’Ã‚Â¨ve', 1, 716);
insert into TEAM (team_number, name, religious, commander_id)
values (317, 'Wavre', 0, 717);
insert into TEAM (team_number, name, religious, commander_id)
values (318, 'Oklahoma city', 1, 718);
insert into TEAM (team_number, name, religious, commander_id)
values (319, 'Rtp', 1, 719);
insert into TEAM (team_number, name, religious, commander_id)
values (320, 'Coslada', 1, 720);
insert into TEAM (team_number, name, religious, commander_id)
values (321, 'Englewood Cliffs', 1, 721);
insert into TEAM (team_number, name, religious, commander_id)
values (322, 'Edenbridge', 0, 722);
insert into TEAM (team_number, name, religious, commander_id)
values (323, 'Cary', 1, 723);
insert into TEAM (team_number, name, religious, commander_id)
values (324, 'Pulheim-brauweiler', 1, 724);
insert into TEAM (team_number, name, religious, commander_id)
values (325, 'Portland', 1, 725);
insert into TEAM (team_number, name, religious, commander_id)
values (326, 'Redmond', 1, 726);
insert into TEAM (team_number, name, religious, commander_id)
values (327, 'Yamaguchi', 0, 727);
insert into TEAM (team_number, name, religious, commander_id)
values (328, 'Sugar Land', 1, 728);
insert into TEAM (team_number, name, religious, commander_id)
values (329, 'Rueil-Malmaison', 1, 729);
insert into TEAM (team_number, name, religious, commander_id)
values (330, 'Santana do parnaÃƒÆ’Ã‚Â­ba', 1, 730);
insert into TEAM (team_number, name, religious, commander_id)
values (331, 'Veenendaal', 0, 731);
insert into TEAM (team_number, name, religious, commander_id)
values (332, 'Syracuse', 1, 732);
insert into TEAM (team_number, name, religious, commander_id)
values (333, 'Thessaloniki', 1, 733);
insert into TEAM (team_number, name, religious, commander_id)
values (334, 'Orleans', 1, 734);
insert into TEAM (team_number, name, religious, commander_id)
values (335, 'Aomori', 0, 735);
insert into TEAM (team_number, name, religious, commander_id)
values (336, 'Narrows', 0, 736);
insert into TEAM (team_number, name, religious, commander_id)
values (337, 'Monroe', 0, 737);
insert into TEAM (team_number, name, religious, commander_id)
values (338, 'North Yorkshire', 1, 738);
insert into TEAM (team_number, name, religious, commander_id)
values (339, 'MÃƒÆ’Ã‚Â¶nchengladbach', 0, 739);
insert into TEAM (team_number, name, religious, commander_id)
values (340, 'Denver', 0, 740);
insert into TEAM (team_number, name, religious, commander_id)
values (341, 'Lippetal', 1, 741);
insert into TEAM (team_number, name, religious, commander_id)
values (342, 'Sheffield', 0, 742);
insert into TEAM (team_number, name, religious, commander_id)
values (343, 'Monterey', 1, 743);
insert into TEAM (team_number, name, religious, commander_id)
values (344, 'Fredericia', 0, 744);
insert into TEAM (team_number, name, religious, commander_id)
values (345, 'Lima', 0, 745);
insert into TEAM (team_number, name, religious, commander_id)
values (346, 'Herzogenrath', 1, 746);
insert into TEAM (team_number, name, religious, commander_id)
values (347, 'Heubach', 1, 747);
insert into TEAM (team_number, name, religious, commander_id)
values (348, 'Carlin', 1, 748);
insert into TEAM (team_number, name, religious, commander_id)
values (349, 'Sulzbach', 1, 749);
insert into TEAM (team_number, name, religious, commander_id)
values (350, 'Pecs', 0, 750);
insert into TEAM (team_number, name, religious, commander_id)
values (351, 'Rtp', 1, 751);
insert into TEAM (team_number, name, religious, commander_id)
values (352, 'Washington', 0, 752);
insert into TEAM (team_number, name, religious, commander_id)
values (353, 'Ohtsu', 1, 753);
insert into TEAM (team_number, name, religious, commander_id)
values (354, 'Americana', 0, 754);
insert into TEAM (team_number, name, religious, commander_id)
values (355, 'Loveland', 1, 755);
insert into TEAM (team_number, name, religious, commander_id)
values (356, 'Tulsa', 0, 756);
insert into TEAM (team_number, name, religious, commander_id)
values (357, 'Campinas', 1, 757);
insert into TEAM (team_number, name, religious, commander_id)
values (358, 'Birmingham', 1, 758);
insert into TEAM (team_number, name, religious, commander_id)
values (359, 'Trieste', 0, 759);
insert into TEAM (team_number, name, religious, commander_id)
values (360, 'Matsue', 0, 760);
insert into TEAM (team_number, name, religious, commander_id)
values (361, 'Trieste', 0, 761);
insert into TEAM (team_number, name, religious, commander_id)
values (362, 'Hamburg', 1, 762);
insert into TEAM (team_number, name, religious, commander_id)
values (363, 'Saitama', 0, 763);
insert into TEAM (team_number, name, religious, commander_id)
values (364, 'Ciudad del Este', 1, 764);
insert into TEAM (team_number, name, religious, commander_id)
values (365, 'Natal', 1, 765);
insert into TEAM (team_number, name, religious, commander_id)
values (366, 'Runcorn', 0, 766);
insert into TEAM (team_number, name, religious, commander_id)
values (367, 'Zuerich', 1, 767);
insert into TEAM (team_number, name, religious, commander_id)
values (368, 'Spring Valley', 0, 768);
insert into TEAM (team_number, name, religious, commander_id)
values (369, 'Belgrad', 1, 769);
insert into TEAM (team_number, name, religious, commander_id)
values (370, 'Maserada sul Piave', 1, 770);
insert into TEAM (team_number, name, religious, commander_id)
values (371, 'Park Ridge', 0, 771);
insert into TEAM (team_number, name, religious, commander_id)
values (372, 'Solon', 0, 772);
insert into TEAM (team_number, name, religious, commander_id)
values (373, 'Atlanta', 1, 773);
insert into TEAM (team_number, name, religious, commander_id)
values (374, 'Bay Shore', 1, 774);
insert into TEAM (team_number, name, religious, commander_id)
values (375, 'Mendoza', 1, 775);
insert into TEAM (team_number, name, religious, commander_id)
values (376, 'Oosterhout', 0, 776);
insert into TEAM (team_number, name, religious, commander_id)
values (377, 'Bend', 1, 777);
insert into TEAM (team_number, name, religious, commander_id)
values (378, 'Balmoral', 0, 778);
insert into TEAM (team_number, name, religious, commander_id)
values (379, 'Dallas', 1, 779);
insert into TEAM (team_number, name, religious, commander_id)
values (380, 'Uden', 0, 780);
insert into TEAM (team_number, name, religious, commander_id)
values (381, 'Long Island City', 0, 781);
insert into TEAM (team_number, name, religious, commander_id)
values (382, 'Richardson', 1, 782);
insert into TEAM (team_number, name, religious, commander_id)
values (383, 'New York City', 1, 783);
insert into TEAM (team_number, name, religious, commander_id)
values (384, 'Derwood', 0, 784);
insert into TEAM (team_number, name, religious, commander_id)
values (385, 'VisselhÃƒÆ’Ã‚Â¶vede', 0, 785);
insert into TEAM (team_number, name, religious, commander_id)
values (386, 'Bedfordshire', 0, 786);
insert into TEAM (team_number, name, religious, commander_id)
values (387, 'Edenbridge', 1, 787);
insert into TEAM (team_number, name, religious, commander_id)
values (388, 'Sparrows Point', 1, 788);
insert into TEAM (team_number, name, religious, commander_id)
values (389, 'Kevelaer', 0, 789);
insert into TEAM (team_number, name, religious, commander_id)
values (390, 'Indianapolis', 1, 790);
insert into TEAM (team_number, name, religious, commander_id)
values (391, 'Mapo-gu', 0, 791);
insert into TEAM (team_number, name, religious, commander_id)
values (392, 'Pasadena', 1, 792);
insert into TEAM (team_number, name, religious, commander_id)
values (393, 'Slmea', 1, 793);
insert into TEAM (team_number, name, religious, commander_id)
values (394, 'Johannesburg', 1, 794);
insert into TEAM (team_number, name, religious, commander_id)
values (395, 'Brno', 0, 795);
insert into TEAM (team_number, name, religious, commander_id)
values (396, 'Mayfield Village', 0, 796);
insert into TEAM (team_number, name, religious, commander_id)
values (397, 'Kopavogur', 1, 797);
insert into TEAM (team_number, name, religious, commander_id)
values (398, 'Uden', 0, 798);
insert into TEAM (team_number, name, religious, commander_id)
values (399, 'Naha', 0, 799);
insert into TEAM (team_number, name, religious, commander_id)
values (400, 'Montreal', 0, 800);
commit;
prompt 400 records loaded
prompt Loading OPERATION...
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('03-04-2018', 'dd-mm-yyyy'), 'Israel', 281831537, 589, 189, 189);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('01-09-2003', 'dd-mm-yyyy'), 'Iran', 906652357, 590, 190, 190);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('06-06-2007', 'dd-mm-yyyy'), 'Israel', 208776255, 591, 191, 191);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('19-11-2003', 'dd-mm-yyyy'), 'Iran', 330197821, 592, 192, 192);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('18-07-2014', 'dd-mm-yyyy'), 'Iraq', 221126803, 593, 193, 193);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('25-05-2012', 'dd-mm-yyyy'), 'Saudi Arabia', 670847040, 594, 194, 194);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('22-04-1996', 'dd-mm-yyyy'), 'Lebanon', 765974314, 595, 195, 195);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('18-07-2023', 'dd-mm-yyyy'), 'Israel', 721577260, 596, 196, 196);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('15-03-2019', 'dd-mm-yyyy'), 'Israel', 69935916, 597, 197, 197);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('27-06-2022', 'dd-mm-yyyy'), 'Iraq', 523488177, 598, 198, 198);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('04-02-2010', 'dd-mm-yyyy'), 'Iraq', 546566306, 599, 199, 199);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('05-07-1996', 'dd-mm-yyyy'), 'Lebanon', 188733232, 600, 200, 200);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('13-12-2013', 'dd-mm-yyyy'), 'Israel', 723315838, 601, 201, 201);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('05-09-1989', 'dd-mm-yyyy'), 'Iraq', 338639497, 602, 202, 202);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('21-03-2004', 'dd-mm-yyyy'), 'Israel', 51438432, 603, 203, 203);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('24-09-2003', 'dd-mm-yyyy'), 'Saudi Arabia', 957431202, 604, 204, 204);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('18-04-2011', 'dd-mm-yyyy'), 'Iraq', 525729202, 605, 205, 205);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('05-09-2008', 'dd-mm-yyyy'), 'Lebanon', 896542250, 606, 206, 206);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('13-04-2015', 'dd-mm-yyyy'), 'Lebanon', 362260737, 607, 207, 207);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('28-06-1999', 'dd-mm-yyyy'), 'Israel', 425635888, 608, 208, 208);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('19-08-2016', 'dd-mm-yyyy'), 'Lebanon', 123888550, 609, 209, 209);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('04-09-2023', 'dd-mm-yyyy'), 'Israel', 926644996, 610, 210, 210);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('24-11-2015', 'dd-mm-yyyy'), 'Iraq', 207710257, 611, 211, 211);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('20-12-2011', 'dd-mm-yyyy'), 'Israel', 378904320, 612, 212, 212);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('19-03-2014', 'dd-mm-yyyy'), 'Iraq', 578389632, 613, 213, 213);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('09-04-2018', 'dd-mm-yyyy'), 'Iran', 499266194, 614, 214, 214);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('06-07-1993', 'dd-mm-yyyy'), 'Iraq', 608795720, 615, 215, 215);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('18-10-1988', 'dd-mm-yyyy'), 'Lebanon', 593474224, 616, 216, 216);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('28-08-1989', 'dd-mm-yyyy'), 'Iran', 937258771, 617, 217, 217);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('10-07-2022', 'dd-mm-yyyy'), 'Iran', 156514618, 618, 218, 218);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('09-05-2017', 'dd-mm-yyyy'), 'Lebanon', 931408822, 619, 219, 219);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('20-12-1994', 'dd-mm-yyyy'), 'Israel', 342672714, 620, 220, 220);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('29-08-2011', 'dd-mm-yyyy'), 'Iran', 724539291, 621, 221, 221);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('27-05-1986', 'dd-mm-yyyy'), 'Lebanon', 423092577, 622, 222, 222);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('02-07-1989', 'dd-mm-yyyy'), 'Israel', 424227056, 623, 223, 223);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('08-06-1998', 'dd-mm-yyyy'), 'Iraq', 572270291, 624, 224, 224);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('13-02-2015', 'dd-mm-yyyy'), 'Iraq', 47041999, 625, 225, 225);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('14-10-2007', 'dd-mm-yyyy'), 'Iraq', 587606956, 626, 226, 226);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('26-08-1994', 'dd-mm-yyyy'), 'Israel', 570093104, 627, 227, 227);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('20-04-2009', 'dd-mm-yyyy'), 'Lebanon', 760405163, 628, 228, 228);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('03-10-1990', 'dd-mm-yyyy'), 'Saudi Arabia', 272384739, 629, 229, 229);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('18-11-2008', 'dd-mm-yyyy'), 'Iran', 895013054, 630, 230, 230);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('03-02-1989', 'dd-mm-yyyy'), 'Iran', 828995800, 631, 231, 231);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('29-05-2022', 'dd-mm-yyyy'), 'Saudi Arabia', 727702875, 632, 232, 232);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('06-01-2009', 'dd-mm-yyyy'), 'Lebanon', 481446008, 633, 233, 233);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('25-08-1992', 'dd-mm-yyyy'), 'Saudi Arabia', 540816254, 634, 234, 234);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('09-01-1997', 'dd-mm-yyyy'), 'Lebanon', 600777644, 635, 235, 235);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('25-09-2002', 'dd-mm-yyyy'), 'Iran', 913216245, 636, 236, 236);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('02-11-2022', 'dd-mm-yyyy'), 'Iraq', 148357630, 637, 237, 237);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('18-07-1992', 'dd-mm-yyyy'), 'Lebanon', 107656486, 638, 238, 238);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('10-02-2003', 'dd-mm-yyyy'), 'Iraq', 485693887, 639, 239, 239);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('20-11-2006', 'dd-mm-yyyy'), 'Lebanon', 881810626, 640, 240, 240);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('09-07-1988', 'dd-mm-yyyy'), 'Israel', 751161490, 641, 241, 241);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('30-10-2008', 'dd-mm-yyyy'), 'Lebanon', 334900522, 642, 242, 242);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('01-01-1988', 'dd-mm-yyyy'), 'Israel', 170948176, 643, 243, 243);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('11-09-1997', 'dd-mm-yyyy'), 'Iraq', 78619465, 644, 244, 244);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('03-10-1995', 'dd-mm-yyyy'), 'Iran', 266255344, 645, 245, 245);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('02-03-2000', 'dd-mm-yyyy'), 'Iran', 361867065, 646, 246, 246);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('04-03-2017', 'dd-mm-yyyy'), 'Lebanon', 521329755, 647, 247, 247);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('13-07-2010', 'dd-mm-yyyy'), 'Israel', 96195184, 648, 248, 248);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('12-09-1990', 'dd-mm-yyyy'), 'Israel', 749752669, 649, 249, 249);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('23-02-2009', 'dd-mm-yyyy'), 'Israel', 835309664, 650, 250, 250);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('18-05-1991', 'dd-mm-yyyy'), 'Lebanon', 702077247, 651, 251, 251);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('27-12-2013', 'dd-mm-yyyy'), 'Iran', 969980375, 652, 252, 252);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('02-07-2011', 'dd-mm-yyyy'), 'Saudi Arabia', 458881605, 653, 253, 253);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('10-03-2003', 'dd-mm-yyyy'), 'Iran', 521782439, 654, 254, 254);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('05-06-2002', 'dd-mm-yyyy'), 'Israel', 412093971, 655, 255, 255);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('13-01-1987', 'dd-mm-yyyy'), 'Saudi Arabia', 267724300, 656, 256, 256);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('10-09-1993', 'dd-mm-yyyy'), 'Iraq', 216547930, 657, 257, 257);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('10-10-1996', 'dd-mm-yyyy'), 'Israel', 315513608, 658, 258, 258);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('21-03-1986', 'dd-mm-yyyy'), 'Iran', 555639849, 659, 259, 259);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('30-08-2003', 'dd-mm-yyyy'), 'Lebanon', 988469708, 660, 260, 260);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('28-05-2006', 'dd-mm-yyyy'), 'Israel', 972187114, 661, 261, 261);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('15-01-2017', 'dd-mm-yyyy'), 'Iraq', 782411841, 662, 262, 262);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('22-03-1987', 'dd-mm-yyyy'), 'Iran', 930624856, 663, 263, 263);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('29-10-2008', 'dd-mm-yyyy'), 'Iran', 536734965, 664, 264, 264);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('20-04-1996', 'dd-mm-yyyy'), 'Israel', 762030440, 665, 265, 265);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('14-03-1991', 'dd-mm-yyyy'), 'Lebanon', 630830421, 666, 266, 266);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('22-09-2018', 'dd-mm-yyyy'), 'Iraq', 761629041, 667, 267, 267);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('18-01-1993', 'dd-mm-yyyy'), 'Iran', 287516495, 668, 268, 268);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('30-08-1997', 'dd-mm-yyyy'), 'Iran', 521910168, 669, 269, 269);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('19-03-1995', 'dd-mm-yyyy'), 'Lebanon', 749714210, 670, 270, 270);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('24-09-1994', 'dd-mm-yyyy'), 'Lebanon', 155774110, 671, 271, 271);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('01-01-1996', 'dd-mm-yyyy'), 'Lebanon', 507736532, 672, 272, 272);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('10-01-2022', 'dd-mm-yyyy'), 'Lebanon', 455728781, 673, 273, 273);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('09-11-1986', 'dd-mm-yyyy'), 'Israel', 704754442, 674, 274, 274);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('04-02-2024', 'dd-mm-yyyy'), 'Lebanon', 809571569, 675, 275, 275);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('12-01-2003', 'dd-mm-yyyy'), 'Israel', 649761192, 676, 276, 276);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('09-05-2020', 'dd-mm-yyyy'), 'Iran', 912717284, 677, 277, 277);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('15-12-1988', 'dd-mm-yyyy'), 'Iran', 833176316, 678, 278, 278);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('05-07-2002', 'dd-mm-yyyy'), 'Iraq', 544872435, 679, 279, 279);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('17-05-2003', 'dd-mm-yyyy'), 'Saudi Arabia', 282613844, 680, 280, 280);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('21-07-2008', 'dd-mm-yyyy'), 'Lebanon', 976607567, 681, 281, 281);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('18-06-2021', 'dd-mm-yyyy'), 'Iran', 327784407, 682, 282, 282);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('08-04-2021', 'dd-mm-yyyy'), 'Iran', 502043500, 683, 283, 283);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('25-06-2020', 'dd-mm-yyyy'), 'Saudi Arabia', 176508808, 684, 284, 284);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('23-11-1988', 'dd-mm-yyyy'), 'Lebanon', 219843831, 685, 285, 285);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('25-09-1987', 'dd-mm-yyyy'), 'Iraq', 950890887, 686, 286, 286);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('21-12-2001', 'dd-mm-yyyy'), 'Iran', 68495166, 687, 287, 287);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('19-10-2012', 'dd-mm-yyyy'), 'Lebanon', 306330355, 688, 288, 288);
commit;
prompt 100 records committed...
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('22-08-2011', 'dd-mm-yyyy'), 'Lebanon', 325958074, 689, 289, 289);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('12-01-2003', 'dd-mm-yyyy'), 'Saudi Arabia', 268751566, 690, 290, 290);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('24-08-2017', 'dd-mm-yyyy'), 'Iraq', 870685839, 691, 291, 291);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('15-11-2020', 'dd-mm-yyyy'), 'Saudi Arabia', 789682026, 692, 292, 292);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('23-11-1989', 'dd-mm-yyyy'), 'Saudi Arabia', 533234647, 693, 293, 293);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('20-04-1986', 'dd-mm-yyyy'), 'Lebanon', 547134733, 694, 294, 294);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('31-10-2001', 'dd-mm-yyyy'), 'Iraq', 407727888, 695, 295, 295);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('11-08-2010', 'dd-mm-yyyy'), 'Lebanon', 25131260, 696, 296, 296);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('28-06-2021', 'dd-mm-yyyy'), 'Lebanon', 102788861, 697, 297, 297);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('24-07-1997', 'dd-mm-yyyy'), 'Saudi Arabia', 698647818, 698, 298, 298);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('28-09-2013', 'dd-mm-yyyy'), 'Israel', 154720161, 699, 299, 299);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('04-02-2003', 'dd-mm-yyyy'), 'Iraq', 546274332, 700, 300, 300);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('01-07-1992', 'dd-mm-yyyy'), 'Iran', 264184669, 701, 301, 301);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('13-07-2005', 'dd-mm-yyyy'), 'Saudi Arabia', 922446869, 702, 302, 302);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('15-06-2014', 'dd-mm-yyyy'), 'Israel', 213932068, 703, 303, 303);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('12-04-1999', 'dd-mm-yyyy'), 'Saudi Arabia', 357246614, 704, 304, 304);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('16-07-2015', 'dd-mm-yyyy'), 'Iraq', 341716399, 705, 305, 305);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('05-06-2002', 'dd-mm-yyyy'), 'Iraq', 926953830, 706, 306, 306);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('08-10-1990', 'dd-mm-yyyy'), 'Iraq', 841964227, 707, 307, 307);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('11-06-1997', 'dd-mm-yyyy'), 'Lebanon', 765303134, 708, 308, 308);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('17-02-1990', 'dd-mm-yyyy'), 'Israel', 14479558, 709, 309, 309);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('14-11-1988', 'dd-mm-yyyy'), 'Israel', 876206645, 710, 310, 310);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('06-03-1986', 'dd-mm-yyyy'), 'Iran', 431010673, 711, 311, 311);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('04-04-2021', 'dd-mm-yyyy'), 'Iran', 976094462, 712, 312, 312);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('28-08-2013', 'dd-mm-yyyy'), 'Israel', 913355692, 713, 313, 313);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('21-06-2024', 'dd-mm-yyyy'), 'Israel', 450467164, 714, 314, 314);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('19-02-1998', 'dd-mm-yyyy'), 'Saudi Arabia', 772347621, 715, 315, 315);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('29-10-2007', 'dd-mm-yyyy'), 'Israel', 967262895, 716, 316, 316);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('10-09-1988', 'dd-mm-yyyy'), 'Iraq', 8036320, 717, 317, 317);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('08-07-2003', 'dd-mm-yyyy'), 'Lebanon', 661711868, 718, 318, 318);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('08-07-2022', 'dd-mm-yyyy'), 'Lebanon', 680173803, 719, 319, 319);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('10-01-2000', 'dd-mm-yyyy'), 'Israel', 405983964, 720, 320, 320);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('31-10-2018', 'dd-mm-yyyy'), 'Iran', 487210908, 721, 321, 321);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('04-10-1994', 'dd-mm-yyyy'), 'Lebanon', 314630401, 722, 322, 322);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('11-12-1989', 'dd-mm-yyyy'), 'Lebanon', 303927364, 723, 323, 323);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('10-02-2005', 'dd-mm-yyyy'), 'Lebanon', 626078251, 724, 324, 324);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('11-03-1997', 'dd-mm-yyyy'), 'Iran', 85043936, 725, 325, 325);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('14-04-2005', 'dd-mm-yyyy'), 'Iraq', 253756924, 726, 326, 326);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('26-05-2011', 'dd-mm-yyyy'), 'Israel', 707204310, 727, 327, 327);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('11-04-2022', 'dd-mm-yyyy'), 'Saudi Arabia', 930318516, 728, 328, 328);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('09-04-1999', 'dd-mm-yyyy'), 'Saudi Arabia', 57065997, 729, 329, 329);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('05-01-1988', 'dd-mm-yyyy'), 'Lebanon', 787359266, 730, 330, 330);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('10-05-1995', 'dd-mm-yyyy'), 'Saudi Arabia', 541403543, 731, 331, 331);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('17-09-2010', 'dd-mm-yyyy'), 'Lebanon', 733557140, 732, 332, 332);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('22-10-2020', 'dd-mm-yyyy'), 'Israel', 258603983, 733, 333, 333);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('21-02-1986', 'dd-mm-yyyy'), 'Saudi Arabia', 928710907, 734, 334, 334);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('23-03-2009', 'dd-mm-yyyy'), 'Lebanon', 892223425, 735, 335, 335);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('06-05-2008', 'dd-mm-yyyy'), 'Saudi Arabia', 312298878, 736, 336, 336);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('28-11-1989', 'dd-mm-yyyy'), 'Iraq', 28875319, 737, 337, 337);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('09-10-2005', 'dd-mm-yyyy'), 'Saudi Arabia', 345370755, 738, 338, 338);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('08-12-1998', 'dd-mm-yyyy'), 'Iraq', 627134939, 739, 339, 339);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('24-04-1997', 'dd-mm-yyyy'), 'Lebanon', 176343925, 740, 340, 340);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('29-05-2017', 'dd-mm-yyyy'), 'Iraq', 833871262, 741, 341, 341);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('09-06-1997', 'dd-mm-yyyy'), 'Iraq', 157095747, 742, 342, 342);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('10-12-2024', 'dd-mm-yyyy'), 'Iran', 821956383, 743, 343, 343);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('15-10-2018', 'dd-mm-yyyy'), 'Iraq', 328126297, 744, 344, 344);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('04-06-2001', 'dd-mm-yyyy'), 'Iraq', 871154270, 745, 345, 345);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('25-03-1986', 'dd-mm-yyyy'), 'Lebanon', 973011257, 746, 346, 346);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('06-12-1998', 'dd-mm-yyyy'), 'Israel', 94654649, 747, 347, 347);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('24-10-1996', 'dd-mm-yyyy'), 'Saudi Arabia', 925372519, 748, 348, 348);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('23-06-2012', 'dd-mm-yyyy'), 'Saudi Arabia', 89694422, 749, 349, 349);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('03-11-2009', 'dd-mm-yyyy'), 'Saudi Arabia', 808664325, 750, 350, 350);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('18-01-2021', 'dd-mm-yyyy'), 'Iran', 924498048, 751, 351, 351);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('04-03-1988', 'dd-mm-yyyy'), 'Iraq', 112705636, 752, 352, 352);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('14-08-2009', 'dd-mm-yyyy'), 'Lebanon', 327869908, 753, 353, 353);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('12-09-2001', 'dd-mm-yyyy'), 'Iran', 773584683, 754, 354, 354);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('18-06-2009', 'dd-mm-yyyy'), 'Israel', 284685710, 755, 355, 355);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('20-06-1986', 'dd-mm-yyyy'), 'Lebanon', 37819516, 756, 356, 356);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('02-07-2021', 'dd-mm-yyyy'), 'Saudi Arabia', 522756582, 757, 357, 357);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('05-12-1999', 'dd-mm-yyyy'), 'Israel', 669978609, 758, 358, 358);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('01-07-2014', 'dd-mm-yyyy'), 'Israel', 166578538, 759, 359, 359);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('08-01-2017', 'dd-mm-yyyy'), 'Iran', 317848493, 760, 360, 360);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('14-04-1986', 'dd-mm-yyyy'), 'Lebanon', 193831574, 761, 361, 361);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('14-11-2019', 'dd-mm-yyyy'), 'Iraq', 893180585, 762, 362, 362);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('11-09-2006', 'dd-mm-yyyy'), 'Iraq', 823656726, 763, 363, 363);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('26-02-2021', 'dd-mm-yyyy'), 'Lebanon', 471557302, 764, 364, 364);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('20-10-2013', 'dd-mm-yyyy'), 'Lebanon', 654215962, 765, 365, 365);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('26-06-1990', 'dd-mm-yyyy'), 'Israel', 274487771, 766, 366, 366);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('29-07-2004', 'dd-mm-yyyy'), 'Lebanon', 813328847, 767, 367, 367);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('02-01-2013', 'dd-mm-yyyy'), 'Iraq', 82976333, 768, 368, 368);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('22-06-2010', 'dd-mm-yyyy'), 'Saudi Arabia', 652581517, 769, 369, 369);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('31-08-2008', 'dd-mm-yyyy'), 'Saudi Arabia', 757002287, 770, 370, 370);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('22-11-2013', 'dd-mm-yyyy'), 'Iraq', 164717493, 771, 371, 371);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('09-12-1987', 'dd-mm-yyyy'), 'Saudi Arabia', 712107196, 772, 372, 372);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('10-10-1995', 'dd-mm-yyyy'), 'Iraq', 398846502, 773, 373, 373);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('28-06-2005', 'dd-mm-yyyy'), 'Iran', 45106316, 774, 374, 374);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('13-09-2000', 'dd-mm-yyyy'), 'Saudi Arabia', 250546480, 775, 375, 375);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('31-03-2007', 'dd-mm-yyyy'), 'Israel', 818323605, 776, 376, 376);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('02-04-1992', 'dd-mm-yyyy'), 'Iraq', 176785528, 777, 377, 377);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('28-10-1994', 'dd-mm-yyyy'), 'Israel', 618195007, 778, 378, 378);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('20-06-2013', 'dd-mm-yyyy'), 'Lebanon', 191254623, 779, 379, 379);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('02-09-1996', 'dd-mm-yyyy'), 'Iran', 212092565, 780, 380, 380);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('27-07-2018', 'dd-mm-yyyy'), 'Israel', 996678490, 781, 381, 381);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('15-10-2017', 'dd-mm-yyyy'), 'Iraq', 749292206, 782, 382, 382);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('02-03-1994', 'dd-mm-yyyy'), 'Iran', 869461063, 783, 383, 383);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('13-11-2014', 'dd-mm-yyyy'), 'Israel', 800640875, 784, 384, 384);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('29-10-2022', 'dd-mm-yyyy'), 'Iran', 991123550, 785, 385, 385);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('26-02-1998', 'dd-mm-yyyy'), 'Lebanon', 419173983, 786, 386, 386);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('05-12-1997', 'dd-mm-yyyy'), 'Iraq', 882907168, 787, 387, 387);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('13-12-2002', 'dd-mm-yyyy'), 'Iraq', 643191951, 788, 388, 388);
commit;
prompt 200 records committed...
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('10-04-1993', 'dd-mm-yyyy'), 'Saudi Arabia', 507139189, 789, 389, 389);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('13-06-2006', 'dd-mm-yyyy'), 'Iran', 266624985, 790, 390, 390);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('26-10-1990', 'dd-mm-yyyy'), 'Iran', 13999983, 791, 391, 391);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('15-09-2024', 'dd-mm-yyyy'), 'Iran', 581397947, 792, 392, 392);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('07-03-1986', 'dd-mm-yyyy'), 'Iraq', 97680319, 793, 393, 393);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('08-07-1997', 'dd-mm-yyyy'), 'Israel', 965452595, 794, 394, 394);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('05-10-2003', 'dd-mm-yyyy'), 'Lebanon', 44082250, 795, 395, 395);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('13-02-1989', 'dd-mm-yyyy'), 'Saudi Arabia', 960592200, 796, 396, 396);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('02-06-2015', 'dd-mm-yyyy'), 'Lebanon', 865693457, 797, 397, 397);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('17-10-2006', 'dd-mm-yyyy'), 'Iraq', 668883904, 798, 398, 398);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('31-08-1987', 'dd-mm-yyyy'), 'Israel', 990553997, 799, 399, 399);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('23-03-2001', 'dd-mm-yyyy'), 'Israel', 207486986, 800, 400, 400);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('11-09-2021', 'dd-mm-yyyy'), 'Lebanon', 56236410, 401, 1, 1);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('15-01-2018', 'dd-mm-yyyy'), 'Iran', 103783068, 402, 2, 2);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('27-04-2000', 'dd-mm-yyyy'), 'Israel', 178006457, 403, 3, 3);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('29-11-2021', 'dd-mm-yyyy'), 'Saudi Arabia', 807305860, 404, 4, 4);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('13-03-2013', 'dd-mm-yyyy'), 'Saudi Arabia', 390487922, 405, 5, 5);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('19-11-1993', 'dd-mm-yyyy'), 'Iran', 480230061, 406, 6, 6);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('31-07-2021', 'dd-mm-yyyy'), 'Lebanon', 122562959, 407, 7, 7);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('31-01-2000', 'dd-mm-yyyy'), 'Saudi Arabia', 49078312, 408, 8, 8);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('21-08-2001', 'dd-mm-yyyy'), 'Iran', 2519626, 409, 9, 9);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('22-01-2007', 'dd-mm-yyyy'), 'Iran', 825828625, 410, 10, 10);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('28-01-2002', 'dd-mm-yyyy'), 'Saudi Arabia', 555166836, 411, 11, 11);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('17-02-2014', 'dd-mm-yyyy'), 'Iraq', 762516816, 412, 12, 12);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('17-04-2019', 'dd-mm-yyyy'), 'Saudi Arabia', 431435265, 413, 13, 13);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('08-06-2007', 'dd-mm-yyyy'), 'Israel', 688459172, 414, 14, 14);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('14-07-2013', 'dd-mm-yyyy'), 'Saudi Arabia', 199883156, 415, 15, 15);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('15-04-2019', 'dd-mm-yyyy'), 'Iraq', 582463531, 416, 16, 16);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('11-09-2022', 'dd-mm-yyyy'), 'Iran', 121127558, 417, 17, 17);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('30-10-1989', 'dd-mm-yyyy'), 'Lebanon', 882592231, 418, 18, 18);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('05-08-2008', 'dd-mm-yyyy'), 'Lebanon', 100635534, 419, 19, 19);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('25-11-2019', 'dd-mm-yyyy'), 'Iran', 637798241, 420, 20, 20);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('23-12-2006', 'dd-mm-yyyy'), 'Lebanon', 235036494, 421, 21, 21);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('30-01-2009', 'dd-mm-yyyy'), 'Israel', 771576048, 422, 22, 22);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('11-04-1995', 'dd-mm-yyyy'), 'Israel', 594655844, 423, 23, 23);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('11-12-2017', 'dd-mm-yyyy'), 'Lebanon', 170151741, 424, 24, 24);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('13-06-1992', 'dd-mm-yyyy'), 'Israel', 182821698, 425, 25, 25);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('16-12-2021', 'dd-mm-yyyy'), 'Iran', 539181995, 426, 26, 26);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('14-05-2014', 'dd-mm-yyyy'), 'Iraq', 943160488, 427, 27, 27);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('11-09-2011', 'dd-mm-yyyy'), 'Iran', 305939519, 428, 28, 28);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('04-02-2002', 'dd-mm-yyyy'), 'Iran', 312073853, 429, 29, 29);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('18-03-1995', 'dd-mm-yyyy'), 'Iran', 91032792, 430, 30, 30);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('31-08-2005', 'dd-mm-yyyy'), 'Lebanon', 697378230, 431, 31, 31);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('12-10-2020', 'dd-mm-yyyy'), 'Lebanon', 747340770, 432, 32, 32);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('02-04-2023', 'dd-mm-yyyy'), 'Saudi Arabia', 468190194, 433, 33, 33);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('06-12-1987', 'dd-mm-yyyy'), 'Israel', 476538543, 434, 34, 34);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('29-08-2009', 'dd-mm-yyyy'), 'Israel', 128054583, 435, 35, 35);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('24-08-2006', 'dd-mm-yyyy'), 'Iraq', 397847708, 436, 36, 36);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('10-07-1995', 'dd-mm-yyyy'), 'Lebanon', 375539055, 437, 37, 37);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('29-01-2004', 'dd-mm-yyyy'), 'Israel', 971965586, 438, 38, 38);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('11-03-1991', 'dd-mm-yyyy'), 'Iraq', 296557775, 439, 39, 39);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('30-01-1996', 'dd-mm-yyyy'), 'Israel', 188010190, 440, 40, 40);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('22-09-1993', 'dd-mm-yyyy'), 'Saudi Arabia', 43038483, 441, 41, 41);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('04-10-2005', 'dd-mm-yyyy'), 'Israel', 215263150, 442, 42, 42);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('28-02-2024', 'dd-mm-yyyy'), 'Saudi Arabia', 595711264, 443, 43, 43);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('17-05-2023', 'dd-mm-yyyy'), 'Iran', 617000667, 444, 44, 44);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('16-06-2004', 'dd-mm-yyyy'), 'Iraq', 647273913, 445, 45, 45);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('09-08-2019', 'dd-mm-yyyy'), 'Lebanon', 33272825, 446, 46, 46);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('19-04-1987', 'dd-mm-yyyy'), 'Iraq', 838477820, 447, 47, 47);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('27-04-2023', 'dd-mm-yyyy'), 'Lebanon', 775624430, 448, 48, 48);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('06-07-1991', 'dd-mm-yyyy'), 'Saudi Arabia', 596279909, 449, 49, 49);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('02-06-2005', 'dd-mm-yyyy'), 'Lebanon', 851945855, 450, 50, 50);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('24-07-1997', 'dd-mm-yyyy'), 'Iraq', 222620172, 451, 51, 51);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('24-12-2011', 'dd-mm-yyyy'), 'Saudi Arabia', 866400181, 452, 52, 52);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('17-03-2019', 'dd-mm-yyyy'), 'Iraq', 727110961, 453, 53, 53);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('11-11-2023', 'dd-mm-yyyy'), 'Lebanon', 830193230, 454, 54, 54);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('14-09-2009', 'dd-mm-yyyy'), 'Saudi Arabia', 749463210, 455, 55, 55);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('15-01-2005', 'dd-mm-yyyy'), 'Israel', 486335911, 456, 56, 56);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('08-07-2017', 'dd-mm-yyyy'), 'Saudi Arabia', 840326353, 457, 57, 57);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('24-11-2001', 'dd-mm-yyyy'), 'Saudi Arabia', 107993598, 458, 58, 58);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('29-01-2023', 'dd-mm-yyyy'), 'Iran', 924882761, 459, 59, 59);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('18-03-1991', 'dd-mm-yyyy'), 'Iran', 188025089, 460, 60, 60);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('15-05-1991', 'dd-mm-yyyy'), 'Israel', 24514083, 461, 61, 61);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('27-03-2003', 'dd-mm-yyyy'), 'Israel', 809383984, 462, 62, 62);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('28-08-2006', 'dd-mm-yyyy'), 'Israel', 820645917, 463, 63, 63);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('02-11-2014', 'dd-mm-yyyy'), 'Israel', 84688167, 464, 64, 64);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('02-08-2004', 'dd-mm-yyyy'), 'Iraq', 473978856, 465, 65, 65);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('20-12-2009', 'dd-mm-yyyy'), 'Iraq', 690958333, 466, 66, 66);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('04-12-1988', 'dd-mm-yyyy'), 'Saudi Arabia', 824227930, 467, 67, 67);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('07-11-2002', 'dd-mm-yyyy'), 'Iran', 514784399, 468, 68, 68);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('09-06-2019', 'dd-mm-yyyy'), 'Saudi Arabia', 752719132, 469, 69, 69);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('09-04-1986', 'dd-mm-yyyy'), 'Lebanon', 576498849, 470, 70, 70);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('29-01-1989', 'dd-mm-yyyy'), 'Iraq', 655230670, 471, 71, 71);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('12-08-1994', 'dd-mm-yyyy'), 'Israel', 31818968, 472, 72, 72);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('27-07-1994', 'dd-mm-yyyy'), 'Lebanon', 707818243, 473, 73, 73);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('22-08-1990', 'dd-mm-yyyy'), 'Israel', 968365161, 474, 74, 74);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('04-09-2021', 'dd-mm-yyyy'), 'Israel', 476527642, 475, 75, 75);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('18-04-2000', 'dd-mm-yyyy'), 'Israel', 234970426, 476, 76, 76);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('02-12-1990', 'dd-mm-yyyy'), 'Iran', 485374562, 477, 77, 77);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('30-03-1996', 'dd-mm-yyyy'), 'Saudi Arabia', 476266295, 478, 78, 78);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('15-09-1987', 'dd-mm-yyyy'), 'Iran', 178260573, 479, 79, 79);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('14-12-2009', 'dd-mm-yyyy'), 'Saudi Arabia', 206163450, 480, 80, 80);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('19-11-2005', 'dd-mm-yyyy'), 'Iran', 352095750, 481, 81, 81);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('13-04-2024', 'dd-mm-yyyy'), 'Saudi Arabia', 954040453, 482, 82, 82);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('25-08-2015', 'dd-mm-yyyy'), 'Lebanon', 162812551, 483, 83, 83);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('08-04-2022', 'dd-mm-yyyy'), 'Israel', 569211907, 484, 84, 84);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('19-10-2006', 'dd-mm-yyyy'), 'Saudi Arabia', 275682049, 485, 85, 85);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('20-05-1996', 'dd-mm-yyyy'), 'Iran', 485067623, 486, 86, 86);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('17-02-1993', 'dd-mm-yyyy'), 'Iraq', 208882737, 487, 87, 87);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('29-09-2010', 'dd-mm-yyyy'), 'Iraq', 436657235, 488, 88, 88);
commit;
prompt 300 records committed...
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('27-06-2020', 'dd-mm-yyyy'), 'Iraq', 467123649, 489, 89, 89);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('27-06-2008', 'dd-mm-yyyy'), 'Lebanon', 606939974, 490, 90, 90);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('15-02-2003', 'dd-mm-yyyy'), 'Iraq', 242787629, 491, 91, 91);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('13-10-1988', 'dd-mm-yyyy'), 'Israel', 759927132, 492, 92, 92);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('04-07-1989', 'dd-mm-yyyy'), 'Lebanon', 338037115, 493, 93, 93);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('11-10-2022', 'dd-mm-yyyy'), 'Lebanon', 416015092, 494, 94, 94);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('21-10-1995', 'dd-mm-yyyy'), 'Lebanon', 95113900, 495, 95, 95);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('06-12-1993', 'dd-mm-yyyy'), 'Iraq', 848439561, 496, 96, 96);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('12-04-2012', 'dd-mm-yyyy'), 'Iran', 576165871, 497, 97, 97);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('17-07-2011', 'dd-mm-yyyy'), 'Israel', 442477007, 498, 98, 98);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('06-08-2000', 'dd-mm-yyyy'), 'Lebanon', 570847788, 499, 99, 99);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('28-03-2016', 'dd-mm-yyyy'), 'Lebanon', 73277067, 500, 100, 100);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('14-04-1995', 'dd-mm-yyyy'), 'Lebanon', 292169756, 501, 101, 101);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('03-01-1998', 'dd-mm-yyyy'), 'Lebanon', 436530044, 502, 102, 102);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('11-12-2008', 'dd-mm-yyyy'), 'Iraq', 411106056, 503, 103, 103);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('29-06-2022', 'dd-mm-yyyy'), 'Iran', 21056403, 504, 104, 104);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('14-12-2016', 'dd-mm-yyyy'), 'Iran', 440828632, 505, 105, 105);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('27-08-1994', 'dd-mm-yyyy'), 'Lebanon', 456350482, 506, 106, 106);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('22-11-1993', 'dd-mm-yyyy'), 'Iraq', 974593508, 507, 107, 107);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('09-10-2003', 'dd-mm-yyyy'), 'Israel', 613618476, 508, 108, 108);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('01-01-2022', 'dd-mm-yyyy'), 'Israel', 969785064, 509, 109, 109);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('29-05-2005', 'dd-mm-yyyy'), 'Saudi Arabia', 898421026, 510, 110, 110);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('04-06-1996', 'dd-mm-yyyy'), 'Israel', 716912076, 511, 111, 111);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('08-08-2022', 'dd-mm-yyyy'), 'Lebanon', 959163597, 512, 112, 112);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('17-04-2009', 'dd-mm-yyyy'), 'Israel', 398951058, 513, 113, 113);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('30-10-1994', 'dd-mm-yyyy'), 'Saudi Arabia', 360873097, 514, 114, 114);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('09-04-2023', 'dd-mm-yyyy'), 'Iran', 795846460, 515, 115, 115);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('14-09-2011', 'dd-mm-yyyy'), 'Saudi Arabia', 950457050, 516, 116, 116);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('11-06-2014', 'dd-mm-yyyy'), 'Iran', 783703858, 517, 117, 117);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('31-01-2010', 'dd-mm-yyyy'), 'Lebanon', 480461919, 518, 118, 118);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('20-07-2017', 'dd-mm-yyyy'), 'Saudi Arabia', 380751337, 519, 119, 119);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('16-12-2021', 'dd-mm-yyyy'), 'Saudi Arabia', 875729970, 520, 120, 120);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('20-11-2016', 'dd-mm-yyyy'), 'Iran', 264995813, 521, 121, 121);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('16-06-1988', 'dd-mm-yyyy'), 'Lebanon', 133799444, 522, 122, 122);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('11-06-2017', 'dd-mm-yyyy'), 'Israel', 494165129, 523, 123, 123);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('08-04-1989', 'dd-mm-yyyy'), 'Iraq', 557900534, 524, 124, 124);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('17-12-1988', 'dd-mm-yyyy'), 'Iran', 659503300, 525, 125, 125);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('24-07-2001', 'dd-mm-yyyy'), 'Saudi Arabia', 643470060, 526, 126, 126);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('29-10-2003', 'dd-mm-yyyy'), 'Saudi Arabia', 463775341, 527, 127, 127);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('27-04-2010', 'dd-mm-yyyy'), 'Iraq', 787740463, 528, 128, 128);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('19-04-2002', 'dd-mm-yyyy'), 'Iran', 792939716, 529, 129, 129);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('26-07-2020', 'dd-mm-yyyy'), 'Saudi Arabia', 879654136, 530, 130, 130);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('09-07-2000', 'dd-mm-yyyy'), 'Lebanon', 312860446, 531, 131, 131);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('16-06-2021', 'dd-mm-yyyy'), 'Lebanon', 66611845, 532, 132, 132);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('13-08-2004', 'dd-mm-yyyy'), 'Iran', 529657526, 533, 133, 133);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('22-02-2012', 'dd-mm-yyyy'), 'Iran', 397884367, 534, 134, 134);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('11-08-1986', 'dd-mm-yyyy'), 'Iran', 667333348, 535, 135, 135);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('21-03-2007', 'dd-mm-yyyy'), 'Iran', 924399253, 536, 136, 136);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('24-08-2020', 'dd-mm-yyyy'), 'Israel', 701664376, 537, 137, 137);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('16-10-2014', 'dd-mm-yyyy'), 'Iran', 3559931, 538, 138, 138);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('03-12-2008', 'dd-mm-yyyy'), 'Saudi Arabia', 7511403, 539, 139, 139);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('11-02-2003', 'dd-mm-yyyy'), 'Lebanon', 328262200, 540, 140, 140);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('10-10-2019', 'dd-mm-yyyy'), 'Saudi Arabia', 390178271, 541, 141, 141);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('18-12-2010', 'dd-mm-yyyy'), 'Iraq', 383843467, 542, 142, 142);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('27-09-1995', 'dd-mm-yyyy'), 'Iran', 342737996, 543, 143, 143);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('13-11-2024', 'dd-mm-yyyy'), 'Iraq', 947832880, 544, 144, 144);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('08-09-1989', 'dd-mm-yyyy'), 'Iran', 262846810, 545, 145, 145);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('26-12-2004', 'dd-mm-yyyy'), 'Israel', 697565854, 546, 146, 146);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('18-03-1991', 'dd-mm-yyyy'), 'Lebanon', 636980688, 547, 147, 147);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('17-02-1988', 'dd-mm-yyyy'), 'Iraq', 292484246, 548, 148, 148);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('28-01-2024', 'dd-mm-yyyy'), 'Lebanon', 919755490, 549, 149, 149);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('20-09-2024', 'dd-mm-yyyy'), 'Iraq', 263763817, 550, 150, 150);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('01-02-2019', 'dd-mm-yyyy'), 'Israel', 563530924, 551, 151, 151);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('06-04-2004', 'dd-mm-yyyy'), 'Iraq', 986293375, 552, 152, 152);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('22-03-2008', 'dd-mm-yyyy'), 'Saudi Arabia', 451350070, 553, 153, 153);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('24-07-2008', 'dd-mm-yyyy'), 'Israel', 739475327, 554, 154, 154);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('03-11-2002', 'dd-mm-yyyy'), 'Iraq', 416930303, 555, 155, 155);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('05-12-2004', 'dd-mm-yyyy'), 'Iran', 696325176, 556, 156, 156);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('25-11-2016', 'dd-mm-yyyy'), 'Iran', 661397990, 557, 157, 157);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('31-01-2017', 'dd-mm-yyyy'), 'Lebanon', 427417833, 558, 158, 158);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('19-01-2023', 'dd-mm-yyyy'), 'Iraq', 260248405, 559, 159, 159);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('09-06-1997', 'dd-mm-yyyy'), 'Iran', 479861381, 560, 160, 160);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('28-01-2014', 'dd-mm-yyyy'), 'Saudi Arabia', 658113868, 561, 161, 161);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('07-07-2009', 'dd-mm-yyyy'), 'Saudi Arabia', 604174290, 562, 162, 162);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('26-11-1993', 'dd-mm-yyyy'), 'Iran', 635837191, 563, 163, 163);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('25-01-2001', 'dd-mm-yyyy'), 'Lebanon', 566199864, 564, 164, 164);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('31-03-1988', 'dd-mm-yyyy'), 'Lebanon', 766574045, 565, 165, 165);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('28-10-1994', 'dd-mm-yyyy'), 'Iraq', 9512013, 566, 166, 166);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('25-12-1994', 'dd-mm-yyyy'), 'Saudi Arabia', 417686960, 567, 167, 167);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('11-12-2010', 'dd-mm-yyyy'), 'Israel', 838649277, 568, 168, 168);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('28-05-1990', 'dd-mm-yyyy'), 'Iran', 965545202, 569, 169, 169);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('08-02-2012', 'dd-mm-yyyy'), 'Israel', 887459329, 570, 170, 170);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('01-10-2008', 'dd-mm-yyyy'), 'Saudi Arabia', 633508864, 571, 171, 171);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('19-01-1995', 'dd-mm-yyyy'), 'Israel', 532343981, 572, 172, 172);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('10-01-2019', 'dd-mm-yyyy'), 'Iraq', 301852033, 573, 173, 173);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('28-07-1989', 'dd-mm-yyyy'), 'Saudi Arabia', 219765060, 574, 174, 174);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('11-07-2007', 'dd-mm-yyyy'), 'Iran', 334668995, 575, 175, 175);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('08-07-2017', 'dd-mm-yyyy'), 'Iraq', 913504308, 576, 176, 176);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('28-06-2018', 'dd-mm-yyyy'), 'Saudi Arabia', 985408981, 577, 177, 177);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('03-04-2009', 'dd-mm-yyyy'), 'Israel', 42365798, 578, 178, 178);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('01-08-2017', 'dd-mm-yyyy'), 'Israel', 842099023, 579, 179, 179);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('27-04-2006', 'dd-mm-yyyy'), 'Israel', 955767124, 580, 180, 180);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('13-11-1993', 'dd-mm-yyyy'), 'Saudi Arabia', 118041048, 581, 181, 181);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('04-05-1993', 'dd-mm-yyyy'), 'Iran', 985486009, 582, 182, 182);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('18-12-1992', 'dd-mm-yyyy'), 'Lebanon', 946308414, 583, 183, 183);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('26-11-2018', 'dd-mm-yyyy'), 'Iraq', 279211708, 584, 184, 184);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('25-12-2020', 'dd-mm-yyyy'), 'Iraq', 259218647, 585, 185, 185);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('18-08-2021', 'dd-mm-yyyy'), 'Saudi Arabia', 427995945, 586, 186, 186);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('20-12-2003', 'dd-mm-yyyy'), 'Lebanon', 889623187, 587, 187, 187);
insert into OPERATION (operation_date, location, operation_id, commander_id, medic_id, team_number)
values (to_date('16-06-1997', 'dd-mm-yyyy'), 'Iraq', 867705942, 588, 188, 188);
commit;
prompt 400 records loaded
prompt Loading SOLIDER_IN...
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 221, 661);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 222, 664);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 223, 667);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 224, 670);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 225, 673);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 226, 676);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 227, 679);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 228, 682);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 229, 685);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 230, 688);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 231, 691);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 232, 694);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 233, 697);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 234, 700);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 235, 703);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 236, 706);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 237, 709);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 238, 712);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 239, 715);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 240, 718);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 241, 721);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 242, 724);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 243, 727);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 244, 730);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 245, 733);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 246, 736);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 247, 739);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 248, 742);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 249, 745);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 250, 748);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 251, 751);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 252, 754);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 253, 757);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 254, 760);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 255, 763);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 256, 766);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 257, 769);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 258, 772);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 259, 775);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 260, 778);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 261, 781);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 262, 784);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 263, 787);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 264, 790);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 265, 793);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 266, 796);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 267, 799);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 268, 802);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 269, 805);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 270, 808);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 271, 811);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 272, 814);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 273, 817);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 274, 820);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 275, 823);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 276, 826);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 277, 829);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 278, 832);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 279, 835);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 280, 838);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 281, 841);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 282, 844);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 283, 847);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 284, 850);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 285, 853);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 286, 856);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 287, 859);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 288, 862);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 289, 865);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 290, 868);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 291, 871);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 292, 874);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 293, 877);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 294, 880);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 295, 883);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 296, 886);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 297, 889);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 298, 892);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 299, 895);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 300, 898);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 301, 901);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 302, 904);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 303, 907);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 304, 910);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 305, 913);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 306, 916);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 307, 919);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 308, 922);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 309, 925);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 310, 928);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 311, 931);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 312, 934);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 313, 937);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 314, 940);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 315, 943);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 316, 946);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 317, 949);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 318, 952);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 319, 955);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 320, 958);
commit;
prompt 100 records committed...
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 321, 961);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 322, 964);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 323, 967);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 324, 970);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 325, 973);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 326, 976);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 327, 979);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 328, 982);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 329, 985);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 330, 988);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 331, 991);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 332, 994);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 333, 997);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 334, 1000);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 335, 1003);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 336, 1006);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 337, 1009);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 338, 1012);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 339, 1015);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 340, 1018);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 341, 1021);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 342, 1024);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 343, 1027);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 344, 1030);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 345, 1033);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 346, 1036);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 347, 1039);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 348, 1042);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 349, 1045);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 350, 1048);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 351, 1051);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 352, 1054);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 353, 1057);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 354, 1060);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 355, 1063);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 356, 1066);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 357, 1069);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 358, 1072);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 359, 1075);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 360, 1078);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 361, 1081);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 362, 1084);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 363, 1087);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 364, 1090);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 365, 1093);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 366, 1096);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 367, 1099);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 368, 1102);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 369, 1105);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 370, 1108);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 371, 1111);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 372, 1114);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 373, 1117);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 374, 1120);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 375, 1123);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 376, 1126);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 377, 1129);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 378, 1132);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 379, 1135);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 380, 1138);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 381, 1141);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 382, 1144);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 383, 1147);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 384, 1150);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 385, 1153);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 386, 1156);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 387, 1159);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 388, 1162);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 389, 1165);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 390, 1168);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 391, 1171);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 392, 1174);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 393, 1177);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 394, 1180);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 395, 1183);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 396, 1186);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 397, 1189);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 398, 1192);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 399, 1195);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 400, 1198);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Tactical', 1, 3);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 2, 5);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Support', 1, 4);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 2, 6);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 3, 8);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Platoon Leader', 1, 5);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 2, 7);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 3, 9);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 4, 11);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Squad Leader', 1, 800);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 2, 805);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 3, 810);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 4, 815);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 5, 820);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 6, 825);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 7, 830);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 8, 835);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 9, 840);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 10, 845);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 11, 850);
commit;
prompt 200 records committed...
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 12, 855);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 13, 860);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 14, 865);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 15, 870);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 16, 875);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 17, 880);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 18, 885);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 19, 890);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 20, 895);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 21, 900);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 22, 905);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 23, 910);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 24, 915);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 25, 920);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 26, 925);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 27, 930);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 28, 935);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 29, 940);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 30, 945);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 31, 950);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 32, 955);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 33, 960);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 34, 965);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 35, 970);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 36, 975);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 37, 980);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 38, 985);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 39, 990);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 40, 995);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 41, 1000);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 42, 1005);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 43, 1010);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 44, 1015);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 45, 1020);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 46, 1025);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 47, 1030);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 48, 1035);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 49, 1040);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 50, 1045);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 51, 1050);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 52, 1055);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 53, 1060);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 54, 1065);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 55, 1070);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 56, 1075);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 57, 1080);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 58, 1085);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 59, 1090);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 60, 1095);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 61, 1100);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 62, 1105);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 63, 1110);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 64, 1115);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 65, 1120);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 66, 1125);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 67, 1130);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 68, 1135);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 69, 1140);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 70, 1145);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 71, 1150);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 72, 1155);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 73, 1160);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 74, 1165);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 75, 1170);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 76, 1175);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 77, 1180);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 78, 1185);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 79, 1190);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 80, 1195);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 81, 1200);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Squad Leader', 1, 1);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 2, 4);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 3, 7);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 4, 10);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 5, 13);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 6, 16);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 7, 19);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 8, 22);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 9, 25);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 10, 28);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 11, 31);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 12, 34);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 13, 37);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 14, 40);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 15, 43);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 16, 46);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 17, 49);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 18, 52);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 19, 55);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 20, 58);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 21, 61);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 22, 64);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 23, 67);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 24, 70);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 25, 73);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 26, 76);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 27, 79);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 28, 82);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 29, 85);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 30, 88);
commit;
prompt 300 records committed...
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 31, 91);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 32, 94);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 33, 97);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 34, 100);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 35, 103);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 36, 106);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 37, 109);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 38, 112);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 39, 115);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 40, 118);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 41, 121);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 42, 124);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 43, 127);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 44, 130);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 45, 133);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 46, 136);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 47, 139);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 48, 142);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 49, 145);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 50, 148);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 51, 151);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 52, 154);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 53, 157);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 54, 160);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 55, 163);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 56, 166);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 57, 169);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 58, 172);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 59, 175);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 60, 178);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 61, 181);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 62, 184);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 63, 187);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 64, 190);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 65, 193);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 66, 196);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 67, 199);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 68, 202);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 69, 205);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 70, 208);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 71, 211);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 72, 214);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 73, 217);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 74, 220);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 75, 223);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 76, 226);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 77, 229);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 78, 232);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 79, 235);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 80, 238);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 81, 241);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 82, 244);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 83, 247);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 84, 250);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 85, 253);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 86, 256);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 87, 259);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 88, 262);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 89, 265);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 90, 268);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 91, 271);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 92, 274);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 93, 277);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 94, 280);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 95, 283);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 96, 286);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 97, 289);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 98, 292);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 99, 295);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 100, 298);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 101, 301);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 102, 304);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 103, 307);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 104, 310);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 105, 313);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 106, 316);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 107, 319);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 108, 322);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 109, 325);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 110, 328);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 111, 331);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 112, 334);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 113, 337);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 114, 340);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 115, 343);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 116, 346);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 117, 349);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 118, 352);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 119, 355);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 120, 358);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 121, 361);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 122, 364);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 123, 367);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 124, 370);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 125, 373);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 126, 376);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 127, 379);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 128, 382);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 129, 385);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 130, 388);
commit;
prompt 400 records committed...
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 131, 391);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 132, 394);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 133, 397);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 134, 400);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 135, 403);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 136, 406);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 137, 409);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 138, 412);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 139, 415);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 140, 418);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 141, 421);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 142, 424);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 143, 427);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 144, 430);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 145, 433);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 146, 436);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 147, 439);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 148, 442);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 149, 445);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 150, 448);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 151, 451);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 152, 454);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 153, 457);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 154, 460);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 155, 463);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 156, 466);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 157, 469);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 158, 472);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 159, 475);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 160, 478);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 161, 481);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 162, 484);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 163, 487);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 164, 490);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 165, 493);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 166, 496);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 167, 499);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 168, 502);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 169, 505);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 170, 508);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 171, 511);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 172, 514);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 173, 517);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 174, 520);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 175, 523);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 176, 526);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 177, 529);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 178, 532);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 179, 535);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 180, 538);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 181, 541);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 182, 544);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 183, 547);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 184, 550);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 185, 553);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 186, 556);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 187, 559);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 188, 562);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 189, 565);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 190, 568);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 191, 571);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 192, 574);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 193, 577);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 194, 580);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 195, 583);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 196, 586);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 197, 589);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 198, 592);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Forward Observer"', 199, 595);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Artillery Gunner"', 200, 598);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 201, 601);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 202, 604);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 203, 607);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 204, 610);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 205, 613);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 206, 616);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Communications Specialist"', 207, 619);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 208, 622);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 209, 625);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Special Forces Operator"', 210, 628);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 211, 631);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Intelligence Analyst"', 212, 634);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Armored Crewman"', 213, 637);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 214, 640);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 215, 643);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 216, 646);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Military Police Officer"', 217, 649);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('Infantry Soldier', 218, 652);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Sniper"', 219, 655);
insert into SOLIDER_IN (responsibility, team_number, id)
values ('"Combat Engineer"', 220, 658);
commit;
prompt 490 records loaded
prompt Enabling foreign key constraints for COMBAT_MEDIC...
alter table COMBAT_MEDIC enable constraint SYS_C008832;
prompt Enabling foreign key constraints for COMMANDER...
alter table COMMANDER enable constraint SYS_C008837;
prompt Enabling foreign key constraints for MILITARY_RABBI...
alter table MILITARY_RABBI enable constraint SYS_C008849;
prompt Enabling foreign key constraints for TEAM...
alter table TEAM enable constraint SYS_C008855;
prompt Enabling foreign key constraints for OPERATION...
alter table OPERATION enable constraint SYS_C008863;
alter table OPERATION enable constraint SYS_C008864;
alter table OPERATION enable constraint SYS_C008865;
prompt Enabling foreign key constraints for SOLIDER_IN...
alter table SOLIDER_IN enable constraint SYS_C008876;
alter table SOLIDER_IN enable constraint SYS_C008877;
prompt Enabling triggers for SOLIDER...
alter table SOLIDER enable all triggers;
prompt Enabling triggers for COMBAT_MEDIC...
alter table COMBAT_MEDIC enable all triggers;
prompt Enabling triggers for COMMANDER...
alter table COMMANDER enable all triggers;
prompt Enabling triggers for MILITARY_RABBI...
alter table MILITARY_RABBI enable all triggers;
prompt Enabling triggers for TEAM...
alter table TEAM enable all triggers;
prompt Enabling triggers for OPERATION...
alter table OPERATION enable all triggers;
prompt Enabling triggers for SOLIDER_IN...
alter table SOLIDER_IN enable all triggers;

set feedback on
set define on
prompt Done
