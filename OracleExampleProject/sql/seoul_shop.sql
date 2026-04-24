--------------------------------------------------------
--  파일이 생성됨 - 수요일-11월-22-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table SEOUL_SHOP
--------------------------------------------------------

  CREATE TABLE "HR"."SEOUL_SHOP" 
   (	"NO" NUMBER, 
	"TITLE" VARCHAR2(1000 BYTE), 
	"POSTER" VARCHAR2(1000 BYTE), 
	"MSG" CLOB, 
	"ADDRESS" VARCHAR2(500 BYTE), 
	"HIT" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("MSG") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW 4000 CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 262144 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
REM INSERTING into HR.SEOUL_SHOP
SET DEFINE OFF;
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (143,'아시안무드','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=19126&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','03037 서울 종로구 옥인길 33 (누상동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (144,'서촌구루루','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=19124&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','03040 서울 종로구 필운대로 26 (누하동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (145,'북촌상회　','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=18918&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','03059 서울 종로구 계동길 37 (계동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (146,'강남역 지하쇼핑센터','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=17740&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','06232 서울 강남구 강남대로 지하 396 (역삼동, 강남역)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (147,'밀리오레 명동점','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=17635&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','04536 서울 중구 퇴계로 115 (충무로1가, 밀레오레 명동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (148,'한사토이','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=15862&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','05551 서울 송파구 올림픽로 300 (신천동, 롯데월드타워앤드롯데월드몰)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (52,'뚝섬 아름다운 나눔장터','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=9612&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','05097 서울 광진구 강변북로 139 (자양동, 한강사업본부뚝섬안내센터)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (71,'가든파이브라이프','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=33047&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','05838 서울 송파구 충민로 66 (문정동, 가든파이브라이프)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (72,'제일시장','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=31984&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','03397 서울 은평구 통일로 731 (대조동) 제일시장',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (73,'증산종합시장','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=31944&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','03500 서울 은평구 증산로3길 12 (증산동) 증산종합시장',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (74,'커먼그라운드','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=29550&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','05071 서울 광진구 아차산로 200 (자양동) 커먼그라운드',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (75,'고투몰','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=29546&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','06545 서울 서초구 신반포로 지하 200 (잠원동, 강남터미널지하쇼핑몰)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (76,'이태원 앤틱 가구거리','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=29052&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04391 서울 용산구 보광로 109-1',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (77,'한신옹기','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=29048&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04338 서울 용산구 신흥로 7 (용산동2가)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (78,'공덕시장','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=28335&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04214 서울 마포구 만리재로 19 (공덕동, 공덕시장)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (79,'금남시장','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=28255&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','04730 서울 성동구 장터5길 2-15 (금호동3가)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (80,'연서시장','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=28254&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','03345 서울 은평구 통일로 850 (불광동, 연서시장)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (81,'영천시장','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=28253&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','03734 서울 서대문구 통일로 189-1 (영천동, 동성건물)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (82,'남성사계시장','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=28252&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','06997 서울 동작구 동작대로29나길 10',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (83,'대림중앙시장','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=28251&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','07419 서울 영등포구 도림천로11길 26-1 (대림동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (84,'성수동 수제화 거리','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=27649&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04793 서울 성동구 성수동2가',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (85,'카카오프렌즈 홍대 플래그십 스토어','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=27304&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04050 서울 마포구 양화로 162 (동교동, 좋은사람들 빌딩) 좋은사람들빌딩 1~3층',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (86,'카카오프렌즈 강남 플래그십 스토어','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=27303&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','06612 서울 서초구 강남대로 429 (동일빌딩) 유창빌딩 1~3층',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (87,'가락몰','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=26965&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','05699 서울 송파구 양재대로 932 (가락동, 가락동 농수산물도매시장) 가락몰',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (88,'숭인시장','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=9547&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','142-140 서울특별시 강북구 도봉로 45 (미아동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (89,'더 페이스샵','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=9667&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04533 서울 중구 을지로 30 롯데백화점 9층',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (1,'반디네일 강남본점','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=11965&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','06123 서울 강남구 봉은사로 114 (역삼동, 반디빌딩) 계전빌딩 1, 2층',17);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (2,'에비수','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=9779&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','100-810 서울특별시 중구 명동4길 20',30);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (3,'새김소리','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=11785&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','03149 서울특별시 종로구 인사동길 33 (관훈동) 1층',6);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (4,'회현 중고 LP 상가','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=1939&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','100-747 서울특별시 중구 소공로 63 (충무로1가)',1);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (5,'명동 쇼핑','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=67&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','04536 서울 중구 명동8길 27 (명동2가, 엠 플라자)',1);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (6,'제2롯데월드몰','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=15859&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','05551 서울 송파구 올림픽로 300 (신천동)',9);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (7,'이마트 왕십리점','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=9889&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','133-070 서울특별시 성동구 왕십리광장로 17',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (8,'홍대앞 예술시장 프리마켓','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=491&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04041 서울 마포구 와우산로21길 19-3 (서교동)',1);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (9,'교보 핫트랙스 광화문점','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=503&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','03154 서울 종로구 종로 1 (종로1가, 교보생명빌딩)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (10,'서울약령시장','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=1356&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','02570 서울 동대문구 약령중앙로 10 (제기동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (11,'현대백화점 무역센터점','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=9606&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','135-090 서울특별시 강남구 테헤란로 517 (삼성동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (12,'답십리 고미술상가','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=1379&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','02603 서울 동대문구 고미술로 21 (답십리동)',4);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (53,'용산전자랜드','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=12776&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','04372 서울특별시 용산구 청파로 74 (한강로3가)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (54,'용산전자상가','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=9674&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04372 서울시 용산구 청파로 74',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (55,'어라운드더코너 가로수길점','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=12226&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','06028 서울특별시 강남구 압구정로12길 24 (신사동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (56,'목동 로데오거리','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=9622&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','서울특별시 양천구 목동로25길',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (57,'설화수 플래그십 스토어','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=38787&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','06021 서울 강남구 도산대로45길 18 (신사동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (58,'젠틀몬스터 홍대 플래그십스토어','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=38775&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04048 서울 마포구 독막로7길 54 (서교동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (59,'아모레 플래그십 스토어 (성수)','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=38752&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04797 서울 성동구 아차산로11길 7 (성수동2가, (주)아세아이엔티)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (60,'서울 중앙시장','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=38195&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','04576 서울 중구 퇴계로85길 36 (황학동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (61,'해방촌 신흥시장','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=37951&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04337 서울 용산구 신흥로 95-9 (용산동2가) 해방촌 신흥시장',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (62,'망원시장','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=37950&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04010 서울 마포구 포은로8길 14 (망원동, 목화맨션) 망원시장',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (63,'쌈지길','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=37934&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','03146 서울 종로구 인사동길 44 (관훈동, 쌈지길)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (64,'알맹상점','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=37815&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04023 서울 마포구 월드컵로 49 (합정동) 2층 알맹상점',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (65,'더현대서울','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=37170&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','07335 서울 영등포구 여의대로 108 (여의도동, 파크원)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (66,'더 피커','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=36833&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04768 서울 성동구 왕십리로 115 (성수동1가) 헤이그라운드 서울숲점 9층',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (67,'디어얼스','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=36813&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','03715 서울 서대문구 수색로 43 (남가좌동, 가좌행복주택 복합커뮤니티센터) 104호',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (68,'상생상회','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=34835&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','03061 서울 종로구 율곡로 39 (안국동) 안국빌딩 신관 1층/B1 층',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (69,'루미에르 붙임머리','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=34490&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','06029 서울 강남구 압구정로14길 39 (신사동) 루미에르',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (70,'스타일난다 핑크 호텔 (명동 플래그십 스토어)','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=34459&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04536 서울 중구 명동8길 37-8 (충무로2가) 스타일난다 핑크호텔',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (90,'서초 벼룩시장','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=9729&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','06693 서울특별시 서초구 방배천로 4길 사당역 공영주차장',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (91,'명동지하쇼핑센터','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=9734&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04532 서울 중구 소공로 지하 102 (남대문로2가, 소공지하쇼핑센터)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (92,'센트럴시티','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=9736&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','06546 서울 서초구 신반포로 176 (반포동, 센트럴시티빌딩)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (93,'에뛰드하우스','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=9755&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04536 서울 중구 명동8길 35-1',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (94,'갤러리아백화점 EAST','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=9756&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','06009 서울 강남구 압구정로 407 (압구정동, 갤러리아백화점)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (95,'서초 벼룩시장','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=9729&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','06693 서울특별시 서초구 방배천로 4길 사당역 공영주차장',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (96,'명동지하쇼핑센터','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=9734&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04532 서울 중구 소공로 지하 102 (남대문로2가, 소공지하쇼핑센터)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (97,'센트럴시티','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=9736&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','06546 서울 서초구 신반포로 176 (반포동, 센트럴시티빌딩)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (13,'정샘물 인스피레이션','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=11883&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','06016 청담WEST점 : 서울 강남구 도산대로63길 15 (청담동, 아베다빌딩) 청담EAST점 : 서울 강남구 도산대로81길 57',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (14,'인사동길','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=80&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','03145 서울 종로구 인사동길 39-1 (관훈동) 일대',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (15,'남대문시장','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=85&fileTy=POSTTHUMB&fileNo=3&thumbTy=M','04529 서울 중구 남대문시장4길 21 (남창동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (16,'광장시장','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=286&fileTy=POSTTHUMB&fileNo=3&thumbTy=M','03195 서울 종로구 창경궁로 88',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (17,'신사동 가로수길','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=291&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','06028 서울 강남구 압구정로 120 일대',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (18,'코엑스몰','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=268&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','06164 서울 강남구 영동대로 513 (코엑스)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (19,'롯데백화점 본점','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=217&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04533 서울 중구 남대문로 81 (소공동, 롯데백화점 본점)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (20,'이태원 거리','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=2080&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','서울시 용산구 이태원로 27나길 (이태원동) 일대',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (21,'동대문 쇼핑타운','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=61&fileTy=POSTTHUMB&fileNo=4&thumbTy=M','04564 서울 중구 장충단로 253 (을지로6가, 헬로우APM)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (23,'이대 패션거리','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=425&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','03766 서울 서대문구 이화여대1길 10 (대현동, 예스에이피엠)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (24,'타임스퀘어','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=403&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','07305 서울 영등포구 영중로 15 (영등포동4가, 타임스퀘어)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (25,'통인시장','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=281&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','03036 서울 종로구 자하문로15길 18',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (26,'삼성 딜라이트','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=515&fileTy=POSTTHUMB&fileNo=5&thumbTy=M','06620 서울 서초구 서초대로74길 11 (삼성전자빌딩)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (27,'롯데 영플라자 명동점','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=10521&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04532 서울특별시 중구 남대문로 67 (남대문로2가)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (28,'아이파크몰','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=1702&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','140-780 서울특별시 용산구 한강대로23길 55 (한강로3가)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (29,'메세나폴리스','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=11106&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04036 서울특별시 마포구 양화로 45 (서교동, 메세나폴리스)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (30,'현대백화점 본점','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=9627&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','135-724 서울특별시 강남구 압구정로 165 (압구정동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (31,'마리오아울렛','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=490&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','08511 서울 금천구 디지털로9길 23 (가산동, 마리오2 패션타워)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (32,'신세계백화점 강남점','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=9575&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','서울특별시 서초구 신반포로 176 (반포동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (33,'광희패션몰','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=15403&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','04567 서울 중구 마장로1길 21 (신당동, 광희 패션물)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (34,'이태원 앤티크(가구) 거리','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=2051&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','서울시 용산구 보광로 103-2 (이태원동) 일대',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (35,'동대문역 창신동 완구 도매 시장','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=190&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','03120 서울 종로구 종로52길 36 (창신동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (36,'갤러리아백화점 WEST','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=2028&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','06008 서울 강남구 압구정로 343 (갤러리아백화점)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (37,'롯데백화점 에비뉴엘관','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=9521&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','서울특별시 중구 남대문로 73 (남대문로2가)',2);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (38,'동묘 벼룩시장','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=9648&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','03116 서울 종로구 난계로 243 (숭인동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (39,'10 꼬르소 꼬모','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=11597&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','06015 서울 강남구 압구정로 416 (청담동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (40,'종로 귀금속 거리','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=2106&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','03139 서울 종로구 돈화문로 23 (종로3가)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (41,'동대문 헌책방 거리','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=1742&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','서울시 중구 장충단로13길 20 (을지로6가)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (42,'방학동 도깨비시장','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=9631&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','01358 서울 도봉구 도당로13다길 30 (방학동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (43,'두타(DOOTA)','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=416&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','04563 서울 중구 장충단로 275 (을지로6가, 두산타워빌딩)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (44,'동화면세점','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=9677&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','110-730 서울특별시 종로구 세종대로 149, 광화문빌딩 지하 1층 (세종로)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (45,'회현지하쇼핑센터','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=559&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04535 서울 중구 소공로 지하 58 (충무로1가, 회현지하쇼핑센터)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (46,'서울풍물시장','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=1600&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','02586 서울 동대문구 천호대로4길 21 (신설동, 서울풍물시장)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (47,'테크노마트','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=2233&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','05116 서울 광진구 광나루로56길 85 (구의동 546-4)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (48,'낙원악기상가','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=9725&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','110-707 서울특별시 종로구 삼일대로 428 (낙원동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (49,'명동 M플라자','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=2295&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','100-022 서울특별시 중구 명동8길 27 (명동2가)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (50,'문정동 로데오거리','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=1812&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','138-200 서울특별시 송파구 동남로4길 10 (문정동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (51,'청담 패션 거리','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=1307&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','06010 서울특별시 강남구 청담동 패션 거리 일대',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (98,'에뛰드하우스','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=9755&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04536 서울 중구 명동8길 35-1',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (99,'갤러리아백화점 EAST','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=9756&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','06009 서울 강남구 압구정로 407 (압구정동, 갤러리아백화점)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (100,'Addicted','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=10469&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','06018 서울 강남구 선릉로155길 24',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (101,'라움에디션','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=10502&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','서울특별시 강남구 압구정로 343 갤러리아백화점명품관 WEST 3F',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (102,'SPAO','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=11439&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04536 서울 중구 명동8나길 15 (충무로1가, 명동캣츠빌딩)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (103,'SPAO','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=11439&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04536 서울 중구 명동8나길 15 (충무로1가, 명동캣츠빌딩)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (104,'라뷰티코아 청담 세이엇데이점','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=11548&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','06014 서울 강남구 선릉로158길 12',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (105,'올리브영 명동 플래그십','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=12018&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04538 서울특별시 중구 명동길 53 (명동1가)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (106,'스타일난다','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=12469&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','04053 서울특별시 마포구 와우산로29다길 23 (서교동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (107,'핫트랙스 타임스퀘어점','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=12711&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','07305 서울 영등포구 영중로 15 (타임스퀘어) 2층 교보문고 핫트랙스',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (108,'SJYP 가로수길점','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=12836&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','06028 서울 강남구 강남대로160길 45 1층 SJYP 가로수길점',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (110,'K-STAR ROAD 강남 한류스타거리','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=15768&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','서울특별시 강남구 압구정동 394',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (112,'K-STAR ROAD 강남 한류스타거리','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=15768&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','서울특별시 강남구 압구정동 394',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (113,'엔터식스 왕십리점','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=15857&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04750 서울 성동구 왕십리광장로 17 (행당동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (114,'Re:CODE','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=11230&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04400 서울 용산구 이태원로 244 (한남동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (115,'평화시장','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=26964&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04563 서울 중구 청계천로 274 (을지로6가) 평화시장',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (116,'송림수제화','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=26955&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04543 서울 중구 수표로 60-1 (을지로3가) 3~4층',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (117,'마이시티 상암점','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=26644&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','03926 서울 마포구 상암산로 66 (상암동, CJ E&M CENTER) 1층',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (118,'통인가게','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=25931&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','03148 서울 종로구 인사동길 32 (관훈동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (119,'평화시장','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=26964&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04563 서울 중구 청계천로 274 (을지로6가) 평화시장',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (120,'송림수제화','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=26955&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04543 서울 중구 수표로 60-1 (을지로3가) 3~4층',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (121,'마이시티 상암점','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=26644&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','03926 서울 마포구 상암산로 66 (상암동, CJ E&M CENTER) 1층',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (122,'통인가게','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=25931&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','03148 서울 종로구 인사동길 32 (관훈동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (123,'씨제이더마켓 제일제당센터점','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=25748&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04560 서울 중구 동호로 330 (쌍림동, 씨제이제일제당센터) 지하1층',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (124,'신세계면세점','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=24463&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04530 서울 중구 퇴계로 77 (충무로1가, 신세계백화점)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (125,'한국관광명품점','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=24420&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','03149 서울 종로구 인사동5길 14 (관훈동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (126,'정샘물 플롭스','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=22993&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','06028 서울 강남구 압구정로12길 40 (신사동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (127,'통인가게','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=25931&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','03148 서울 종로구 인사동길 32 (관훈동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (128,'씨제이더마켓 제일제당센터점','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=25748&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04560 서울 중구 동호로 330 (쌍림동, 씨제이제일제당센터) 지하1층',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (129,'신세계면세점','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=24463&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','04530 서울 중구 퇴계로 77 (충무로1가, 신세계백화점)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (130,'한국관광명품점','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=24420&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','03149 서울 종로구 인사동5길 14 (관훈동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (131,'정샘물 플롭스','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=22993&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','06028 서울 강남구 압구정로12길 40 (신사동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (132,'레어마켓 (Rare Market)','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=20152&fileTy=POSTTHUMB&fileNo=2&thumbTy=M','06015 서울특별시 강남구 압구정로80길 24',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (133,'젠틀몬스터 신사 플래그쉽 스토어','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=20070&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','06028 서울 강남구 압구정로10길 23 (신사동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (134,'컬처앤네이처','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=20068&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','06062 서울 강남구 도산대로 404 (청담동, 퍼스트빌딩)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (135,'젠틀몬스터 신사 플래그쉽 스토어','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=20070&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','06028 서울 강남구 압구정로10길 23 (신사동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (136,'컬처앤네이처','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=20068&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','06062 서울 강남구 도산대로 404 (청담동, 퍼스트빌딩)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (137,'자비시주얼리','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=20050&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','06017 서울 강남구 압구정로42길 36 (신사동, 금광아크존1) 1층',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (138,'에이바이봄','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=20048&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','06016 서울 강남구 선릉로152길 30 (청담동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (139,'이영애화장품 삼청동하우스','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=20041&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','03053 서울 종로구 삼청로 67 리아네이처',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (140,'마이분 (Myboon)','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=20037&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','06062 서울 강남구 도산대로 442 (청담동, 피엔폴루스)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (141,'아티지 (ARTAGE)','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=20034&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','06017 서울 강남구 언주로168길 7 (신사동)',0);
Insert into HR.SEOUL_SHOP (NO,TITLE,POSTER,ADDRESS,HIT) values (142,'아시안무드','https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=19126&fileTy=POSTTHUMB&fileNo=1&thumbTy=M','03037 서울 종로구 옥인길 33 (누상동)',0);
--------------------------------------------------------
--  DDL for Index SS_NO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SS_NO_PK" ON "HR"."SEOUL_SHOP" ("NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table SEOUL_SHOP
--------------------------------------------------------

  ALTER TABLE "HR"."SEOUL_SHOP" MODIFY ("TITLE" CONSTRAINT "SS_TITLE_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."SEOUL_SHOP" MODIFY ("POSTER" CONSTRAINT "SS_POSTER_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."SEOUL_SHOP" MODIFY ("ADDRESS" CONSTRAINT "SS_ADDRESS_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."SEOUL_SHOP" ADD CONSTRAINT "SS_NO_PK" PRIMARY KEY ("NO")
  USING INDEX "HR"."SS_NO_PK"  ENABLE;
