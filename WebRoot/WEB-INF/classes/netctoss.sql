--资费信息表
create table cost(
  	cost_id			number(4) constraint cost_id_pk primary key,
  	name 			varchar(50)  not null,
  	base_duration 	number(11),
  	base_cost 		number(7,2),
  	unit_cost 		number(7,4),
  	status 			char(1),
  	descr 			varchar2(100),
  	creatime 		date default sysdate ,
  	startime 		date,
		cost_type		char(1)
  );

create sequence cost_seq start with 100;

INSERT INTO COST VALUES (1,'5.9元套餐',20,5.9,0.4,0,'5.9元20小时/月,超出部分0.4元/时',DEFAULT,DEFAULT,NULL);
INSERT INTO COST VALUES (2,'6.9元套餐',40,6.9,0.3,0,'6.9元40小时/月,超出部分0.3元/时',DEFAULT,DEFAULT,NULL);
INSERT INTO COST VALUES (3,'8.5元套餐',100,8.5,0.2,0,'8.5元100小时/月,超出部分0.2元/时',DEFAULT,DEFAULT,NULL);
INSERT INTO COST VALUES (4,'10.5元套餐',200,10.5,0.1,0,'10.5元200小时/月,超出部分0.1元/时',DEFAULT,DEFAULT,NULL);
INSERT INTO COST VALUES (5,'计时收费',null,null,0.5,0,'0.5元/时,不使用不收费',DEFAULT,DEFAULT,NULL);
INSERT INTO COST VALUES (6,'包月',null,20,null,0,'每月20元,不限制使用时间',DEFAULT,DEFAULT,NULL);
COMMIT;



--帐务信息表
create table account(
 	account_id		number(9) constraint account_id_pk primary key,
 	recommender_id	number(9),
 	login_name		varchar2(30)  not null,
 	login_passwd	varchar2(30) not null,
 	status			char(1),
 	create_date		date	 default sysdate,
 	pause_date		date,
 	close_date		date,
 	real_name		varchar2(20)	not null,
 	idcard_no		char(18)		not null,
 	birthdate		date,
 	gender	    char(1),
 	occupation		varchar2(50),
 	telephone		varchar2(15) not null,
 	email			varchar2(50),
 	mailaddress		varchar2(200),
 	zipcode			char(6),
 	qq				varchar2(15),
 	last_login_time	  	date,
 	last_login_ip		varchar2(15)
);

create sequence account_seq start with 2000;

ALTER SESSION SET NLS_DATE_FORMAT = 'yyyy mm dd hh24:mi:ss';
INSERT INTO ACCOUNT(ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
     REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1005,NULL,'taiji001','256528',1,'2008 03 15','zhangsanfeng','19430225','410381194302256528',13669351234);

INSERT INTO ACCOUNT(ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1010,NULL,'xl18z60','190613',1,'2009 01 10','guojing','19690319','330682196903190613',13338924567);

INSERT INTO ACCOUNT(ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1011,1010,'dgbf70','270429',1,'2009 03 01','huangrong','19710827','330902197108270429',13637811357);

INSERT INTO ACCOUNT(ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1015,1005,'mjjzh64','041115',1,'2010 03 12','zhangwuji','19890604','610121198906041115',13572952468);

INSERT INTO ACCOUNT(ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1018,1011,'jmdxj00','010322',1,'2011 01 01','guofurong','199601010322','350581200201010322',18617832562);

INSERT INTO ACCOUNT(ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1019,1011,'ljxj90','310346',1,'2012 02 01','luwushuang','19930731','320211199307310346',13186454984);

INSERT INTO ACCOUNT(ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1020,NULL,'kxhxd20','012115',1,'2012 02 20','weixiaobao','20001001','321022200010012115',13953410078);

INSERT INTO ACCOUNT(ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1021,NULL,'kxhxd21','012116',1,'2012 02 20','zhangsan','20001002','321022200010012116',13953410079);
INSERT INTO ACCOUNT(ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1022,NULL,'kxhxd22','012117',1,'2012 02 20','lisi','20001003','321022200010012117',13953410080);
INSERT INTO ACCOUNT(ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1023,NULL,'kxhxd23','012118',1,'2012 02 20','wangwu','20001004','321022200010012118',13953410081);
INSERT INTO ACCOUNT(ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1024,NULL,'kxhxd24','012119',1,'2012 02 20','zhouliu','20001005','321022200010012119',13953410082);
INSERT INTO ACCOUNT(ACCOUNT_ID,RECOMMENDER_ID,LOGIN_NAME,LOGIN_PASSWD,STATUS,CREATE_DATE,
REAL_NAME,BIRTHDATE,IDCARD_NO,TELEPHONE)
VALUES(1025,NULL,'kxhxd25','012120',1,'2012 02 20','maqi','20001006','321022200010012120',13953410083);
COMMIT;



--业务信息表
create table service(
 	service_id		number(10) constraint service_id_pk primary key,
 	account_id		number(9) not null,
 	unix_host		varchar2(15) not null ,
 	os_username		varchar2(8)	not null,
 	login_passwd	varchar2(30) not null,
 	status 			char(1),	
 	create_date		date	default sysdate,
 	pause_date		date,
 	close_date		date,
 	cost_id			number(4) not null
);

create sequence service_seq start with 3000;

INSERT INTO SERVICE VALUES (2001,1010,'192.168.0.26','guojing','guo1234','0',sysdate,null,null,1);

INSERT INTO SERVICE VALUES (2002,1011,'192.168.0.26','huangr','huang234','0',sysdate,null,null,1);

INSERT INTO SERVICE VALUES (2003,1011,'192.168.0.20','huangr','huang234','0',sysdate,null,null,3);

INSERT INTO SERVICE VALUES (2004,1011,'192.168.0.23','huangr','huang234','0',sysdate,null,null,6);

INSERT INTO SERVICE VALUES (2005,1019,'192.168.0.26','luwsh','luwu2345','0',sysdate,null,null,4);

INSERT INTO SERVICE VALUES (2006,1019,'192.168.0.20','luwsh','luwu2345','0',sysdate,null,null,5);

INSERT INTO SERVICE VALUES (2007,1020,'192.168.0.20','weixb','wei12345','0',sysdate,null,null,6);

INSERT INTO SERVICE VALUES (2008,1010,'192.168.0.20','guojing','guo09876','0',sysdate,null,null,6);
COMMIT;



--业务资费更新备份表
CREATE TABLE SERVICE_UPDATE_BAK(
 ID	 NUMBER(10) PRIMARY KEY,
 SERVICE_ID	NUMBER(9) NOT NULL,
 COST_ID	 NUMBER(4)  NOT NULL
);

create sequence service_update_bak_seq;

--模块表
create table module_info(
		module_id 	number(4) constraint module_info_id_pk primary key,
		name 		varchar2(50) not null
);

create sequence module_seq start with 100;

--角色表
create table role_info(
		role_id		number(4)	constraint role_info_id_pk primary key,
		name	varchar2(50) 	not null
);

create sequence role_seq start with 1000;

--角色模块表
create table role_module(
		role_id     number(4) not null,
  	module_id   number(4) not null,
  	constraint role_module_pk primary key(role_id,module_id)
);



--管理员表
create table admin_info(
   	admin_id 	number(8) primary key not null,
   	admin_code 	varchar2(30) not null,
   	password 	varchar2(30) not null,
   	name 		varchar2(30) not null,
   	telephone 	varchar2(15),
   	email 		varchar2(50),
   	enrolldate 	date default sysdate not null
);

create sequence admin_seq start with 10000;


--管理员角色表
create table admin_role(
		admin_id	number(8) not null,
  	role_id		number(4) not null,
  	constraint admin_role_pk primary key(admin_id,role_id)
);



--模块表
insert into MODULE_INFO values(1,'角色管理');
insert into MODULE_INFO values(2,'管理员');
insert into MODULE_INFO values(3,'资费管理');
insert into MODULE_INFO values(4,'账务账号');
insert into MODULE_INFO values(5,'业务账号');
insert into MODULE_INFO values(6,'账单管理');
insert into MODULE_INFO values(7,'报表');
commit;
--角色表
insert into role_info values(100,'管理员');
insert into role_info values(200,'营业员');
insert into role_info values(300,'经理');
insert into role_info values(400,'aaa');
insert into role_info values(500,'bbb');
insert into role_info values(600,'ccc');
commit;
--角色模块表
insert into role_module values(100,1);
insert into role_module values(100,2);
insert into role_module values(200,3);
insert into role_module values(200,4);
insert into role_module values(200,5);
insert into role_module values(200,6);
insert into role_module values(300,7);
commit;
--管理员表
insert into admin_info values(2000,'admin','123','ADMIN','123456789','admin@tarena.com.cn',sysdate);
insert into admin_info values(3000,'zhangfei','123','ZhangFei','123456789','zhangfei@tarena.com.cn',sysdate);
insert into admin_info values(4000,'liubei','123','LiuBei','123456789','liubei@tarena.com.cn',sysdate);
insert into admin_info values(5000,'caocao','123','CaoCao','123456789','caocao@tarena.com.cn',sysdate);
insert into admin_info values(6000,'aaa','123','AAA','123456789','aaa@tarena.com.cn',sysdate);
insert into admin_info values(7000,'bbb','123','BBB','123456789','bbb@tarena.com.cn',sysdate);
commit;
--管理员角色表
insert into admin_role values(2000,100);
insert into admin_role values(3000,200);
insert into admin_role values(4000,300);
insert into admin_role values(5000,100);
insert into admin_role values(5000,200);
insert into admin_role values(5000,300);
commit;
---------------------------------------------扩展----------------
--建立服务器信息表host--
create table host(
id varchar2(15) constraint host_id_pk primary key,
name varchar2(20) not null,
location varchar2(20));

--建立时长信息表--
create table month_duration(
service_id number(10),
month_id char(6),
service_detail_id number(10),
sofar_duration number(11));

--建立帐单信息表bill--
create table bill(
bill_id number(11) constraint bill_id_pk primary key,
account_id number(9) not null constraint bill_aid_fk references account(account_id),
bill_month char(6) not null,
cost number(13,2) not null,
payment_mode char(1) constraint bill_paymode_ck check (payment_mode in (0,1,2,3)),
pay_state char(1) default 0 constraint bill_ps_ck check(pay_state in (0,1)));

create sequence bill_seq;

--建立帐单条目表bill_item--
create table bill_item(
item_id number(11) constraint bill_item_itid_pk primary key,
bill_id number(11) not null constraint bill_item_billid_fk references bill(bill_id),
service_id number(10) not null constraint bill_item_sid_fk references service(service_id),
cost number(13,2));
create sequence bill_item_seq

--建立业务详单表service_detail--
create table service_detail(
service_detail_id number(11) constraint service_detail_pk primary key,
service_id number(10) not null constraint sd_service_id_fk references service(service_id),
client_host varchar2(15),
os_username varchar2(8),
pid number(11),
login_time date,
logout_time date,
duration number(20,9),
cost number(20,6));

--建立序列表service_detail_seq--
create sequence  service_detail_seq
increment by 1
start with 1;

--建立年龄分段信息表age_segment--
create table age_segment(
age_segment_id number(1) constraint age_segment_id_pk primary key,
name varchar2(20) not null,
lowage number(2),
hiage number(2)
);

create sequence age_segment_seq
start with 1;



------------------存储过程：更新业务，生成账单=----------------------
--调用该存储过程月底修改资费
CREATE OR REPLACE PROCEDURE UPDATE_SERVICE_COST
  IS
  BEGIN
    MERGE INTO service s
    USING service_update_bak s_bak
    ON (s.service_id = s_bak.service_id)
    WHEN MATCHED THEN
    UPDATE SET
   s.cost_id=s_bak.cost_id;
   DELETE FROM SERVICE_UPDATE_BAK;
   COMMIT;
 END;
--在插入业务详单信息时，计算需要计费的每条详单的费用,按照费用类型进行的分类，套餐类型和实时计费。包月类型无业务详单费用
CREATE OR REPLACE TRIGGER gen_fee
BEFORE INSERT ON service_detail
FOR EACH ROW
DECLARE
  TYPE t_cost IS RECORD
         (base_cost cost.base_cost%TYPE,
          base_duration cost.base_duration%TYPE,
          unit_cost cost.unit_cost%TYPE,
          cost_type cost.cost_type%TYPE);
  v_cost t_cost;
  v_sofar_duration month_duration.sofar_duration%TYPE;
  v_temp_duration month_duration.sofar_duration%TYPE;
  v_duration service_detail.duration%TYPE;
  v_count number(20);
  BEGIN
    -- 定位service_id的资费标准
    SELECT base_cost,base_duration,unit_cost,cost_type INTO v_cost FROM cost c JOIN service s ON s.cost_id = c.cost_id AND s.service_id  = :new.service_id;
   --2表示资费类型为套餐
   IF v_cost.cost_type=2   THEN
      --查询为了判断month_duration表中是否有当前月的数据
      SELECT count(*) into v_count FROM month_duration WHERE service_id = :new.service_id AND month_id = TO_CHAR(:new.logout_time,'yyyymm');
      --在month_duration表中已经存在当前月的数据
      IF v_count>0 THEN
         -- 获得service_id当月累计时长
         SELECT sofar_duration INTO v_sofar_duration FROM month_duration WHERE service_id = :new.service_id AND month_id = TO_CHAR(:new.logout_time,'yyyymm');
          -- 到目前为止的累计时长
          v_temp_duration:=v_sofar_duration;
          --加上当前这次的duration
          v_sofar_duration := v_sofar_duration + :new.duration;
          -- 和基本时长的差
         v_duration := v_sofar_duration - v_cost.base_duration*60*60;
         --当前插入的service_detail的数据部分时长大于包月时长
         IF v_duration > 0 AND v_cost.base_duration*60*60> v_temp_duration THEN
            :new.cost := v_cost.unit_cost    * v_duration/3600;
          --当前插入的service_detail的数据全部时长大于包月时长
         ELSIF v_duration > 0 AND v_cost.base_duration*60*60<= v_temp_duration THEN
           :new.cost :=v_cost.unit_cost*:new.duration/3600;   
         END IF;
         --使month_duration表中的当前月时长进行累加
         UPDATE month_duration SET sofar_duration=v_sofar_duration WHERE service_id = :new.service_id AND month_id = TO_CHAR(:new.logout_time,'yyyymm') ;
      --在month_duration表中已经不存在当前月的数据
      ELSE
        v_sofar_duration := :new.duration;
       INSERT  INTO month_duration(service_id,month_id,sofar_duration)
       VALUES (:new.service_id,TO_CHAR(:new.logout_time,'yyyymm'),v_sofar_duration); 
     END IF;
   --1表示资费类型为计时费用
   ELSIF v_cost.cost_type=3  THEN
      :new.cost :=v_cost.unit_cost*(:new.duration/3600); 
   END IF;    
  END;

--以下为生产账单所需内容
--用临时表技术生成账单编号表，用于保存BILL_ID(账单ID)，ACCOUNT_ID（帐务ID），BILL_MONTH（账单月）
CREATE GLOBAL TEMPORARY TABLE BILL_CODE
(BILL_ID      NUMBER(11),
 ACCOUNT_ID   NUMBER(9),
 BILL_MONTH   CHAR(6)
) On COMMIT PRESERVE ROWS;
 
 --用临时表技术，临时存储BILL_ITEM信息
CREATE GLOBAL TEMPORARY TABLE BILL_ITEM_TEMP
(ITEM_ID    NUMBER(11),
 BILL_ID     NUMBER(11),
 SERVICE_ID   NUMBER(10) NOT NULL,
 COST     NUMBER(13,2)
) On COMMIT PRESERVE ROWS;

----------------自动产生主键的trigger----------------
------BILLL_CODE表中的BILL_ID自动生成,创建触发器产生主键
CREATE OR REPLACE TRIGGER GEN_BILL_ID
BEFORE INSERT ON BILL_CODE
FOR EACH ROW
DECLARE
BEGIN
      SELECT BILL_SEQ.NEXTVAL INTO :NEW.BILL_ID FROM DUAL;
END;

----BILL_ITEM表中的ITEM_ID自动生成,创建触发器产生主键
CREATE OR REPLACE TRIGGER GEN_ITEM_ID
BEFORE INSERT ON BILL_ITEM
FOR EACH ROW
DECLARE
BEGIN
      SELECT BILL_ITEM_SEQ.NEXTVAL INTO :NEW.ITEM_ID FROM DUAL;
END;

 --使用存储过程向账单和账单条目表中添加数据。
CREATE OR REPLACE  PROCEDURE GBILL_ALL
  IS
  BEGIN
    --向临时表BILL_CODE表中插入数据
    INSERT INTO BILL_CODE(ACCOUNT_ID,BILL_MONTH)
      SELECT   ACCOUNT_ID,
        TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM') 
      FROM ACCOUNT;
    --向临时表BILL_ITEM_TEMP中插入数据
    INSERT INTO BILL_ITEM_TEMP(BILL_ID,SERVICE_ID,COST)
      SELECT  B.BILL_ID,A.SERVICE_ID,
          A.COST + NVL(C.BASE_COST,0)
      FROM BILL_CODE B JOIN
        (SELECT  MAX(S.ACCOUNT_ID) ACCOUNT_ID,
          D.SERVICE_ID,
          MAX(S.COST_ID) COST_ID,
          SUM(COST) COST
        FROM SERVICE_DETAIL D  JOIN SERVICE S
        ON D.SERVICE_ID = S.SERVICE_ID
        AND  TO_CHAR(D.LOGOUT_TIME,'YYYYMM') = 
                            TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM')
        GROUP BY D.SERVICE_ID
        ) A
        ON B.ACCOUNT_ID = A.ACCOUNT_ID
        JOIN COST C
      ON A.COST_ID = C.COST_ID;  
      --向表BILL中插入数据
      INSERT INTO BILL(BILL_ID,ACCOUNT_ID,BILL_MONTH,COST)
      SELECT   BC.BILL_ID,
        MAX(BC.ACCOUNT_ID),
        MAX(BC.BILL_MONTH),
        SUM(I.COST)
      FROM BILL_CODE BC JOIN bill_item_temp I
      ON BC.BILL_ID = I.BILL_ID
      GROUP BY BC.BILL_ID;
      --向表BILL_ITEM中插入数据
      INSERT INTO BILL_ITEM(BILL_ID,SERVICE_ID,COST)
      SELECT  B.BILL_ID,A.SERVICE_ID,
          A.COST + NVL(C.BASE_COST,0)
      FROM BILL_CODE B JOIN
        (SELECT  MAX(S.ACCOUNT_ID) ACCOUNT_ID,
          D.SERVICE_ID,
          MAX(S.COST_ID) COST_ID,
          SUM(COST) COST
        FROM SERVICE_DETAIL D  JOIN SERVICE S
        ON D.SERVICE_ID = S.SERVICE_ID
        AND  TO_CHAR(D.LOGOUT_TIME,'YYYYMM') = 
                            TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM')
        GROUP BY D.SERVICE_ID
        ) A
        ON B.ACCOUNT_ID = A.ACCOUNT_ID
        JOIN COST C
      ON A.COST_ID = C.COST_ID;
  COMMIT;
 END;
 
 -------------------------------------补充的测试数据-------------
 --插入age_segment表信息--
insert into age_segment values (0,'少年逆反期',11,14);
insert into age_segment values (1,'少年成长期',15,17);
insert into age_segment values (2,'青年青春期',18,28);
insert into age_segment values (3,'青年成熟期',29,40);
insert into age_segment values (4,'中年壮实期',41,48);
insert into age_segment values (5,'中年稳健期',49,55);
insert into age_segment values (6,'中年稳健期',56,65);
insert into age_segment values (7,'老年初老期',66,72);
commit;

--service_detail--
insert into service_detail values (service_detail_seq.nextval,2001,'192.168.0.1','guojing',123,to_date('2013-05-05 20:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-05-05 21:20:00','yyyy-mm-dd hh24:mi:ss'),3600,0);
insert into service_detail values (service_detail_seq.nextval,2001,'192.168.0.1','guojing',123,to_date('2013-05-06 10:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-05-06 20:20:00','yyyy-mm-dd hh24:mi:ss'),36000,0);
insert into service_detail values (service_detail_seq.nextval,2001,'192.168.0.1','guojing',123,to_date('2013-05-07 10:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-05-07 20:20:00','yyyy-mm-dd hh24:mi:ss'),36000,0);
insert into service_detail values (service_detail_seq.nextval,2001,'192.168.0.1','guojing',123,to_date('2013-05-08 10:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-05-08 12:55:00','yyyy-mm-dd hh24:mi:ss'),9300,0);
insert into service_detail values (service_detail_seq.nextval,2001,'192.168.0.1','guojing',123,to_date('2013-05-08 18:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-05-08 22:52:00','yyyy-mm-dd hh24:mi:ss'),16320,0);
insert into service_detail values (service_detail_seq.nextval,2001,'192.168.0.1','guojing',123,to_date('2013-05-09 10:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-05-09 14:52:00','yyyy-mm-dd hh24:mi:ss'),16320,0);
insert into service_detail values (service_detail_seq.nextval,2001,'192.168.0.1','guojing',123,to_date('2013-05-09 11:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-05-09 13:22:00','yyyy-mm-dd hh24:mi:ss'),7320,0);
insert into service_detail values (service_detail_seq.nextval,2001,'192.168.0.1','guojing',123,to_date('2013-05-10 16:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-05-10 18:52:00','yyyy-mm-dd hh24:mi:ss'),9120,0);
insert into service_detail values (service_detail_seq.nextval,2001,'192.168.0.1','guojing',123,to_date('2013-05-10 20:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-05-10 22:52:00','yyyy-mm-dd hh24:mi:ss'),9120,0);
insert into service_detail values (service_detail_seq.nextval,2001,'192.168.0.1','guojing',123,to_date('2013-05-11 18:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-05-11 22:52:00','yyyy-mm-dd hh24:mi:ss'),16320,0);
-----
insert into service_detail values (service_detail_seq.nextval,2008,'192.168.0.1','guojing',123,to_date('2013-05-05 20:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-05-05 21:20:00','yyyy-mm-dd hh24:mi:ss'),3600,0);
insert into service_detail values (service_detail_seq.nextval,2008,'192.168.0.1','guojing',123,to_date('2013-05-06 10:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-05-06 20:20:00','yyyy-mm-dd hh24:mi:ss'),36000,0);
insert into service_detail values (service_detail_seq.nextval,2008,'192.168.0.1','guojing',123,to_date('2013-05-07 10:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-05-07 20:20:00','yyyy-mm-dd hh24:mi:ss'),36000,0);
insert into service_detail values (service_detail_seq.nextval,2008,'192.168.0.1','guojing',123,to_date('2013-05-08 10:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-05-08 12:55:00','yyyy-mm-dd hh24:mi:ss'),9300,0);
insert into service_detail values (service_detail_seq.nextval,2008,'192.168.0.1','guojing',123,to_date('2013-05-08 18:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-05-08 22:52:00','yyyy-mm-dd hh24:mi:ss'),16320,0);
insert into service_detail values (service_detail_seq.nextval,2008,'192.168.0.1','guojing',123,to_date('2013-05-09 10:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-05-09 14:52:00','yyyy-mm-dd hh24:mi:ss'),16320,0);
insert into service_detail values (service_detail_seq.nextval,2008,'192.168.0.1','guojing',123,to_date('2013-05-09 11:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-05-09 13:22:00','yyyy-mm-dd hh24:mi:ss'),7320,0);
insert into service_detail values (service_detail_seq.nextval,2008,'192.168.0.1','guojing',123,to_date('2013-05-10 16:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-05-10 18:52:00','yyyy-mm-dd hh24:mi:ss'),9120,0);
insert into service_detail values (service_detail_seq.nextval,2008,'192.168.0.1','guojing',123,to_date('2013-05-10 20:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-05-10 22:52:00','yyyy-mm-dd hh24:mi:ss'),9120,0);
insert into service_detail values (service_detail_seq.nextval,2008,'192.168.0.1','guojing',123,to_date('2013-05-11 18:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-05-11 22:52:00','yyyy-mm-dd hh24:mi:ss'),16320,0);

insert into service_detail values (service_detail_seq.nextval,2002,'192.168.0.1','huangr',123,to_date('2013-04-05 20:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-04-05 21:20:00','yyyy-mm-dd hh24:mi:ss'),3600,0);
insert into service_detail values (service_detail_seq.nextval,2002,'192.168.0.1','huangr',123,to_date('2013-04-06 10:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-04-06 20:20:00','yyyy-mm-dd hh24:mi:ss'),36000,0);
insert into service_detail values (service_detail_seq.nextval,2002,'192.168.0.1','huangr',123,to_date('2013-04-07 10:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-04-07 20:20:00','yyyy-mm-dd hh24:mi:ss'),36000,0);
insert into service_detail values (service_detail_seq.nextval,2002,'192.168.0.1','huangr',123,to_date('2013-04-08 10:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-04-08 12:55:00','yyyy-mm-dd hh24:mi:ss'),9300,0);
insert into service_detail values (service_detail_seq.nextval,2002,'192.168.0.1','huangr',123,to_date('2013-04-08 18:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-04-08 22:52:00','yyyy-mm-dd hh24:mi:ss'),16320,0);
insert into service_detail values (service_detail_seq.nextval,2002,'192.168.0.1','huangr',123,to_date('2013-04-09 10:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-04-09 14:52:00','yyyy-mm-dd hh24:mi:ss'),16320,0);
insert into service_detail values (service_detail_seq.nextval,2002,'192.168.0.1','huangr',123,to_date('2013-04-09 11:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-04-09 13:22:00','yyyy-mm-dd hh24:mi:ss'),7320,0);
insert into service_detail values (service_detail_seq.nextval,2002,'192.168.0.1','huangr',123,to_date('2013-04-10 16:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-04-10 18:52:00','yyyy-mm-dd hh24:mi:ss'),9120,0);
insert into service_detail values (service_detail_seq.nextval,2002,'192.168.0.1','huangr',123,to_date('2013-04-10 20:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-04-10 22:52:00','yyyy-mm-dd hh24:mi:ss'),9120,0);
insert into service_detail values (service_detail_seq.nextval,2002,'192.168.0.1','huangr',123,to_date('2013-04-11 18:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-04-11 22:52:00','yyyy-mm-dd hh24:mi:ss'),16320,0);

insert into service_detail values (service_detail_seq.nextval,2008,'192.168.0.1','guojing',123,to_date('2013-04-05 20:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-04-05 21:20:00','yyyy-mm-dd hh24:mi:ss'),3600,0);
insert into service_detail values (service_detail_seq.nextval,2008,'192.168.0.1','guojing',123,to_date('2013-04-06 10:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-04-06 20:20:00','yyyy-mm-dd hh24:mi:ss'),36000,0);
insert into service_detail values (service_detail_seq.nextval,2008,'192.168.0.1','guojing',123,to_date('2013-04-07 10:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-04-07 20:20:00','yyyy-mm-dd hh24:mi:ss'),36000,0);
insert into service_detail values (service_detail_seq.nextval,2008,'192.168.0.1','guojing',123,to_date('2013-04-08 10:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-04-08 12:55:00','yyyy-mm-dd hh24:mi:ss'),9300,0);
insert into service_detail values (service_detail_seq.nextval,2008,'192.168.0.1','guojing',123,to_date('2013-04-08 18:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-04-08 22:52:00','yyyy-mm-dd hh24:mi:ss'),16320,0);
insert into service_detail values (service_detail_seq.nextval,2008,'192.168.0.1','guojing',123,to_date('2013-04-09 10:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-04-09 14:52:00','yyyy-mm-dd hh24:mi:ss'),16320,0);
insert into service_detail values (service_detail_seq.nextval,2008,'192.168.0.1','guojing',123,to_date('2013-04-09 11:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-04-09 13:22:00','yyyy-mm-dd hh24:mi:ss'),7320,0);
insert into service_detail values (service_detail_seq.nextval,2008,'192.168.0.1','guojing',123,to_date('2013-04-10 16:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-04-10 18:52:00','yyyy-mm-dd hh24:mi:ss'),9120,0);
insert into service_detail values (service_detail_seq.nextval,2008,'192.168.0.1','guojing',123,to_date('2013-04-10 20:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-04-10 22:52:00','yyyy-mm-dd hh24:mi:ss'),9120,0);
insert into service_detail values (service_detail_seq.nextval,2008,'192.168.0.1','guojing',123,to_date('2013-04-11 18:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-04-11 22:52:00','yyyy-mm-dd hh24:mi:ss'),16320,0);

insert into service_detail values (service_detail_seq.nextval,2004,'192.168.0.1','huangr',123,to_date('2013-04-05 20:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-04-05 21:20:00','yyyy-mm-dd hh24:mi:ss'),3600,0);
insert into service_detail values (service_detail_seq.nextval,2005,'192.168.0.1','luwsh',123,to_date('2013-04-05 20:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-04-05 21:20:00','yyyy-mm-dd hh24:mi:ss'),3600,0);
insert into service_detail values (service_detail_seq.nextval,2006,'192.168.0.1','luwsh',123,to_date('2013-04-05 20:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-04-05 21:20:00','yyyy-mm-dd hh24:mi:ss'),3600,0);
insert into service_detail values (service_detail_seq.nextval,2007,'192.168.0.1','weixb',123,to_date('2013-04-05 20:20:00','yyyy-mm-dd hh24:mi:ss'),to_date('2013-04-05 21:20:00','yyyy-mm-dd hh24:mi:ss'),3600,0);


insert into host values ('192.168.0.26','sunv210','beijing');
insert into host values('192.168.0.20','sun-server','beijing');
insert into host values ('192.168.0.23','sun280','beijing');
insert into host values ('192.168.0.200','ultra10','beijing');

