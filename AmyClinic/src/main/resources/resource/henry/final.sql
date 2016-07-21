USE AmyDB
GO

DROP TABLE AppointmentDetail;
DROP TABLE Procedures;
DROP TABLE ProcedureType;
DROP TABLE Score;
DROP TABLE Chat;
DROP TABLE Appointments;
DROP TABLE Schedule;
DROP TABLE Employees;
DROP TABLE OrderItems;
DROP TABLE Orders;
DROP TABLE Products;
DROP TABLE Catagory;
DROP TABLE Members;
DROP TABLE SpaToSales;
DROP TABLE SalesToProd;

CREATE TABLE Catagory(
  cid           DECIMAL(4)      IDENTITY(10,10) PRIMARY KEY,
  name          NVARCHAR(30)    NOT NULL,
);
CREATE TABLE Members(
  mid			DECIMAL(8)		IDENTITY(1000,1) PRIMARY KEY,
  name			NVARCHAR(30)	DEFAULT 'Unknown',  
  pwd			VARCHAR(50)		NOT NULL,
  verify		VARCHAR(50)		DEFAULT '',
  email			VARCHAR(50)		NOT NULL UNIQUE,
  --email			VARCHAR(50)		NOT NULL,
  birthday		DATE			DEFAULT '1970-01-01',
  country		NVARCHAR(20)	DEFAULT '',
  gender		CHAR(1)			, -- enforce in registration code, not enforced to accomodate Google/FB login
  addr			NVARCHAR(50)	, -- ^
  phone			VARCHAR(10)		, -- ^
  height		DECIMAL(3)		,    
  mass			DECIMAL(3)		,			-- weight    
  photo			VARCHAR(50)		,
-- photoFileName	NVARCHAR(50)	,
--  photoContentType VARCHAR(10)	,
  act_status	DECIMAL(1)		DEFAULT 1,	--狀態 2 = waiting for email confirmation, 1 = active, 0 = inactive    
  num_trans		DECIMAL(4)		DEFAULT 0,	-- number of times client spent money on merchandise
  num_treatment	DECIMAL(4)		DEFAULT 0,  -- number of times client received treatments
  num_visits	DECIMAL(4)		DEFAULT 0,	-- number of times client visited 
  total_spent	DECIMAL(15)		DEFAULT 0,	-- total amount spent
  reward_pts	DECIMAL(7)		DEFAULT 0,
  spent_pts 	DECIMAL(7)		DEFAULT 0,
  last_visit	DATE			DEFAULT GETDATE(),			-- last client transaction
  memo			NVARCHAR(300)	DEFAULT ' ',  
  join_date		DATETIME		DEFAULT GETDATE(),  
);
CREATE TABLE Products
( 
  pid           DECIMAL(5)       IDENTITY PRIMARY KEY, 
  name          NVARCHAR(200)    NOT NULL UNIQUE,  
  photo         VARBINARY(MAX)   ,
  amount        DECIMAL(5)       DEFAULT 0,
  cid           DECIMAL(4)       FOREIGN KEY REFERENCES Catagory, 
  price         DECIMAL(6)       NOT NULL,
  discount      DECIMAL(2)       NOT NULL,
  descrip       NVARCHAR(300)    DEFAULT 'Unspecified',
  ingredients   NVARCHAR(300)    DEFAULT 'Unspecified',
--  date_entered    DATETIME        DEFAULT GETDATE(),  
);
CREATE TABLE Orders
( 
  oid           DECIMAL(10)     IDENTITY PRIMARY KEY, 
  mid           DECIMAL(8)      FOREIGN KEY REFERENCES Members,
  recipient     NVARCHAR(20)    NOT NULL,
  total         DECIMAL(10)     NOT NULL,
  points_spent  DECIMAL(7)      DEFAULT 0,
  addr          NVARCHAR(50)    NOT NULL,
  phone         VARCHAR(10)     NOT NULL,
  email         VARCHAR(50)     NOT NULL,
  odate         DATETIME        DEFAULT GETDATE(),
  ostatus       DECIMAL(1)      DEFAULT 0, /*   0 = Order Created / Cancellable
                                                1 = Processing
                                                2 = Order Complete
                                                3 = Order Cancelled
                                           */
  del_status    DECIMAL(1)      DEFAULT 0, /*   0 = Processing
                                                1 = Enroute                                                
                                                2 = Delivered
                                            */
  payment       DECIMAL(1)      DEFAULT 0, /*
                                                0 = Not yet paid
                                                1 = Paid in Full
                                                Partial payment?
                                            */ 
  discount      DECIMAL(2)      DEFAULT 0,
);
CREATE TABLE OrderItems
( 
  id            DECIMAL(4)      IDENTITY PRIMARY KEY, 
  oid           DECIMAL(10)     FOREIGN KEY REFERENCES Orders,
  pid           DECIMAL(5)      FOREIGN KEY REFERENCES Products, 
                                                        -- Product name omitted, get from Products table 
  quantity      DECIMAL(4)      NOT NULL,
  price_per     DECIMAL(10)     NOT NULL,
--  discount        DECIMAL(2)  DEFAULT 0,
);
CREATE TABLE Employees
(
  eid           DECIMAL(5)      IDENTITY PRIMARY KEY,
  name          NVARCHAR(30)    DEFAULT 'Unknown',
  pwd           VARCHAR(40)     NOT NULL,
  email         VARCHAR(50)     NOT NULL UNIQUE,
  photo         VARBINARY(MAX)  ,    
  education     NVARCHAR(500)   NOT NULL,
  experience    NVARCHAR(500)   NOT NULL,
  specialty     NVARCHAR(500)   NOT NULL,
);
CREATE TABLE Schedule  -- need to change PK, eid should be FK to employee table
( 
  sch_id        DECIMAL(4)      IDENTITY(1000, 1) PRIMARY KEY,
  eid           DECIMAL(5)      FOREIGN KEY REFERENCES Employees,   
  c_date        DATE            NOT NULL,
  c_hours       NVARCHAR(13)    NOT NULL,
  appt_num      DECIMAL(3)      NOT NULL,
  appt_status   DECIMAL(1)      DEFAULT 1, -- 1 = Normal, 0 = Stopped
  memo          NVARCHAR(300)   DEFAULT ' ',  
);
CREATE TABLE Appointments
(
 aid			DECIMAL(6)		IDENTITY(1000,1) PRIMARY KEY,
 mid			DECIMAL(8)		FOREIGN KEY REFERENCES Members,
 purpose		DECIMAL(1)		DEFAULT 0, -- 0 = new treatment, 1 = repeat visit
 apt_date		DATE			NOT NULL,
 apt_time		NVARCHAR(5)	NOT NULL,
-- procedureid	VARCHAR(300)		, -- maybe foreign key? 
 descrip		NVARCHAR(300)	DEFAULT ' ',  
 apt_status		DECIMAL(1)		DEFAULT 1, -- 0 = cancelled 1 = normal
 eid			DECIMAL(5)		FOREIGN KEY REFERENCES Employees, 
);
CREATE TABLE ProcedureType
(
  pType_id      DECIMAL(3)      IDENTITY PRIMARY KEY,
  name          NVARCHAR(30)    NOT NULL
);
CREATE TABLE Procedures
(
  procedure_id  DECIMAL(3)      IDENTITY PRIMARY KEY,
  name          NVARCHAR(30)    NOT NULL,
  pType_id      DECIMAL(3)      FOREIGN KEY REFERENCES ProcedureType,
  fee           DECIMAL(9)      DEFAULT '0',
);
CREATE TABLE AppointmentDetail
( 
  ad_id         DECIMAL(4)      IDENTITY PRIMARY KEY, 
  procedure_id  DECIMAL(3)      FOREIGN KEY REFERENCES Procedures,
  aid           DECIMAL(6)      FOREIGN KEY REFERENCES Appointments,
);
CREATE TABLE Chat 
( 
  chat_id       DECIMAL(7)      IDENTITY(1,1) PRIMARY KEY,
  eid           DECIMAL(5)      FOREIGN KEY REFERENCES Employees,
  mid           DECIMAL(8)      FOREIGN KEY REFERENCES Members,
  record        NVARCHAR(MAX)   NOT NULL,
  chattime      DATETIME        DEFAULT GETDATE(),
);
CREATE TABLE Score
(
 score_id       DECIMAL(4)      IDENTITY PRIMARY KEY,  
 mid            DECIMAL(8)		,
 eid            DECIMAL(5)		,
 aid			DECIMAL(6)		,
 st				DECIMAL(1)		DEFAULT 1,  -- Score status, 1 = normal, 0 = "deleted" do not show
 scores         DECIMAL(1)      NOT NULL,        
 comment        NVARCHAR(MAX)   NOT NULL,
 score_date     DATETIME        DEFAULT GETDATE(),
 FOREIGN KEY (mid) REFERENCES Members(mid),
 FOREIGN KEY (eid) REFERENCES Employees(eid), 
 FOREIGN KEY (aid) REFERENCES Appointments(aid), 
);
GO
--產品類別 -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Catagory VALUES ('美容');
INSERT INTO Catagory VALUES ('保養');    
INSERT INTO Catagory VALUES ('面膜');    
INSERT INTO Catagory VALUES ('香水/體香劑');    
INSERT INTO Catagory VALUES ('防曬');        
--會員 -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status,total_spent,photo) VALUES ('Henry','b15e5db3836bff058b253de60c467e00','Henry@group3.com','1981-06-24','台灣','M','台北市大安區復興南路一段390號2樓','0925377000','178','80','1','21','img_Henry@group3.com.jpg');
INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status,total_spent,photo) VALUES ('Beef','b15e5db3836bff058b253de60c467e00','Beef@group3.com','1990-12-12','台灣','F','台北市松山區南京東路3段303巷5號','0925332156','160','42','1','1','img_Beef@group3.com.jpg');
INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status,total_spent,photo) VALUES ('Carrie','b15e5db3836bff058b253de60c467e00','Carrie@group3.com','1989-03-09','台灣','F','台北市大安區復興南路一段390號2-1樓','0959487612','170','65','1','3','img_Carrie@group3.com.jpg');
INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status,total_spent,photo) VALUES ('Nick','b15e5db3836bff058b253de60c467e00','Nick@group3.com','1985-07-30','台灣','M','新北市永和區中山路一段58號','0936598102','169','70','1','3','img_Nick@group3.com.jpg');
INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status,total_spent,photo) VALUES ('Tca','b15e5db3836bff058b253de60c467e00','Tca@group3.com','2000-02-28','台灣','M','台北市松山區八德路3段27號','0945976183','185','63','1','13','img_Tca@group3.com.jpg');
INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status,total_spent,photo) VALUES ('K','b15e5db3836bff058b253de60c467e00','k@group3.com','1970-01-01','台灣','M','新北市永和區中山路一段58號','0909865731','200','59','1','24','img_k@group3.com.jpg');

INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status,total_spent,photo) VALUES ('amy','b15e5db3836bff058b253de60c467e00','amy7@group3.com','1981-06-24','台灣','F','台北市四維路170巷60號4樓','0925377000','178','50','1','0','img_amy7@group3.com.jpg');
--INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status,total_spent) VALUES ('夏語心','b15e5db3836bff058b253de60c467e00','amy8@group3.com','1990-12-12','台灣','F','台北市基隆路二段210號3樓','0925332156','160','42','1','0');
--INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status,total_spent) VALUES ('林嘉綺','b15e5db3836bff058b253de60c467e00','amy9@group3.com','1989-03-09','台灣','F','台北市復興南路二段90巷30號14樓','0959487612','170','55','1','0');
--INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status,total_spent) VALUES ('劉致妤','b15e5db3836bff058b253de60c467e00','amy10@group3.com','1985-07-30','台灣','F','台北市敦化南路一段233巷130號10樓','0936598102','169','60','1','0');
--INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status,total_spent) VALUES ('林芳雪','b15e5db3836bff058b253de60c467e00','amy11@group3.com','2000-02-28','台灣','F','台北市泰順街40巷30號9樓','0945976183','185','43','1','0');
--INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status,total_spent) VALUES ('林雨宣','b15e5db3836bff058b253de60c467e00','amy232@group3.com','1970-01-01','台灣','F','台北市潮州街150號2樓','0909865731','200','69','1','0');

--INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status,total_spent) VALUES ('李亦捷','b15e5db3836bff058b253de60c467e00','amy12@group3.com','1981-06-24','台灣','F','台北市三水街121號','0925377000','178','40','1','0');
--INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status,total_spent) VALUES ('李宗望','b15e5db3836bff058b253de60c467e00','amy913@group3.com','1990-12-12','台灣','F','台北市中華路一段90號2樓','0925332156','160','42','1','0');
--INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status,total_spent) VALUES ('劉曉憶','b15e5db3836bff058b253de60c467e00','amy914@group3.com','1989-03-09','台灣','F','台北市內江街110巷30號3樓','0959487612','170','65','1','0');
--INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status,total_spent) VALUES ('林星潼','b15e5db3836bff058b253de60c467e00','amy915@group3.com','1985-07-30','台灣','F','台北市南寧路48巷1號5樓','0936598102','169','50','1','0');
--INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status,total_spent) VALUES ('李相林','b15e5db3836bff058b253de60c467e00','amy916@group3.com','2000-02-28','台灣','F','台北市萬華區廣州街121號','0945976183','185','63','1','0');
--INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status,total_spent) VALUES ('林雅惠','b15e5db3836bff058b253de60c467e00','amy917@group3.com','1970-01-01','台灣','F','台北市和平西路三段271號4樓','0909865731','200','59','1','0');

/* Member Images are managed by Struts2 and are stored on the server HDD, not stored in DB. DB only contains path information
UPDATE Members SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/m1.jpg', SINGLE_BLOB) AS CategoryImage) WHERE mid = 1000;
UPDATE Members SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/m2.jpg', SINGLE_BLOB) AS CategoryImage) WHERE mid = 1001;
UPDATE Members SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/m3.jpg', SINGLE_BLOB) AS CategoryImage) WHERE mid = 1002;
UPDATE Members SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/m4.jpg', SINGLE_BLOB) AS CategoryImage) WHERE mid = 1003;
UPDATE Members SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/m5.jpg', SINGLE_BLOB) AS CategoryImage) WHERE mid = 1004;
UPDATE Members SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/m6.jpg', SINGLE_BLOB) AS CategoryImage) WHERE mid = 1005;
*/
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('淨白美肌制汗爽身噴霧','5','40','80','20','最懂得呵護女性腋下肌膚有效制汗X淨白美肌','169ml');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('濟州島綠茶清爽保濕身體乳液','500','40','340','0','清爽補水保濕，潔淨滋養，防敏抗氧化，讓肌膚水潤透亮','300ml');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('植萃淨顏三步組','500','20','390','10','淨顏眼唇卸妝液120ml*1、淨顏卸妝乳150ml*1、淨顏潔膚露150ml*1','420ml');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('親柔芙爽身蜜粉','500','40','690','10','足部作起=避邪、除穢、化煞，抗菌孳生，泡澡、都舒爽','280ml');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('蘆薈潤澤乳霜','500','20','139','50','極佳保濕防止乾裂肌膚 清爽不黏膩 適用於臉部及全身','220g');

INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('DHC X disney Alice 聯名限定純欖護唇膏','500','10','290','10','Mr.star日本直送【現貨】新款DHCXdisneyAlice聯名限定純欖護唇膏五月14-17東京連線','1.5g');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('瑪莉貓 marie cat 純欖護唇膏','500','10','550','20','純天然的橄欖精華，無色無味，使用起來安心又滋潤，限定款千萬別錯過','1.5g');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('蜜桃美臀去角質酵素粉','500','20','599','0','MicCosmo日本原裝 Mic COSMO B3蜜桃美臀去角質酵素粉','125g');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('夜遲新谷酵素ORIHIRO NIGHT DIET','500','20','699','10','日本原裝，保證正品','30天份1包5粒');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('日本原裝境內版 酵素&酵母','500','20','1500','30','【日本代購-現貨在台】日本原裝境內版 酵素&酵母 自然 革命 體內環保 2G X 60包 日本銷售第一推','2GX60包 ');

INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('藥片型泡泡沐浴劑','500','20','670','10','適合容易發冷，血液運行緩慢人士。靜靜地享受香氣的milky pink浸浴，消除一整天的疲勞。','50g×8個');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('庶務客日本 現貨 雪肌粹洗面乳','500','20','170','0','* 日本第一品牌洗面乳 * 擠一點點，就有滿滿的泡泡 * 深層清潔,洗後乾爽不黏膩 ','50ml');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('科士威~浪漫香水身體乳液','500','40','110','0','淡淡香味','200ml');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('DHC 純欖護唇膏','500','10','160','0',N'現貨供應，目前日本鎖貨，價格變動大，要買要快!!日本進口、無香料、完美滋潤雙唇!','1.5g');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('孕婦孩童指甲油 水性指甲油 花香指甲油','500','10','894','10',N'ALLOYA 愛若雅 水性環保 指甲油 不再有難聞的化學氣味 而是讓香味持續蔓延 絕對值得您擁有','10ml');

INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('馬油保濕乳霜','500','20','150','10',N'貓麻吉 日本 Loshi 馬油保濕乳霜 尿素特別配合 身體乳液 220g 原裝進口 馬油護膚霜','220g');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('急潤保濕面膜','500','30','890','0',N'‧妝前急救，打底保濕 ‧3重水潤威力，妝感服服貼貼 ‧玻尿酸、胺基酸、維他命B3、高濃縮美容液完美基底','7片/盒');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('超導恆潤飽水面膜','500','30','890','0',N'Dr’s Formula來自長庚專業團隊 ‧玻尿酸、胺基酸、維他命B3、高濃縮美容液完美基底 ','7片/盒');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('金盞花敏弱呵護面膜','500','30','890','0',N'‧特別適用曬後肌膚、肌膚敏感者 ‧創新3D立體面膜紙材','7片/盒');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('淡斑淨膚面膜','500','30','890','0',N'‧黃金比例3重完美綻白配方 打造細緻純淨之透白亮肌 ‧創新3D立體緊顏面膜 打造迷人肌質 ','7片/盒');
--6/8----
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('5V肌因抗老眼部精華','500','20','3600','10',N'vitasourceTM端粒激活素、白珍珠萃取、金雀花萃取、雙效黃金、海洋抗皺、3D隱形網狀結構、法國醣蛋白','50ml');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('綻白淨斑精華','100','10','1800','10',N'Dermawhite肌膚淨白因子、維他命 B3 、桑白皮、和梅果、黃岑漢方複合精華 、玻尿酸、甘草精華、尿囊素。','15ml');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('雪漾鑽白凝乳','100','10','2500','10',N'SRC-黯沉掃除科技、維他命C醣苷(AA-2G)、桑白皮、和梅果、黃岑漢方複合精華、玻尿酸、甘草精華、尿囊素、甜沒藥醇。','30ml');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('柔白晶透防曬乳SPF50+','100','10','1400','10',N'物理性防曬、化學性防曬、GIGAWHITE阿爾卑斯山複合植物淨白精華、阿爾卑斯山雙有機夢蝶草精華、專利和梅果精華。','50ml');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('極速美白璀璨組','100','10','4300','10',N'適合各種肌膚類型，特別是斑點、黯沉、膚色不均的肌膚。','15ml*1、30ml*1');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('全面美白強效組','150','10','5700','20',N'詳見盒面產品說明或成分說明頁面-適合各種肌膚類型，特別是斑點、黯沉、膚色不均的肌膚','15ml*1、30ml*1、50ml*1');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('明星組★星采水潤4步修護組','200','20','5600','20',N'奇肌修復菁粹15ml、肌密水潤透白精華液PLUS+30ml 、極致活妍精質霜50ml、輕透醒膚水凝霜50ml','15ml、30ml、50ml');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('星采極效3步組','200','20','3800','10',N'星采奇肌修復菁粹15ml*1瓶 、星采肌密水潤透白精華液PLUS+30ml*1瓶、星采輕透醒膚水凝霜50ml*1瓶','15ml*1瓶30ml*1、50ml*1瓶');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('3D魔法星采生物纖維面膜/單片裝','120','30','290','10',N'γ-PGA、玻尿酸、五胜肽、甜杏仁精華、Pentacare-Na','單片裝28ml *1 片');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('3D魔法星采生物纖維面膜/三片裝','120','30','790','10',N'γ-PGA、玻尿酸、五胜肽、甜杏仁精華、Pentacare-Na','三片裝28ml *3 片');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('卸妝潔顏幕絲','120','10','800','10',N'胺基酸潔淨因子、蜂蜜潤澤精華、水解膠原蛋白、木瓜酵素、甘草精華','180ml');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('奇肌修復菁粹','200','10','1100','10',N'第三型神經醯胺CeramideⅢ、角鯊烯Squalene、西蘭花苗萃取物、紫草萃取物','15ml');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('奢華升級星采肌密水潤透白精華液PLUS+','150','20','1200','10',N'玻尿酸鈉、小分子玻尿酸、海洋保濕因子、SK-influx微脂囊包覆神經醯胺、玻尿酸鈉、小分子玻尿酸、海洋保濕因子','50ml');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('極致活妍精質霜','200','20','1800','10',N'蜂王漿水解蛋白、冰洋紅藻精萃、白柳葉萃取、微型海藻精萃、紫草萃取物、西蘭花苗萃取、第三型神經醯胺','50ml');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('輕透醒膚水凝霜','200','20','1500','10',N'r-PGA高效活水保濕因子、神經醯胺修護素、深海微量礦物元素、海藻萃取精華、維生素E衍生物','50ml');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('Crystal Bloom Snow Eau de Parfum','500','40','5400','20',N'天然香料:香碗豆、雪花蓮、檸檬*、香橙*、佛手柑*、蘋果、布冧、黑加侖子、香雪蘭','50mL');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('Crystal Bloom Eau de Parfum','500','40','5400','20',N'前調是以水漾感覺及惹人憐愛感覺編織而成的純潔水晶花香味。香碗豆、雪花蓮柔弱的甜味洋溢著溫柔的香氣，橙花油和香橙韻蘊釀出無限的透明感。','50mL');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('Tuberose & Rose fabric fragrance','300','40','1900','20',N'噴在衣物或床單上，享受浪漫幸福玫瑰香氣的衣物香水。在窗簾或手袋內側布料上亦可大範圍使用。','200ml');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('RELAX eau de white floral','400','40','2850','10',N'由白色和粉紅色的鮮花，天然香薰油芳香的絕妙配合而成aromatic white floral bouquet香氣，包圍柔軟幸福感的eau de cologne','50ml');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('RELAX fabric fragrance','100','40','1900','10',N'･噴在衣物或床單上，享受舒適幸福香氣的衣物香水。･以富透明感、清潔感的白色作為主要顏色設計。標籤部分以可愛的碎花圖案及JILL STUART的粉紅色為重點。','200ml');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('BON MARIAGE pillow & room fragrance','300','40','6700','10',N'･來自橙花精油的奢華香氣，為你帶來幸福時間和空間的香皂。可因應環境及心情，享受2種香味的快樂。','100mL x 2瓶');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('Vanilla Lust Eau de Parfum','500','40','5600','10',N'從前調的核果糖甜蜜美味吸引鼻子注意力，愛吃者的甜美香調。像溶化一樣的牛奶糖和椰子的香味散發開來。中調以白色茉莉花瓣的香氣為中心，成熟的水果花香味。','50ml');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('Night Jewel Summer Bloom Eau de Toilette','500','40','3700','10',N'舒適奢華又清新甜美的純真花香。藴含百合、木蘭花、Beauty of the Night（紫茉莉）、Queen of the Night（曇花）等動人的花朵，猶如散發璀璨光輝般相繼綻放。','50mL');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('Jill by JILL STUART Eau De Toilette','200','40','5200','10',N'「香味是最與我們最貼身的珠寶」。香水，是Jill Stuart重視是item。以「注入實現夢想和願望魔法的小瓶」為設計靈感，甜美的香水就此誕生。','50mL');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('Floral marine mineral UV protector','200','50','1900','10',N'融入肌膚的清爽輕盈觸感，於紫外線下守護肌膚的限定防曬霜。可用於面部和全身。(SPF50+/PA++++)','50mL');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('RELAX aqua chiffon protectorW','200','50','1900','10',N'水潤質地，能順滑地延展，啫喱狀的防曬霜。滋潤度、無負擔感的質感和防曬度數SPF50+/PA++++不變的同時，提升了從強烈紫外線和空氣污染等環境下守護肌膚的效果。','60g');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('ANGEL mild UV milk','200','50','2200','10',N'･順滑柔和的質感，易於推勻的防曬乳。･Milky lotion type，清爽不黏稠的觸感，在肌膚上形成的舒適薄膜，守護肌膚避免紫外線所造成的傷害。･配合杏仁油、植物性角鯊烷，同時給予肌膚滋潤。','60mL');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('RELAX shimmer body protector','200','50','1900','10',N'･輕薄的觸感潤澤地延展，如薄膜的面紗一樣，對肌膚零負擔，可以阻擋強烈的紫外線的身體專用防曬。即使是戶外活動的時候亦不易脫落，可安心享受戶外活動的快樂。','50mL');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('Floral marine mineral mist refresh oil control','300','20','1800','10',N'噴上後細緻的噴霧延展，滋潤每寸肌膚。2種清涼成分(薄荷腦)給予肌膚清涼感，鎮靜泛紅肌膚的觸感。每當噴上都有清涼爽快的舒適感，享受清新的香味。','60mL');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('RELAX fresh hand gel','500','20','1500','10',N'不用水卻讓手部清新乾爽的hand gel。在手部感到黏稠的時候或從室外回來的時候簡單使用。･清爽的涼快感讓手部肌膚乾爽同時沒有乾燥感，締造水潤的手部肌膚。','250mL');
--UPDATE Products 
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p1.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 1;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p2.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 2;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p3.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 3;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p4.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 4;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p5.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 5;

UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p6.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 6;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p7.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 7;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p8.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 8;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p9.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 9;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p10.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 10;

UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p11.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 11;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p12.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 12;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p13.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 13;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p14.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 14;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p15.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 15;

UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p16.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 16;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p17.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 17;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p18.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 18;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p19.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 19;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p20.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 20;
--6/8----
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p21.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 21;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p22.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 22;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p23.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 23;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p24.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 24;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p25.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 25;

UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p26.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 26;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p27.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 27;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p28.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 28;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p29.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 29;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p30.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 30;

UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p31.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 31;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p32.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 32;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p33.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 33;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p34.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 34;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p35.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 35;

UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p36.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 36;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p37.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 37;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p38.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 38;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p39.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 39;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p40.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 40;

UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p41.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 41;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p42.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 42;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p43.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 43;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p44.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 44;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p45.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 45;

UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p46.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 46;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p47.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 47;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p48.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 48;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p49.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 49;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p50.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 50;
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Employees (name, education, pwd, email, experience, specialty) VALUES ('張文遠','台灣大學醫學院','gWkWJXRSRI7zIMWOVWqhqg==','Pocky@Amy.com','臺北馬偕紀念醫院實習醫師(1989-1990)高雄海軍總醫院小兒科少尉醫官(1990-1991)烏坵海軍檢診所內兒科少尉醫官(1991-1992)','雷射去斑/痣、雷射磨皮、脈衝光除痘、脈衝光回春、電波拉皮');
INSERT INTO Employees (name, education, pwd, email, experience, specialty) VALUES ('諸葛亮','成功醫學大學','gWkWJXRSRI7zIMWOVWqhqg==','Kindle@Amy.com','成功大學醫學院附設醫院小兒科住院醫師(1992-1995)成功大學醫學院附設醫院小兒科住院總醫師(1995-1996)成功大學醫學院附設醫院美容醫學科研究員(1995-1996)','玻尿酸、肉毒桿菌、美白針、植髮');
INSERT INTO Employees (name, education, pwd, email, experience, specialty) VALUES ('夏侯惇','中山醫藥大學','gWkWJXRSRI7zIMWOVWqhqg==','Hershes@Amy.com','國立臺灣大學醫學院醫學系(1978-1985)國立臺灣大學醫學院臨床醫學研究所(1991-1994)國立臺灣大學管理學院高階管理碩士專班 (2006-2009)','抽脂、隆乳、雙眼皮手術、眼袋手術、拉皮手術、隆鼻');
INSERT INTO Employees (name, education, pwd, email, experience, specialty) VALUES ('張君雅','台灣大學醫學院','gWkWJXRSRI7zIMWOVWqhqg==','Pocky1@Amy.com','台灣大學醫學院附設醫院小兒心臟科研究員(1996-1997)成功大學醫學院附設醫院美容醫學科研究員(1997-1999)','微整形、醫美市場發展趨勢與醫療環境、超音波醫學、回春類醫學美容');
INSERT INTO Employees (name, education, pwd, email, experience, specialty) VALUES ('史奴比','中國醫藥大學','gWkWJXRSRI7zIMWOVWqhqg==','Kindle1@Amy.com','英爵醫美(1995-2013)','美容護膚、微整型注射治療 (玻尿酸、微晶瓷)、韓式隆鼻');
INSERT INTO Employees (name, education, pwd, email, experience, specialty) VALUES ('高飛','M.D. UCSB','gWkWJXRSRI7zIMWOVWqhqg==','qazwsx851827@gmail.com','首爾醫美(1990-2010)','美容醫學手術、美容醫學針劑注射、超音波醫學、基因體醫學');
INSERT INTO Employees (name, education, pwd, email, experience, specialty) VALUES ('許小姐','龍華科大','gWkWJXRSRI7zIMWOVWqhqg==','qqq@qqq.com','科大實習生','行銷管理');

UPDATE Employees SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/e1.jpg', SINGLE_BLOB) AS CategoryImage) WHERE eid = 1;
UPDATE Employees SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/e2.jpg', SINGLE_BLOB) AS CategoryImage) WHERE eid = 2;
UPDATE Employees SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/e3.jpg', SINGLE_BLOB) AS CategoryImage) WHERE eid = 3;
UPDATE Employees SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/e4.jpg', SINGLE_BLOB) AS CategoryImage) WHERE eid = 4;
UPDATE Employees SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/e5.jpg', SINGLE_BLOB) AS CategoryImage) WHERE eid = 5;
UPDATE Employees SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/e6.jpg', SINGLE_BLOB) AS CategoryImage) WHERE eid = 6;
UPDATE Employees SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/e7.jpg', SINGLE_BLOB) AS CategoryImage) WHERE eid = 7;
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ProcedureType (name) VALUES ('整形手術');
INSERT INTO ProcedureType (name) VALUES ('雷射光療');
INSERT INTO ProcedureType (name) VALUES ('瘦身雕塑');
INSERT INTO ProcedureType (name) VALUES ('微整形');
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Procedures (name,pType_id,fee) VALUES ('豐胸術','1','100000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('隆鼻術','1','20000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('脂肪移植','1','50000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('拉皮術','1','30000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('蘿蔔腿縮小術','1','40000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('雙眼皮','1','10000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('雷射除毛','2','20000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('雷射淨膚','2','20000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('雷射除痣','2','20000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('粉餅雷射','2','20000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('變頻飛梭','2','20000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('脈衝光','2','20000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('震波減脂','3','300000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('冷凍減脂','3','300000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('威塑減脂','3','300000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('水刀抽脂','3','300000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('爆脂衝擊波','3','300000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('黃金脂雕','3','300000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('波尿酸','4','4000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('晶亮瓷','4','4000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('水微晶','4','4000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('膠原蛋白','4','4000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('微針療程','4','4000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('無痕植髮','4','4000');
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Score (mid,eid,scores,comment) VALUES ('1000','1','1','無效退費');
INSERT INTO Score (mid,eid,scores,comment) VALUES ('1005','2','3','一級棒');
INSERT INTO Score (mid,eid,scores,comment) VALUES ('1003','3','5','第一次做醫美，覺得這家給我的體驗還不錯，診所呈現乾淨又漂亮的專業感，小姐們也親切，最重要的是我皮膚真的有變好 :D');
INSERT INTO Score (mid,eid,scores,comment) VALUES ('1001','1','3','好');
INSERT INTO Score (mid,eid,scores,comment) VALUES ('1002','2','5','醫生好漂亮');
INSERT INTO Score (mid,eid,scores,comment) VALUES ('1004','3','1','好棒棒');

INSERT INTO Score (mid,eid,scores,comment) VALUES ('1000','4','5','診所整個環境漂亮又乾淨，小姐們親切又專業，醫師都是名醫技術真的沒話說，真的是物超所値，值得推薦！讚！');
INSERT INTO Score (mid,eid,scores,comment) VALUES ('1005','4','5','這裡真是人間仙境，美景佳人一切是那麼的完美有如都市裡的森林，覺得整個人都活絡起來了！！！');
INSERT INTO Score (mid,eid,scores,comment) VALUES ('1003','4','3','音樂好聽、環境舒適漂亮，療程做完感覺蠻有效的，可惜我錢不多窮窮的，不然應該會常來啦～');
INSERT INTO Score (mid,eid,scores,comment) VALUES ('1001','5','4','大家都很親切也都不會有推銷的感覺值得去的醫美診所');
INSERT INTO Score (mid,eid,scores,comment) VALUES ('1002','6','3','價格優惠，服務親切，醫生細心又專業，診所環境更是一級棒啦~');
INSERT INTO Score (mid,eid,scores,comment) VALUES ('1004','6','1','技術真的沒話說');
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Chat (eid,mid,record) VALUES ('1','1001','30');
INSERT INTO Chat (eid,mid,record) VALUES ('2','1002','15');
INSERT INTO Chat (eid,mid,record) VALUES ('3','1003','25');
INSERT INTO Chat (eid,mid,record) VALUES ('1','1004','7');
INSERT INTO Chat (eid,mid,record) VALUES ('2','1005','9');
INSERT INTO Chat (eid,mid,record) VALUES ('3','1000','16');
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Orders (mid,recipient,total,addr,phone,email) VALUES ('1000','梁啟超','690','1880 Hartwell Road','0989118086','alvinreidKHg@teleosaurs.xyz');
INSERT INTO Orders (mid,recipient,total,addr,phone,email) VALUES ('1001','Halle Ray','139','3897 Ottawa Road','0937071705','halleraycVv@teleosaurs.xyz');
INSERT INTO Orders (mid,recipient,total,addr,phone,email) VALUES ('1002','Christ Richard','340','1880 Hartwell Road','0973182850','christ@teleosaurs.xyz');
INSERT INTO Orders (mid,recipient,total,addr,phone,email) VALUES ('1003','Jonatan Mendoza','390','5413 Natchez Boulevard','0917301245','jonatanmendozaZaq@teleosaurs.xyz');
INSERT INTO Orders (mid,recipient,total,addr,phone,email) VALUES ('1004','Angelica Booth','1380','    9084 Rundell Lane','0987243640','angelicaboothyHe@teleosaurs.xyz');
INSERT INTO Orders (mid,recipient,total,addr,phone,email) VALUES ('1005','Randy Shelton','690','5672 Mccook Road','0915525479','randysheltonK7r@teleosaurs.xyz');

INSERT INTO Orders (mid,recipient,total,addr,phone,email) VALUES ('1005','Randy Shelton','139','5672 Mccook Road','0915525479','randysheltonK7r@teleosaurs.xyz');
INSERT INTO Orders (mid,recipient,total,addr,phone,email) VALUES ('1005','Randy Shelton','139','5672 Mccook Road','0915525479','randysheltonK7r@teleosaurs.xyz');
INSERT INTO Orders (mid,recipient,total,addr,phone,email) VALUES ('1005','Randy Shelton','139','5672 Mccook Road','0915525479','randysheltonK7r@teleosaurs.xyz');
INSERT INTO Orders (mid,recipient,total,addr,phone,email) VALUES ('1005','Randy Shelton','139','5672 Mccook Road','0915525479','randysheltonK7r@teleosaurs.xyz');
INSERT INTO Orders (mid,recipient,total,addr,phone,email) VALUES ('1005','Randy Shelton','680','5672 Mccook Road','0915525479','randysheltonK7r@teleosaurs.xyz');
INSERT INTO Orders (mid,recipient,total,addr,phone,email) VALUES ('1005','Randy Shelton','890','5672 Mccook Road','0915525479','randysheltonK7r@teleosaurs.xyz');

INSERT INTO Orders (mid,recipient,total,addr,phone,email) VALUES ('1000','梁啟超','770','1880 Hartwell Road','0989118086','alvinreidKHg@teleosaurs.xyz');
INSERT INTO Orders (mid,recipient,total,addr,phone,email,odate) VALUES ('1000','梁啟超','800','1880 Hartwell Road','0989118086','alvinreidKHg@teleosaurs.xyz','2015-6-6');
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO OrderItems (oid,pid,quantity,price_per) VALUES ('1','4','1','690');
INSERT INTO OrderItems (oid,pid,quantity,price_per) VALUES ('2','5','1','139');
INSERT INTO OrderItems (oid,pid,quantity,price_per) VALUES ('3','2','1','340');
INSERT INTO OrderItems (oid,pid,quantity,price_per) VALUES ('4','3','1','390');
INSERT INTO OrderItems (oid,pid,quantity,price_per) VALUES ('5','4','2','1380');
INSERT INTO OrderItems (oid,pid,quantity,price_per) VALUES ('6','4','1','690');

INSERT INTO OrderItems (oid,pid,quantity,price_per) VALUES ('7','5','1','139');
INSERT INTO OrderItems (oid,pid,quantity,price_per) VALUES ('8','5','1','139');
INSERT INTO OrderItems (oid,pid,quantity,price_per) VALUES ('9','5','1','139');
INSERT INTO OrderItems (oid,pid,quantity,price_per) VALUES ('10','5','1','139');
INSERT INTO OrderItems (oid,pid,quantity,price_per) VALUES ('11','3','2','680');
INSERT INTO OrderItems (oid,pid,quantity,price_per) VALUES ('12','20','1','890');
INSERT INTO OrderItems (oid,pid,quantity,price_per) VALUES ('13','13','7','770');
INSERT INTO OrderItems (oid,pid,quantity,price_per) VALUES ('14','1','10','800');
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-1-22' , '早診' , '1' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-1-22' , '早診' , '1' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-1-22' , '早診' , '1' , '瘦身雕塑' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-1-22' , '早診' , '1' , '微整形' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-1-22','早診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-1-22','早診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-1-22','早診','瘦身雕塑','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-1-22','早診','微整形','1','6');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('4','1000');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('7','1001');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('14','1002');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('22','1003');
--1月k
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-2-22' , '早診' , '1' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-2-22' , '早診' , '1' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-2-22' , '早診' , '1' , '瘦身雕塑' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-2-22' , '早診' , '1' , '微整形' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-2-22','早診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-2-22','早診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-2-22','早診','瘦身雕塑','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-2-22','早診','微整形','1','6');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('1','1004');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('7','1005');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('13','1006');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('24','1007');
--2月k

INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-3-22' , '早診' , '1' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-3-22' , '早診' , '1' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-3-22' , '早診' , '1' , '瘦身雕塑' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-3-22' , '早診' , '1' , '微整形' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-3-22','早診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-3-22','早診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-3-22','早診','瘦身雕塑','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-3-22','早診','微整形','1','6');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('1','1008');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('13','1009');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('7','1010');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('24','1011');
--3月k

INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-4-22' , '早診' , '1' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-4-22' , '早診' , '1' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-4-22' , '早診' , '1' , '瘦身雕塑' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-4-22' , '早診' , '1' , '微整形' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-4-22','早診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-4-22','早診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-4-22','早診','瘦身雕塑','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-4-22','早診','微整形','1','6');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('1','1012');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('7','1013');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('13','1014');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('23','1015');
--4月k

INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-5-24' , '早診' , '2' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','1','2016-5-24','早診','整形手術','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-5-24','早診','整形手術','1','5');--1
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('21','1016');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('15','1017');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-5-24' , '午診' , '3' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-5-24','午診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1002','1','2016-5-24','午診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','1','2016-5-24','午診','整形手術','1','6');--2
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('3','1018');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1019');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('13','1020');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-5-24' , '晚診' , '1' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1002','1','2016-5-24','晚診','整形手術','1','4');--3--4
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('22','1021');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-5-25' , '早診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-5-25' , '午診' , '1' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-5-25','午診','雷射光療','1','4');--5
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('23','1022');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-5-25' , '晚診' , '2' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-5-25','晚診','雷射光療','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-5-25','晚診','雷射光療','1','5');--6
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('6','1023');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1024');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-5-26' , '早診' , '3' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-5-26','早診','整形手術','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-5-26','早診','整形手術','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1002','1','2016-5-26','早診','整形手術','1','5');--7--8
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('8','1025');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('11','1026');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('23','1027');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-5-26' , '午診' , '0' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-5-26' , '晚診' , '1' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-5-26','晚診','整形手術','1','4');--9
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('21','1028');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-5-27' , '早診' , '2' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-5-27','早診','雷射光療','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-5-27','早診','雷射光療','1','4');--10
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('15','1029');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('3','1030');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-5-27' , '午診' , '3' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-5-27','午診','雷射光療','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-5-27','午診','雷射光療','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1002','1','2016-5-27','午診','雷射光療','1','5');--11--12
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1031');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('13','1032');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('22','1033');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-5-27' , '晚診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-5-28' , '早診' , '1' , '瘦身雕塑' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-5-28','早診','瘦身雕塑','1','4');--13
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('23','1034');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-5-28' , '午診' , '2' , '微整形' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-5-28','午診','微整形','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-5-28','午診','微整形','1','6');--14
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('6','1035');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('4','1036');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-5-28' , '晚診' , '3' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-5-28','晚診','整形手術','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-5-28','晚診','整形手術','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1002','1','2016-5-28','晚診','整形手術','1','5');--15--16
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('7','1037');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('14','1038');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('22','1039');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-5-30' , '早診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-5-30' , '午診' , '1' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-5-30','午診','雷射光療','1','5');--17
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('19','1040');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-5-30' , '晚診' , '2' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-5-30','晚診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-5-30','晚診','雷射光療','1','6');--18
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('5','1041');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('24','1042');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-5-31' , '早診' , '3' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-5-31','早診','雷射光療','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-5-31','早診','雷射光療','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1002','1','2016-5-31','早診','雷射光療','1','5');--19--20
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('17','1043');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('1','1044');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('12','1045');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-5-31' , '午診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-5-31' , '晚診' , '1' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-5-31','晚診','雷射光療','0','4');--21
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('9','1046');
--5月k


INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-1' , '早診' , '2' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-6-1','早診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-6-1','早診','整形手術','1','6');--22
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('3','1047');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1048');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-1' , '午診' , '3' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-1','午診','雷射光療','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-1','午診','雷射光療','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1002','1','2016-6-1','午診','雷射光療','1','4');--23--24
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('8','1049');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('11','1050');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('23','1051');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-1' , '晚診' , '0' , '瘦身雕塑' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-2' , '早診' , '1' , '微整形' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-6-2','早診','微整形','1','5');--25
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('21','1052');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-2' , '午診' , '2' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-6-2','午診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-6-2','午診','整形手術','1','6');--26
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('15','1053');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('3','1054');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-2' , '晚診' , '3' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-2','晚診','雷射光療','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-2','晚診','雷射光療','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1002','1','2016-6-2','晚診','雷射光療','1','4');--27,28,29
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1055');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('13','1056');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('22','1057');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , appt_status , memo )   VALUES  ( '4' , '2016-6-3' , '早診' , '0' , '0' , '休假' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-3' , '午診' , '0' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-3' , '晚診' , '1' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-6-3','晚診','雷射光療','1','6');--30
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('23','1058');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-4' , '早診' , '2' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-6-4','早診','整形手術','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-6-4','早診','整形手術','1','4');--31
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('6','1059');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1060');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-4' , '午診' , '3' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-4','午診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-4','午診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1002','1','2016-6-4','午診','整形手術','1','6');--32,33
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('8','1061');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('11','1062');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('23','1063');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-4' , '晚診' , '0' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-6' , '早診' , '1' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-6-6','早診','雷射光療','1','4');--34
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('21','1064');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-6' , '午診' , '2' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-6-6','午診','雷射光療','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-6-6','午診','雷射光療','1','5');--35
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('15','1065');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('3','1066');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-6' , '晚診' , '3' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-6','晚診','雷射光療','1','1');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-6','晚診','雷射光療','1','2');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1002','1','2016-6-6','晚診','雷射光療','1','3');--36--37
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1067');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('13','1068');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('22','1069');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-7' , '早診' , '0' , '瘦身雕塑' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-7' , '午診' , '1' , '微整形' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-6-7','午診','微整形','1','6');--38
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('23','1070');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-7' , '晚診' , '2' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-6-7','晚診','整形手術','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-6-7','晚診','整形手術','1','4');--39
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('6','1071');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('4','1072');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-8' , '早診' , '3' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-8','早診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-8','早診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1002','1','2016-6-8','早診','雷射光療','1','6');--40,41
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('7','1073');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('14','1074');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('22','1075');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-8' , '午診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-8' , '晚診' , '1' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-6-8','晚診','雷射光療','1','5');--42
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('19','1076');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-9' , '早診' , '2' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-6-9','早診','雷射光療','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-6-9','早診','雷射光療','1','5');--43
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('5','1077');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('24','1078');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-9' , '午診' , '3' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-9','午診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-9','午診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1002','1','2016-6-9','午診','雷射光療','1','6');--44,45
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('17','1079');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('1','1080');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('12','1081');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-9' , '晚診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-10' , '早診' , '1' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-6-10','早診','整形手術','1','4');--46
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('9','1082');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-10' , '午診' , '2' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-6-10','午診','雷射光療','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-6-10','午診','雷射光療','1','5');--47
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('3','1083');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1084');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-10' , '晚診' , '3' , '瘦身雕塑' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-10','晚診','瘦身雕塑','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-10','晚診','瘦身雕塑','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1002','1','2016-6-10','晚診','瘦身雕塑','1','6');--48--49
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('8','1085');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('11','1086');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('23','1087');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-11' , '早診' , '0' , '微整形' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-11' , '午診' , '1' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-6-11','午診','整形手術','1','6');--50
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('21','1088');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-11' , '晚診' , '2' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-6-11','晚診','雷射光療','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-6-11','晚診','雷射光療','1','5');--51
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('15','1089');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('3','1090');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , appt_status , memo )   VALUES  ( '4' , '2016-6-13' , '早診' , '0' , '0' , '休假' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-13' , '午診' , '3' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-13','午診','整形手術','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-13','午診','整形手術','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1002','1','2016-6-13','午診','整形手術','1','5');--52,53
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1091');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('13','1092');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('22','1093');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-13' , '晚診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-14' , '早診' , '1' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-6-14','早診','整形手術','1','5');--54
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-14' , '午診' , '2' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-6-14','午診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-6-14','午診','整形手術','1','6');--55
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('23','1094');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('6','1095');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('6','1096');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-14' , '晚診' , '3' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-14','晚診','整形手術','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-14','晚診','整形手術','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1002','1','2016-6-14','晚診','整形手術','1','4');--56,57
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1097');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('8','1098');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('11','1099');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-15' , '早診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-15' , '午診' , '1' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-6-15','午診','雷射光療','1','4');--58
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('23','1100');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-15' , '晚診' , '2' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-6-15','晚診','雷射光療','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-6-15','晚診','雷射光療','1','5');--59
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('21','1101');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-16' , '早診' , '3' , '瘦身雕塑' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-16','早診','瘦身雕塑','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-16','早診','瘦身雕塑','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1002','1','2016-6-16','早診','瘦身雕塑','1','5');--60,61
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('1','1102');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('15','1103');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1104');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-16' , '午診' , '0' , '微整形' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-16' , '晚診' , '1' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-6-16','晚診','整形手術','1','4');--62
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('21','1105');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-17' , '早診' , '3' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-6-17','早診','雷射光療','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-6-17','早診','雷射光療','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-17','早診','雷射光療','1','4');--63
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('22','1106');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('24','1107');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1108');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-17' , '午診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-17' , '晚診' , '3' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1002','1','2016-6-17','晚診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-6-17','晚診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-6-17','晚診','雷射光療','1','6');--64
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('12','1109');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('21','1110');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('5','1111');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-18' , '早診' , '1' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-6-18','早診','雷射光療','1','4');--65
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('5','1112');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-18' , '午診' , '2' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-18','午診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-18','午診','雷射光療','1','6');--66
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('15','1113');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('3','1114');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-18' , '晚診' , '3' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-18','晚診','雷射光療','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-18','晚診','雷射光療','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-18','晚診','雷射光療','1','5');--67
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('6','1115');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('7','1116');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('8','1117');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-20' , '早診' , '3' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-20','早診','整形手術','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-20','早診','整形手術','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-20','早診','整形手術','1','4');--68
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('6','1118');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('7','1119');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('8','1120');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-20' , '午診' , '2' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-20','午診','雷射光療','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-20','午診','雷射光療','1','5');--69
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('6','1121');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('7','1122');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-20' , '晚診' , '1' , '瘦身雕塑' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-20','晚診','瘦身雕塑','1','6');--70
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('17','1123');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-21' , '早診' , '2' , '微整形' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-21','早診','微整形','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-21','早診','微整形','1','5');--71
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('7','1124');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('1','1125');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-21' , '午診' , '2' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-21','午診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-21','午診','整形手術','1','6');--72
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1126');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('15','1127');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-21' , '晚診' , '3' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-21','晚診','雷射光療','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-21','晚診','雷射光療','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-21','晚診','雷射光療','1','4');--73
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('5','1128');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('15','1129');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('24','1130');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-22' , '早診' , '1' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-22','早診','整形手術','1','6');--74
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('15','1131');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-22' , '午診' , '3' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-22','午診','雷射光療','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-22','午診','雷射光療','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-22','午診','雷射光療','1','4');--75
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('5','1132');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('15','1133');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1134');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , appt_status , memo )   VALUES  ( '5' , '2016-6-22' , '晚診' , '0' , '0' , '休假' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-23' , '早診' , '2' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-23','早診','整形手術','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-23','早診','整形手術','1','5');--76
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('15','1135');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('5','1136');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-23' , '午診' , '3' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-23','午診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-23','午診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-23','午診','整形手術','1','6');--77
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('15','1137');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('15','1138');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('5','1139');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-23' , '晚診' , '1' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-23','晚診','整形手術','1','6');--78
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('9','1140');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-24' , '早診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-24' , '午診' , '1' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-24','午診','雷射光療','1','5');--79
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('23','1141');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-24' , '晚診' , '3' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-24','晚診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-24','晚診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-24','晚診','雷射光療','1','6');--80
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1142');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1143');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('19','1144');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-25' , '早診' , '3' , '瘦身雕塑' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-25','早診','瘦身雕塑','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-25','早診','瘦身雕塑','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-25','早診','瘦身雕塑','1','4');--81
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1145');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1146');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('19','1147');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-25' , '午診' , '3' , '微整形' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-25','午診','微整形','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-25','午診','微整形','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-25','午診','微整形','1','6');--82
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1148');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1149');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('19','1150');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-25' , '晚診' , '3' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-25','晚診','整形手術','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-25','晚診','整形手術','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-25','晚診','整形手術','1','5');--83
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1151');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1152');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('19','1153');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-27' , '早診' , '2' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-27','早診','雷射光療','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-27','早診','雷射光療','1','4');--84
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('1','1154');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1155');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-27' , '午診' , '1' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-27','午診','雷射光療','1','5');--85
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1156');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-27' , '晚診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-28' , '早診' , '3' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-28','早診','雷射光療','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-28','早診','雷射光療','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-28','早診','雷射光療','1','5');--86
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1157');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1158');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('8','1159');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-28' , '午診' , '1' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-28','午診','雷射光療','1','6');--87
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1160');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-28' , '晚診' , '2' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-28','晚診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-28','晚診','雷射光療','1','6');--88
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1161');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1162');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-29' , '早診' , '1' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-29','早診','整形手術','1','6');--89
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1163');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-29' , '午診' , '2' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-29','午診','雷射光療','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-29','午診','雷射光療','1','4');--90
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1164');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1165');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-29' , '晚診' , '3' , '瘦身雕塑' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-29','晚診','瘦身雕塑','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-29','晚診','瘦身雕塑','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-29','晚診','瘦身雕塑','1','5');--91
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1166');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1167');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1168');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-30' , '早診' , '0' , '微整形' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-30' , '午診' , '3' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-30','午診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-30','午診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-30','午診','整形手術','1','6');--92
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1169');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1170');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1171');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-30' , '晚診' , '2' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-30','晚診','雷射光療','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-30','晚診','雷射光療','1','4');--93
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1172');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1173');
--6月k



INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-7-1' , '早診' , '1' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-7-1','早診','整形手術','1','4');--94
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('1','1174');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , appt_status , memo )   VALUES  ( '5' , '2016-7-1' , '午診' , '0' , '0' , '休假' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-7-1' , '晚診' , '3' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-1','晚診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-7-1','晚診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-7-1','晚診','雷射光療','1','6');--95
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('1','1175');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1176');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1177');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-7-2' , '早診' , '2' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-2','早診','整形手術','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-7-2','早診','整形手術','1','4');--96
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1178');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1179');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-7-2' , '午診' , '3' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-7-2','午診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-2','午診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-7-2','午診','整形手術','1','6');--97
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('1','1180');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1181');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1182');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-7-2' , '晚診' , '1' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-7-2','晚診','整形手術','1','5');--98
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1183');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-7-4' , '早診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-7-4' , '午診' , '1' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-4','午診','雷射光療','1','5');--99
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1184');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-7-4' , '晚診' , '2' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-7-4','晚診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-7-4','晚診','雷射光療','1','6');--100
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1185');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1186');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-7-5' , '早診' , '3' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-5','早診','雷射光療','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-7-5','早診','雷射光療','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-7-5','早診','雷射光療','1','5');--101
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('1','1187');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1188');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1189');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-7-5' , '午診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-7-5' , '晚診' , '1' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-5','晚診','雷射光療','1','4');--102
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1190');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-7-6' , '早診' , '2' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-7-6','早診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-7-6','早診','整形手術','1','6');--103
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1191');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('1','1192');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-7-6' , '午診' , '3' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-6','午診','雷射光療','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-7-6','午診','雷射光療','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-7-6','午診','雷射光療','1','4');--104
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('1','1193');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1194');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1195');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-7-6' , '晚診' , '0' , '瘦身雕塑' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-7-7' , '早診' , '1' , '微整形' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-7','早診','微整形','1','5');--105
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1196');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-7-7' , '午診' , '2' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-7-7','午診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-7-7','午診','整形手術','1','6');--106
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1197');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1198');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-7-7' , '晚診' , '3' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-7','晚診','雷射光療','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-7-7','晚診','雷射光療','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-7-7','晚診','雷射光療','1','4');--107
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('1','1199');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1200');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1201');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , appt_status , memo )   VALUES  ( '4' , '2016-7-8' , '早診' , '0' , '0' , '休假' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-7-8' , '午診' , '0' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-7-8' , '晚診' , '1' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-8','晚診','雷射光療','1','6');--108
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1202');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-7-9' , '早診' , '2' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-7-9','早診','整形手術','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-7-9','早診','整形手術','1','4');--109
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1203');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1204');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-7-9' , '午診' , '3' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-9','午診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-7-9','午診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-7-9','午診','整形手術','1','6');--110
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1205');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1206');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1207');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-7-9' , '晚診' , '0' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-7-11' , '早診' , '1' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-11','早診','雷射光療','1','4');--111
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1208');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-7-11' , '午診' , '2' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-7-11','午診','雷射光療','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-7-11','午診','雷射光療','1','5');--112
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1209');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1210');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-7-11' , '晚診' , '3' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-11','晚診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-7-11','晚診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-7-11','晚診','雷射光療','1','6');--113
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1211');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1212');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1213');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-7-12' , '早診' , '0' , '瘦身雕塑' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-7-12' , '午診' , '1' , '微整形' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-12','午診','微整形','1','6');--114
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1214');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-7-12' , '晚診' , '2' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-7-12','晚診','整形手術','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-7-12','晚診','整形手術','1','4');--115
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('11','1215');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1216');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-7-13' , '早診' , '3' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-13','早診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-7-13','早診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-7-13','早診','雷射光療','1','6');--116
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1217');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1218');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1219');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-7-13' , '午診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-7-13' , '晚診' , '1' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-13','晚診','雷射光療','1','5');--117
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1220');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-7-14' , '早診' , '2' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-7-14','早診','雷射光療','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-7-14','早診','雷射光療','1','5');--118
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1221');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1222');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-7-14' , '午診' , '3' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-14','午診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-7-14','午診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-7-14','午診','雷射光療','1','6');--119
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1223');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1224');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1225');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-7-14' , '晚診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-7-15' , '早診' , '1' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-15','早診','整形手術','1','4');--120
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1226');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-7-15' , '午診' , '2' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-7-15','午診','雷射光療','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-7-15','午診','雷射光療','1','5');--121
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1227');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1228');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-7-15' , '晚診' , '3' , '瘦身雕塑' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-15','晚診','瘦身雕塑','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-7-15','晚診','瘦身雕塑','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-7-15','晚診','瘦身雕塑','1','6');--122
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1229');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1230');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1231');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-7-16' , '早診' , '0' , '微整形' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-7-16' , '午診' , '1' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-16','午診','整形手術','1','6');--123
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1232');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-7-16' , '晚診' , '2' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-7-16','晚診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-7-16','晚診','雷射光療','1','6');--124
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1233');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1234');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , appt_status , memo )   VALUES  ( '4' , '2016-7-18' , '早診' , '0' , '0' , '休假' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-7-18' , '午診' , '3' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-18','午診','整形手術','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-7-18','午診','整形手術','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-7-18','午診','整形手術','1','5');--125
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1235');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1236');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1237');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-7-18' , '晚診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-7-19' , '早診' , '1' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-19','早診','整形手術','1','5');--126
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1238');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-7-19' , '午診' , '2' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-7-19','午診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-7-19','午診','整形手術','1','6');--127
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1239');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1240');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-7-19' , '晚診' , '3' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-19','晚診','整形手術','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-7-19','晚診','整形手術','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-7-19','晚診','整形手術','1','4');--128
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1241');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1242');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1243');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-7-20' , '早診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-7-20' , '午診' , '1' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-20','午診','雷射光療','1','4');--129
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1244');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-7-20' , '晚診' , '2' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-7-20','晚診','雷射光療','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-7-20','晚診','雷射光療','1','5');--130
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1245');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1246');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-7-21' , '早診' , '3' , '瘦身雕塑' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-21','早診','瘦身雕塑','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-7-21','早診','瘦身雕塑','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-7-21','早診','瘦身雕塑','1','5');--131
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1247');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1248');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1249');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-7-21' , '午診' , '0' , '微整形' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-7-21' , '晚診' , '1' , '整形手術' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-21','晚診','整形手術','1','4');--132
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('20','1250');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-7-22' , '早診' , '3' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-7-22','早診','雷射光療','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-7-22','早診','雷射光療','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-22','早診','雷射光療','1','4');--133
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('1','1251');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1252');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1253');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-7-22' , '午診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-7-22' , '晚診' , '3' , '雷射光療' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-7-22','晚診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-7-22','晚診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-7-22','晚診','雷射光療','1','5');--134
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('1','1254');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('2','1255');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('18','1256');
--7月k

INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-8-22' , '早診' , '1' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-8-22' , '早診' , '1' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-8-22' , '早診' , '1' , '瘦身雕塑' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-8-22' , '早診' , '1' , '微整形' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-8-22','早診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-8-22','早診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-8-22','早診','瘦身雕塑','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-8-22','早診','微整形','1','6');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('1','1257');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1258');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('15','1259');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('23','1260');

INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-8-2' , '晚診' , '1' , '瘦身雕塑' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-8-9' , '晚診' , '1' , '瘦身雕塑' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-8-16' , '晚診' , '1' , '瘦身雕塑' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-8-21' , '晚診' , '1' , '瘦身雕塑' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-8-26' , '晚診' , '1' , '瘦身雕塑' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-8-29' , '晚診' , '1' , '瘦身雕塑' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1006','1','2016-8-2','晚診','瘦身雕塑','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1006','1','2016-8-9','晚診','瘦身雕塑','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1006','1','2016-8-16','晚診','瘦身雕塑','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1006','1','2016-8-21','晚診','瘦身雕塑','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1006','1','2016-8-26','晚診','瘦身雕塑','1','4');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1006','1','2016-8-29','晚診','瘦身雕塑','1','4');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('18','1261');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('18','1262');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('18','1263');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('18','1264');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('18','1265');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('18','1266');
--8月k

INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-9-22' , '早診' , '1' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-9-22' , '早診' , '1' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-9-22' , '早診' , '1' , '瘦身雕塑' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-9-22' , '早診' , '1' , '微整形' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-9-22','早診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-9-22','早診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-9-22','早診','瘦身雕塑','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-9-22','早診','微整形','1','6');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('1','1267');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1268');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('15','1269');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('23','1270');
--9月k

INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-10-22' , '早診' , '1' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-10-22' , '早診' , '1' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-10-22' , '早診' , '1' , '瘦身雕塑' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-10-22' , '早診' , '1' , '微整形' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-10-22','早診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-10-22','早診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-10-22','早診','瘦身雕塑','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-10-22','早診','微整形','1','6');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('1','1271');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1272');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('15','1273');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('23','1274');
--10月k

INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-11-22' , '早診' , '1' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-11-22' , '早診' , '1' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-11-22' , '早診' , '1' , '瘦身雕塑' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-11-22' , '早診' , '1' , '微整形' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-11-22','早診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-11-22','早診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-11-22','早診','瘦身雕塑','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-11-22','早診','微整形','1','6');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('1','1275');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('10','1276');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('15','1277');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('23','1278');
--11月k

INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-12-22' , '早診' , '1' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-12-22' , '早診' , '1' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-12-22' , '早診' , '1' , '瘦身雕塑' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-12-22' , '早診' , '1' , '微整形' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-12-22','早診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-12-22','早診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-12-22','早診','瘦身雕塑','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-12-22','早診','微整形','1','6');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('6','1279');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('12','1280');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('18','1281');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('23','1282');
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-12-22' , '早診' , '1' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-12-22' , '早診' , '1' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-12-22' , '早診' , '1' , '瘦身雕塑' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-12-22' , '早診' , '1' , '微整形' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-12-22','早診','整形手術','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-12-22','早診','雷射光療','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-12-22','早診','瘦身雕塑','1','6');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','1','2016-12-22','早診','微整形','1','6');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('6','1283');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('12','1284');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('18','1285');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('23','1286');

INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-12-2' , '晚診' , '1' , '微整形' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-12-9' , '晚診' , '1' , '微整形' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-12-16' , '晚診' , '1' , '微整形' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-12-21' , '晚診' , '1' , '微整形' );
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1006','1','2016-12-2','晚診','微整形','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1006','1','2016-12-9','晚診','微整形','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1006','1','2016-12-16','晚診','微整形','1','5');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1006','1','2016-12-21','晚診','微整形','1','5');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('24','1287');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('24','1288');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('24','1289');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('24','1290');
--12月k
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
update Schedule set appt_status = 0 where appt_num = 3
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
--5

--最終版jack------------------------------------------------------------------------------------------------
USE AmyDB;
GO
IF OBJECT_ID ( 'g3_jack', 'P' ) IS NOT NULL 
    DROP PROCEDURE g3_jack;
GO
CREATE PROCEDURE g3_jack
AS
 select   identity(int, 1,1) as id,
		 year(apt_date) as year,
		 month(apt_date) as month,pType_id as pType_id, name as name, count(*) as counts  
INTO SpaToSales
from(
SELECT   Appointments.apt_date as apt_date  , ProcedureType.pType_id as pType_id , ProcedureType.name as name
FROM     AppointmentDetail
INNER JOIN Appointments ON AppointmentDetail.aid = Appointments.aid 
INNER JOIN Procedures ON AppointmentDetail.procedure_id = Procedures.procedure_id 
INNER JOIN ProcedureType ON Procedures.pType_id = ProcedureType.pType_id
		   ) Spatosales
group by MONTH(apt_date) ,year(apt_date) ,pType_id, name;
GO

execute g3_jack
/*
select   identity(int, 1,1) as id,
		 year(apt_date) as year,
		 month(apt_date) as month,pType_id as pType_id, name as name, count(*) as counts  
INTO SpaToSales
from(
SELECT   Appointments.apt_date as apt_date  , ProcedureType.pType_id as pType_id , ProcedureType.name as name
FROM     AppointmentDetail
--FROM     Appointments 
INNER JOIN Appointments ON AppointmentDetail.aid = Appointments.aid 
--INNER JOIN AppointmentDetail ON AppointmentDetail.aid = Appointments.aid 
INNER JOIN Procedures ON AppointmentDetail.procedure_id = Procedures.procedure_id 
INNER JOIN ProcedureType ON Procedures.pType_id = ProcedureType.pType_id
		   ) Spatosales
--where  YEAR(apt_date) = 2016
group by MONTH(apt_date) ,year(apt_date) ,pType_id, name;
--order by year(apt_date), MONTH(apt_date);
*/
select sum(OrderItems.quantity) as quantity , Products.name as name, identity(int, 1,1) as id,year(odate) as years,Products.pid as pid
into SalesToProd
from OrderItems 
inner join Products on OrderItems.pid = Products.pid
inner join Orders on OrderItems.oid = Orders.oid
group by Products.name , Orders.odate,Products.pid
ORDER BY quantity DESC
--------------------------------------------------------------------------------------------------------------------
select * from SalesToProd
select * from SpaToSales;
select * from AppointmentDetail;
select * from Appointments;
select * from Procedures;
select * from ProcedureType;
------------------------------------------------------------------------------------------------------
select * from Members
select * from Products
select * from Orders
select * from OrderItems
select * from Schedule
select * from Employees
select * from Catagory
select * from Chat
select * from Score