rem	***********************************************************************
rem	**  SQL statements to create tables used for the ELECTIONS database  **
rem	***********************************************************************

rem	**********************************************************************
rem	*********************   Drop existing tables   ***********************
rem	**********************************************************************

DROP TABLE ukresults CASCADE CONSTRAINTS;
DROP TABLE ukconsts CASCADE CONSTRAINTS;


rem	**********************************************************************
rem	******************   Create tables in the scheme   *******************
rem	**********************************************************************

CREATE TABLE ukconsts
	(uknum NUMBER(2),
	 ukarea VARCHAR2(40),
	 ukelectors NUMBER(6),
	 CONSTRAINTS ukconsts_pk PRIMARY KEY (uknum)
	);

CREATE TABLE ukresults
	(uknum number(2),
	 party VARCHAR2(20),
	 ukvotes NUMBER(6),
	 CONSTRAINT ukresults_pk PRIMARY KEY (uknum, party),
	 CONSTRAINT ukresults_fk FOREIGN KEY (uknum) REFERENCES ukconsts
	);


rem	**********************************************************************
rem	*****************   Populate Tables in the scheme   ******************
rem	**********************************************************************

INSERT INTO ukconsts VALUES (1, 'aberavon', 54129);
INSERT INTO ukconsts VALUES (2, 'aberdeen north', 63074);
INSERT INTO ukconsts VALUES (3, 'aberdeen south', 56531);
INSERT INTO ukconsts VALUES (4, 'aldershot', 71519);
INSERT INTO ukconsts VALUES (5, 'aldridge brownhills', 59098);
INSERT INTO ukconsts VALUES (6, 'altrincham and sale', 65013);
INSERT INTO ukconsts VALUES (7, 'amber valley', 64336);
INSERT INTO ukconsts VALUES (8, 'alyn and deeside', 56443);
INSERT INTO ukconsts VALUES (9, 'angus east', 58587);
INSERT INTO ukconsts VALUES (10, 'antrim east', 58985);
INSERT INTO ukconsts VALUES (11, 'antrim north', 62505);
INSERT INTO ukconsts VALUES (12, 'antrim south', 57277);
INSERT INTO ukconsts VALUES (13, 'argyll and bute', 47356);
INSERT INTO ukconsts VALUES (14, 'arundel', 67340);
INSERT INTO ukconsts VALUES (15, 'ashfield', 66566);
INSERT INTO ukconsts VALUES (16, 'ashford', 59690);
INSERT INTO ukconsts VALUES (17, 'ashton under lyne', 60272);
INSERT INTO ukconsts VALUES (18, 'aylesbury', 61981);
INSERT INTO ukconsts VALUES (19, 'ayr', 63894);
INSERT INTO ukconsts VALUES (20, 'banbury', 58010);
INSERT INTO ukconsts VALUES (21, 'banff and buchan', 58737);
INSERT INTO ukconsts VALUES (22, 'barking', 55807);
INSERT INTO ukconsts VALUES (23, 'barnsley central', 53305);
INSERT INTO ukconsts VALUES (24, 'barnsley east', 52368);
INSERT INTO ukconsts VALUES (25, 'barnsley west and penistone', 58564);
INSERT INTO ukconsts VALUES (26, 'barrow in furness', 66699);
INSERT INTO ukconsts VALUES (27, 'basildon', 56793);
INSERT INTO ukconsts VALUES (28, 'basingstoke', 60414);
INSERT INTO ukconsts VALUES (29, 'bassetlaw', 61807);
INSERT INTO ukconsts VALUES (30, 'bath', 62355);
INSERT INTO ukconsts VALUES (31, 'batley and spen', 71206);
INSERT INTO ukconsts VALUES (32, 'battesea', 71960);
INSERT INTO ukconsts VALUES (33, 'beaconsfield', 62918);
INSERT INTO ukconsts VALUES (34, 'beckenham', 59295);
INSERT INTO ukconsts VALUES (35, 'bedfordshire mid', 68171);
INSERT INTO ukconsts VALUES (36, 'bedfordshire north', 68202);
INSERT INTO ukconsts VALUES (37, 'bedfordshire south west', 65921);
INSERT INTO ukconsts VALUES (38, 'belfast east', 59207);
INSERT INTO ukconsts VALUES (39, 'belfast north', 65723);
INSERT INTO ukconsts VALUES (40, 'belfast south', 57938);
INSERT INTO ukconsts VALUES (41, 'belfast west', 61179);
INSERT INTO ukconsts VALUES (42, 'berkshire east', 66489);
INSERT INTO ukconsts VALUES (43, 'berwick upon tweed', 51714);
INSERT INTO ukconsts VALUES (44, 'bethnal green and stepney', 56702);
INSERT INTO ukconsts VALUES (45, 'beverley', 70460);
INSERT INTO ukconsts VALUES (46, 'bexhill and battle', 60409);
INSERT INTO ukconsts VALUES (47, 'bexleyheath', 59076);
INSERT INTO ukconsts VALUES (48, 'billericay', 64699);
INSERT INTO ukconsts VALUES (49, 'birkenhead', 71226);
INSERT INTO ukconsts VALUES (50, 'birmingham edgbaston', 56217);

INSERT INTO ukresults VALUES (1, 'con', 6605);
INSERT INTO ukresults VALUES (1, 'lab', 23745);
INSERT INTO ukresults VALUES (1, 'lib', 8206);
INSERT INTO ukresults VALUES (1, 'plaid', 1859);
INSERT INTO ukresults VALUES (2, 'con', 7426);
INSERT INTO ukresults VALUES (2, 'lab', 19262);
INSERT INTO ukresults VALUES (2, 'sdp', 10118);
INSERT INTO ukresults VALUES (2, 'snp', 3790);
INSERT INTO ukresults VALUES (2, 'eco', 367);
INSERT INTO ukresults VALUES (3, 'con', 15393);
INSERT INTO ukresults VALUES (3, 'lab', 11812);
INSERT INTO ukresults VALUES (3, 'sdp', 10372);
INSERT INTO ukresults VALUES (3, 'snp', 1974);
INSERT INTO ukresults VALUES (4, 'con', 31288);
INSERT INTO ukresults VALUES (4, 'lab', 6070);
INSERT INTO ukresults VALUES (4, 'lib', 19070);
INSERT INTO ukresults VALUES (5, 'con', 24148);
INSERT INTO ukresults VALUES (5, 'lab', 11864);
INSERT INTO ukresults VALUES (5, 'sdp', 11599);
INSERT INTO ukresults VALUES (6, 'con', 25321);
INSERT INTO ukresults VALUES (6, 'lab', 7684);
INSERT INTO ukresults VALUES (6, 'lib', 14410);
INSERT INTO ukresults VALUES (6, 'eco', 629);
INSERT INTO ukresults VALUES (6, 'ind', 152);
INSERT INTO ukresults VALUES (7, 'con', 21502);
INSERT INTO ukresults VALUES (7, 'lab', 18184);
INSERT INTO ukresults VALUES (7, 'lib', 10989);
INSERT INTO ukresults VALUES (7, 'ind', 856);
INSERT INTO ukresults VALUES (8, 'con', 16438);
INSERT INTO ukresults VALUES (8, 'lab', 17806);
INSERT INTO ukresults VALUES (8, 'sdp', 9535);
INSERT INTO ukresults VALUES (8, 'plaid', 413);
INSERT INTO ukresults VALUES (9, 'con', 19218);
INSERT INTO ukresults VALUES (9, 'lab', 3497);
INSERT INTO ukresults VALUES (9, 'sdp', 4978);
INSERT INTO ukresults VALUES (9, 'snp', 15691);
INSERT INTO ukresults VALUES (9, 'eco', 239);
INSERT INTO ukresults VALUES (10, 'oup', 14293);
INSERT INTO ukresults VALUES (10, 'dup', 13926);
INSERT INTO ukresults VALUES (10, 'alliance', 7620);
INSERT INTO ukresults VALUES (10, 'wp', 581);
INSERT INTO ukresults VALUES (10, 'sdlp', 1047);
INSERT INTO ukresults VALUES (10, 'ind', 741);
INSERT INTO ukresults VALUES (11, 'oup', 10749);
INSERT INTO ukresults VALUES (11, 'dup', 23922);
INSERT INTO ukresults VALUES (11, 'sdlp', 6193);
INSERT INTO ukresults VALUES (11, 'sf', 2860);
INSERT INTO ukresults VALUES (11, 'eco', 451);
INSERT INTO ukresults VALUES (12, 'oup', 17727);
INSERT INTO ukresults VALUES (12, 'dup', 10935);
INSERT INTO ukresults VALUES (12, 'alliance', 4612);
INSERT INTO ukresults VALUES (12, 'sdlp', 3377);
INSERT INTO ukresults VALUES (12, 'sf', 1629);
INSERT INTO ukresults VALUES (12, 'wp', 549);
INSERT INTO ukresults VALUES (13, 'con', 13380);
INSERT INTO ukresults VALUES (13, 'lab', 3204);
INSERT INTO ukresults VALUES (13, 'lib', 9536);
INSERT INTO ukresults VALUES (13, 'snp', 8514);
INSERT INTO ukresults VALUES (14, 'con', 31096);
INSERT INTO ukresults VALUES (14, 'lab', 4302);
INSERT INTO ukresults VALUES (14, 'lib', 15391);
INSERT INTO ukresults VALUES (14, 'cfcp', 1399);
INSERT INTO ukresults VALUES (15, 'con', 15772);
INSERT INTO ukresults VALUES (15, 'lab', 21859);
INSERT INTO ukresults VALUES (15, 'lib', 13812);
INSERT INTO ukresults VALUES (16, 'con', 27230);
INSERT INTO ukresults VALUES (16, 'lab', 6167);
INSERT INTO ukresults VALUES (16, 'sdp', 13319);
INSERT INTO ukresults VALUES (16, 'eco', 569);
INSERT INTO ukresults VALUES (16, 'bnp', 195);
INSERT INTO ukresults VALUES (16, 'nat_lab', 456);
INSERT INTO ukresults VALUES (17, 'con', 13290);
INSERT INTO ukresults VALUES (17, 'lab', 20987);
INSERT INTO ukresults VALUES (17, 'sdp', 7521);
INSERT INTO ukresults VALUES (17, 'rev_comm', 407);
INSERT INTO ukresults VALUES (18, 'con', 30230);
INSERT INTO ukresults VALUES (18, 'lab', 6364);
INSERT INTO ukresults VALUES (18, 'sdp', 15310);
INSERT INTO ukresults VALUES (18, 'ind', 166);
INSERT INTO ukresults VALUES (19, 'con', 21325);
INSERT INTO ukresults VALUES (19, 'lab', 13338);
INSERT INTO ukresults VALUES (19, 'lib', 12740);
INSERT INTO ukresults VALUES (19, 'snp', 2431);
INSERT INTO ukresults VALUES (20, 'con', 26225);
INSERT INTO ukresults VALUES (20, 'lab', 9343);
INSERT INTO ukresults VALUES (20, 'sdp', 13200);
INSERT INTO ukresults VALUES (20, 'loony_soc', 383);
INSERT INTO ukresults VALUES (21, 'con', 16072);
INSERT INTO ukresults VALUES (21, 'lab', 3150);
INSERT INTO ukresults VALUES (21, 'sdp', 6084);
INSERT INTO ukresults VALUES (21, 'snp', 15135);
INSERT INTO ukresults VALUES (22, 'con', 10389);
INSERT INTO ukresults VALUES (22, 'lab', 14415);
INSERT INTO ukresults VALUES (22, 'lib', 8770);
INSERT INTO ukresults VALUES (22, 'nf', 646);
INSERT INTO ukresults VALUES (23, 'con', 7674);
INSERT INTO ukresults VALUES (23, 'lab', 21847);
INSERT INTO ukresults VALUES (23, 'lib', 7011);
INSERT INTO ukresults VALUES (24, 'con', 5749);
INSERT INTO ukresults VALUES (24, 'lab', 23505);
INSERT INTO ukresults VALUES (24, 'lib', 6413);
INSERT INTO ukresults VALUES (25, 'con', 12218);
INSERT INTO ukresults VALUES (25, 'lab', 22560);
INSERT INTO ukresults VALUES (25, 'sdp', 9624);
INSERT INTO ukresults VALUES (26, 'con', 22284);
INSERT INTO ukresults VALUES (26, 'lab', 17707);
INSERT INTO ukresults VALUES (26, 'sdp', 11079);
INSERT INTO ukresults VALUES (27, 'con', 17516);
INSERT INTO ukresults VALUES (27, 'lab', 16137);
INSERT INTO ukresults VALUES (27, 'sdp', 11634);
INSERT INTO ukresults VALUES (28, 'con', 28381);
INSERT INTO ukresults VALUES (28, 'lab', 10646);
INSERT INTO ukresults VALUES (28, 'sdp', 15931);
INSERT INTO ukresults VALUES (28, 'bnp', 344);
INSERT INTO ukresults VALUES (29, 'con', 18400);
INSERT INTO ukresults VALUES (29, 'lab', 22231);
INSERT INTO ukresults VALUES (29, 'sdp', 8124);
INSERT INTO ukresults VALUES (30, 'con', 22544);
INSERT INTO ukresults VALUES (30, 'lab', 7259);
INSERT INTO ukresults VALUES (30, 'sdp', 17240);
INSERT INTO ukresults VALUES (30, 'prog_lib', 319);
INSERT INTO ukresults VALUES (30, 'eco', 441);
INSERT INTO ukresults VALUES (30, 'world_govt', 67);
INSERT INTO ukresults VALUES (31, 'con', 21433);
INSERT INTO ukresults VALUES (31, 'lab', 20563);
INSERT INTO ukresults VALUES (31, 'sdp', 11678);
INSERT INTO ukresults VALUES (31, 'eco', 493);
INSERT INTO ukresults VALUES (32, 'con', 15972);
INSERT INTO ukresults VALUES (32, 'lab', 19248);
INSERT INTO ukresults VALUES (32, 'sdp', 7675);
INSERT INTO ukresults VALUES (32, 'nf', 539);
INSERT INTO ukresults VALUES (32, 'eco', 377);
INSERT INTO ukresults VALUES (32, 'cbwu', 0);
INSERT INTO ukresults VALUES (32, 'community', 0);
INSERT INTO ukresults VALUES (33, 'con', 30552);
INSERT INTO ukresults VALUES (33, 'lab', 5107);
INSERT INTO ukresults VALUES (33, 'lib', 12252);
INSERT INTO ukresults VALUES (34, 'con', 23606);
INSERT INTO ukresults VALUES (34, 'lab', 6386);
INSERT INTO ukresults VALUES (34, 'lib', 10936);
INSERT INTO ukresults VALUES (34, 'bnp', 0);
INSERT INTO ukresults VALUES (35, 'con', 33042);
INSERT INTO ukresults VALUES (35, 'lab', 9420);
INSERT INTO ukresults VALUES (35, 'lib', 15661);
INSERT INTO ukresults VALUES (36, 'con', 27969);
INSERT INTO ukresults VALUES (36, 'lab', 11323);
INSERT INTO ukresults VALUES (36, 'lib', 14120);
INSERT INTO ukresults VALUES (36, 'ind', 344);
INSERT INTO ukresults VALUES (37, 'con', 31767);
INSERT INTO ukresults VALUES (37, 'lab', 16036);
INSERT INTO ukresults VALUES (37, 'sdp', 9899);
INSERT INTO ukresults VALUES (38, 'oup', 9642);
INSERT INTO ukresults VALUES (38, 'dup', 17631);
INSERT INTO ukresults VALUES (38, 'alliance', 9373);
INSERT INTO ukresults VALUES (38, 'sf', 682);
INSERT INTO ukresults VALUES (39, 'oup', 15339);
INSERT INTO ukresults VALUES (39, 'dup', 8260);
INSERT INTO ukresults VALUES (39, 'sdlp', 5944);
INSERT INTO ukresults VALUES (39, 'alliance', 3879);
INSERT INTO ukresults VALUES (39, 'sf', 5451);
INSERT INTO ukresults VALUES (39, 'wp', 2412);
INSERT INTO ukresults VALUES (39, 'ind_dup', 1134);
INSERT INTO ukresults VALUES (40, 'oup', 18669);
INSERT INTO ukresults VALUES (40, 'dup', 4565);
INSERT INTO ukresults VALUES (40, 'sdlp', 3216);
INSERT INTO ukresults VALUES (40, 'alliance', 8945);
INSERT INTO ukresults VALUES (40, 'sf', 1107);
INSERT INTO ukresults VALUES (40, 'wp', 856);
INSERT INTO ukresults VALUES (41, 'oup', 2435);
INSERT INTO ukresults VALUES (41, 'dup', 2399);
INSERT INTO ukresults VALUES (41, 'sdlp', 10934);
INSERT INTO ukresults VALUES (41, 'sf', 16379);
INSERT INTO ukresults VALUES (41, 'wp', 1893);
INSERT INTO ukresults VALUES (41, 'ind', 10326);
INSERT INTO ukresults VALUES (42, 'con', 33967);
INSERT INTO ukresults VALUES (42, 'lab', 7953);
INSERT INTO ukresults VALUES (42, 'sdp', 17868);
INSERT INTO ukresults VALUES (43, 'con', 13743);
INSERT INTO ukresults VALUES (43, 'lab', 5975);
INSERT INTO ukresults VALUES (43, 'lib', 21958);
INSERT INTO ukresults VALUES (44, 'con', 4323);
INSERT INTO ukresults VALUES (44, 'lab', 15740);
INSERT INTO ukresults VALUES (44, 'lib', 9382);
INSERT INTO ukresults VALUES (44, 'nf', 800);
INSERT INTO ukresults VALUES (44, 'comm', 243);
INSERT INTO ukresults VALUES (44, 'yts', 214);
INSERT INTO ukresults VALUES (44, 'rap', 136);
INSERT INTO ukresults VALUES (45, 'con', 31233);
INSERT INTO ukresults VALUES (45, 'lab', 6921);
INSERT INTO ukresults VALUES (45, 'lib', 17364);
INSERT INTO ukresults VALUES (46, 'con', 30329);
INSERT INTO ukresults VALUES (46, 'lab', 3587);
INSERT INTO ukresults VALUES (46, 'lib', 10583);
INSERT INTO ukresults VALUES (46, 'eco', 538);
INSERT INTO ukresults VALUES (47, 'con', 23411);
INSERT INTO ukresults VALUES (47, 'lab', 7560);
INSERT INTO ukresults VALUES (47, 'lib', 13153);
INSERT INTO ukresults VALUES (48, 'con', 29635);
INSERT INTO ukresults VALUES (48, 'lab', 10528);
INSERT INTO ukresults VALUES (48, 'lib', 15020);
INSERT INTO ukresults VALUES (49, 'con', 13535);
INSERT INTO ukresults VALUES (49, 'lab', 23249);
INSERT INTO ukresults VALUES (49, 'lib', 9782);
INSERT INTO ukresults VALUES (49, 'eco', 337);
INSERT INTO ukresults VALUES (50, 'con', 19585);
INSERT INTO ukresults VALUES (50, 'lab', 7647);
INSERT INTO ukresults VALUES (50, 'sdp', 8167);
INSERT INTO ukresults VALUES (50, 'eco', 516);
INSERT INTO ukresults VALUES (50, 'ind_con', 293);
INSERT INTO ukresults VALUES (50, 'other', 266);

COMMIT;
