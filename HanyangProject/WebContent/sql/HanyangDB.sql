-- CREATE DATABASE

CREATE DATABASE IF NOT EXISTS HANYANG CHARACTER SET = 'utf8' COLLATE = 'utf8_general_ci';

USE haynang

-- CREATE TABLE

CREATE TABLE IF NOT EXISTS YTC_MEMBER (
  MEMBER_ID VARCHAR(100) PRIMARY KEY NOT NULL ,
  MEMBER_PW VARCHAR(100),
  MEMBER_NAME VARCHAR(20),
  MEMBER_DATE DATE
) ENGINE = InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE IF NOT EXISTS YTC_VIDEO (
  VIDEO_UUID VARCHAR(100) PRIMARY KEY NOT NULL,
  VIDEO_OWNER VARCHAR(20),
  VIDEO_DIR VARCHAR(100),
  VIDEO_NAME VARCHAR(100),
  VIDEO_DATE DATE,
  VIDEO_VIEWS INT,
  VIDEO_INTRO VARCHAR(1000),
  FOREIGN KEY(VIDEO_OWNER) REFERENCES YTC_MEMBER(MEMBER_ID)
) ENGINE = InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE IF NOT EXISTS YTC_COMMENT(
    COM_ID INT PRIMARY KEY NOT NULL,
    COM_VIDEO_UUID VARCHAR(100) NOT NULL,
    COM_OWNER VARCHAR(100),
    COM_COMMENT VARCHAR(1000),
    FOREIGN KEY(COM_VIDEO_UUID) REFERENCES YTC_VIDEO(VIDEO_UUID),
    FOREIGN KEY(COM_OWNER) REFERENCES YTC_MEMBER(MEMBER_ID)
)ENGINE = InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE IF NOT EXISTS YTC_RECOMMENT (
    RECOM_ID INT PRIMARY KEY NOT NULL,
    RECOM_COM_ID INT,
    RECOM_OWNER VARCHAR(100) NOT NULL,
    RECOM_COMMENT VARCHAR(1000),
    
    FOREIGN KEY(RECOM_COM_ID) REFERENCES YTC_COMMENT(COM_ID),
    FOREIGN KEY(RECOM_OWNER) REFERENCES YTC_MEMBER(MEMBER_ID)
)ENGINE = InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


--------------------------------------------

-- 예제 데이터들
INSERT INTO YTC_VIDEO VALUES('uuid', 'user', 'E:/School/HanyangProject/HanyangProject/WebContent/video', 'uuid', NOW(), 1, 'qweqweasdasd');
INSERT INTO YTC_VIDEO VALUES('ididid', '12', 'E:/School/HanyangProject/HanyangProject/WebContent/video', 'ididid', NOW(), 10, 'asdasdsadasd');
INSERT INTO YTC_VIDEO VALUES('idid', 'qwer', 'E:/School/HanyangProject/HanyangProject/WebContent/video', 'idid', NOW(), 100, 'zxczxczxczxc');
INSERT INTO YTC_VIDEO VALUES('uu', '123', 'E:/School/HanyangProject/HanyangProject/WebContent/video', 'uu', NOW(), 1000, 'qweasdzcxqweasdzxc');
INSERT INTO YTC_VIDEO VALUES('uuuuuu', 'user', 'E:/School/HanyangProject/HanyangProject/WebContent/video', 'uuuuuu', NOW(), 1, '123asd123asd');
INSERT INTO YTC_VIDEO VALUES('uiuiuiui', '12', 'E:/School/HanyangProject/HanyangProject/WebContent/video', 'uiuiuiui', NOW(), 10, '456asdf456adsf');
INSERT INTO YTC_VIDEO VALUES('udududud', 'qwer', 'E:/School/HanyangProject/HanyangProject/WebContent/video', 'udududud', NOW(), 100, '123zxczxc123');
INSERT INTO YTC_VIDEO VALUES('uuididuuuuidid', '123', 'E:/School/HanyangProject/HanyangProject/WebContent/video', 'uuididuuuuidid', NOW(), 1000, '1234qwer1234qwer');

-- mac 예제 데이터

INSERT INTO YTC_VIDEO VALUES('uuid', 'user', '/Users/hanseok/Documents/Python/OpenCVPractice/video', 'uuid', NOW(), 1, 'qwieorasdkfjnzxmcnv');

SELECT 
    M.MEMBER_ID, 
    M.MEMBER_NAME, 
    V.VIDEO_NAME,
    V.VIDEO_VIEWS, 
    V.VIDEO_INTRO, 
    V.VIDEO_DATE 
FROM 
    YTC_MEMBER M 
INNER JOIN 
    YTC_VIDEO V 
ON 
    M.MEMBER_ID
    = 
    V.VIDEO_OWNER
WHERE 
    V.VIDEO_NAME 
LIKE 
    '%id%';

select * from ytc_video where video_name like '%id%'