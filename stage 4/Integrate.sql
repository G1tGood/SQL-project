-- rename out solider
ALTER TABLE solider RENAME TO combat_solider;
-- rename their solider
ALTER TABLE soldier RENAME TO non_combat_solider;
-- create relation between databases
CREATE TABLE combatmobil
(
  id INT NOT NULL,
  License_num INT NOT NULL,
  PRIMARY KEY (id, License_num),
  FOREIGN KEY (id) REFERENCES combat_medic(id),
  FOREIGN KEY (License_num) REFERENCES Vehicle(License_num)
);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (255, 6858460);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (53, 2263322);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (242, 6106673);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (266, 5268197);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (69, 1252307);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (23, 820497);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (219, 6780405);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (337, 5013867);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (311, 7728328);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (210, 2655453);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (166, 6434088);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (181, 1143545);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (226, 9789043);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (85, 89585);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (92, 8862863);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (268, 9478204);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (277, 4166002);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (4, 6331745);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (374, 9317135);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (158, 468949);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (121, 1008835);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (31, 8204852);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (366, 1050003);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (44, 6457605);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (227, 9106645);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (389, 3515883);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (28, 9106467);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (309, 1713552);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (121, 2637384);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (333, 259810);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (179, 9997443);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (318, 6863704);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (51, 4448179);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (250, 8599728);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (181, 5748523);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (25, 3445558);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (81, 7728328);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (182, 4242384);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (245, 8101870);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (9, 5240524);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (211, 4160015);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (377, 1332611);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (356, 7826899);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (342, 100977);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (316, 6148532);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (263, 1730552);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (233, 7407158);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (271, 6148532);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (317, 5891204);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (245, 9737638);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (311, 3903350);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (328, 9882079);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (173, 7407158);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (331, 203913);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (141, 781546);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (71, 9597274);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (100, 1134050);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (381, 1143545);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (225, 5393808);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (244, 400137);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (211, 2320681);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (384, 7042045);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (69, 5588517);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (165, 760298);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (389, 948978);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (349, 4064445);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (66, 6371476);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (334, 7388583);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (374, 6205163);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (239, 5644052);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (397, 1536470);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (272, 4206040);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (86, 3450908);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (315, 833752);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (167, 7344918);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (386, 8280458);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (164, 6605013);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (310, 5593265);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (356, 7680457);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (248, 1200643);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (339, 8589674);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (229, 8574769);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (204, 6154995);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (116, 2655453);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (20, 9555869);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (375, 6940155);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (209, 9000534);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (63, 8916145);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (318, 8160283);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (197, 1286143);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (167, 17769);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (342, 8650551);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (287, 34587);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (362, 7344918);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (221, 2362871);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (174, 2716400);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (192, 9470733);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (57, 2579625);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (140, 8697338);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (155, 6280402);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (200, 2954049);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (313, 9470733);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (33, 7885686);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (300, 9136483);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (101, 6780405);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (154, 7692374);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (71, 3369190);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (98, 8575589);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (50, 6434088);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (368, 8833337);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (45, 7692374);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (200, 6713792);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (333, 917703);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (113, 958320);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (348, 1841907);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (137, 6280402);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (163, 1073491);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (334, 7923744);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (379, 845731);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (45, 6858460);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (297, 5874843);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (17, 6809897);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (376, 8659729);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (40, 5240524);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (277, 6858460);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (62, 5891204);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (267, 5891204);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (394, 9136483);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (300, 4498357);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (380, 107225);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (353, 6224996);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (152, 2954049);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (112, 8473645);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (223, 3437143);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (214, 8575589);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (168, 9000534);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (122, 6333363);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (125, 9764203);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (240, 8587560);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (166, 7151509);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (350, 2462661);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (282, 1661610);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (182, 7952222);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (226, 3086877);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (390, 5303297);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (152, 135871);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (340, 1888784);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (300, 8599728);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (6, 7952222);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (74, 7460745);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (160, 6434088);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (142, 8968330);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (351, 3515883);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (121, 1332611);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (273, 8439543);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (75, 2390000);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (207, 5560877);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (176, 9248844);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (342, 1156648);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (175, 7923744);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (53, 3396764);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (24, 5017272);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (349, 4206040);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (285, 3464330);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (362, 2718272);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (286, 7680457);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (98, 8630751);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (50, 5560877);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (114, 8281810);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (158, 9451417);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (144, 5817082);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (177, 1768309);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (342, 5487537);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (395, 8280458);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (153, 1081215);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (126, 7077980);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (299, 4285963);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (302, 135871);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (277, 8280458);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (219, 1156648);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (252, 7005595);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (364, 948978);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (361, 5748523);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (178, 3267903);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (97, 4064445);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (92, 4312065);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (179, 9518051);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (84, 5891204);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (206, 2320681);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (298, 7246071);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (280, 9209256);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (168, 178532);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (92, 7042045);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (195, 7342564);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (275, 1308246);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (218, 5379078);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (104, 1063472);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (120, 3369190);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (143, 5483407);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (220, 2995613);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (142, 252525);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (285, 85780);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (157, 1308246);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (218, 5013867);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (205, 6781773);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (350, 2546532);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (241, 3518868);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (198, 4504165);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (352, 5007144);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (219, 8299737);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (354, 4788455);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (6, 9262116);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (103, 8696175);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (73, 8212464);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (291, 2320681);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (77, 820497);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (49, 1008835);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (9, 4963651);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (116, 5233360);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (204, 1134050);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (101, 6701159);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (121, 223090);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (14, 346877);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (320, 259810);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (356, 6940155);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (198, 94216);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (379, 9038481);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (112, 8587560);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (189, 9778096);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (245, 6702873);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (110, 9106467);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (254, 9027330);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (372, 4193758);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (237, 8650551);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (348, 5483407);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (76, 8656979);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (215, 765730);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (290, 3652508);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (31, 2558760);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (43, 6457605);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (138, 5525245);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (59, 3019313);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (70, 8730888);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (272, 8574769);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (61, 6329709);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (168, 9039434);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (159, 3267903);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (265, 4954909);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (22, 1847320);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (53, 5593265);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (205, 9862635);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (273, 9478204);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (221, 8281810);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (239, 4085184);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (380, 9929993);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (283, 4871686);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (87, 8473645);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (239, 51694);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (205, 9478204);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (228, 5888939);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (372, 7882275);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (79, 3571268);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (256, 1453977);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (226, 1705521);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (268, 1852051);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (245, 2730787);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (90, 8439543);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (39, 9112542);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (351, 6080905);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (59, 1252307);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (6, 9186864);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (161, 4931859);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (148, 7557672);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (78, 7706558);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (219, 9710338);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (130, 7830525);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (330, 4963651);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (119, 7557672);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (274, 6970240);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (65, 9882079);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (332, 6224996);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (106, 1526809);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (268, 1678269);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (227, 1852051);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (192, 803994);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (145, 4312065);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (310, 4064445);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (205, 914210);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (223, 9209256);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (225, 5196610);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (202, 9213814);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (131, 2151917);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (103, 6713792);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (339, 5167531);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (141, 8587560);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (311, 3981658);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (195, 9878547);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (238, 5393808);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (54, 4312065);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (93, 5007144);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (290, 406334);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (400, 9106467);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (350, 6096947);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (350, 4784396);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (171, 4931859);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (232, 5817082);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (99, 9977894);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (392, 8913831);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (13, 1920004);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (294, 9478204);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (244, 3457125);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (103, 5217624);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (194, 5067549);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (148, 803994);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (226, 914210);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (103, 3679440);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (143, 833752);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (232, 122858);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (39, 1888784);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (337, 1053593);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (206, 9338906);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (160, 5666700);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (114, 6457605);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (280, 6588610);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (137, 100977);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (245, 2320681);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (225, 6640162);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (383, 9574341);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (220, 6205163);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (249, 9168398);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (212, 9789043);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (326, 6891284);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (210, 8101870);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (156, 1252307);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (147, 8299737);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (111, 3362566);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (98, 3174874);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (176, 4448179);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (306, 3981658);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (370, 5881430);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (311, 9026510);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (360, 3679440);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (180, 7879457);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (303, 122858);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (123, 2819106);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (260, 3281978);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (101, 94216);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (39, 1526809);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (302, 6970869);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (194, 3790664);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (300, 6153270);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (227, 9026510);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (375, 1053593);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (151, 5162280);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (190, 1200643);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (40, 7952222);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (126, 5888939);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (314, 1008835);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (265, 5874843);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (17, 5593265);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (108, 415094);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (7, 728928);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (235, 3884043);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (125, 8212464);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (388, 2089203);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (272, 7353779);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (181, 4242384);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (243, 1050003);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (320, 2097159);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (66, 3140620);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (337, 9000548);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (276, 5017272);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (129, 7860361);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (87, 1008835);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (289, 5273188);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (289, 9149633);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (335, 7728328);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (223, 1443207);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (14, 4784396);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (272, 5644052);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (195, 9145834);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (224, 9155046);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (329, 9470733);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (326, 9997443);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (372, 17769);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (4, 9106645);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (375, 8412670);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (71, 9445722);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (222, 1453977);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (366, 8587560);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (120, 8599728);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (87, 765730);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (122, 7516609);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (145, 9365587);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (294, 8004359);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (177, 5017272);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (4, 765730);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (190, 6282853);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (137, 4931859);

insert into MERGED_BASNAT.COMBATMOBIL (ID, LICENSE_NUM)
values (46, 216642);

commit;