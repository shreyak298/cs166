DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS Graduate;
DROP TABLE IF EXISTS work_in;
DROP TABLE IF EXISTS work_proj;
DROP TABLE IF EXISTS work_dept;

DROP TABLE IF EXISTS Musicians;
DROP TABLE IF EXISTS Instruments;
DROP TABLE IF EXISTS Songs;
DROP TABLE IF EXISTS Plays;
DROP TABLE IF EXISTS Performs;
DROP TABLE IF EXISTS Place;
DROP TABLE IF EXISTS home_phone;
DROP TABLE IF EXISTS Lives;


CREATE TABLE Professor(
        prof_ssn CHAR(11) NOT NULL,
        prof_name CHAR(20) NOT NULL,
        prof_age INTEGER,
        rank INTEGER,
        specialty CHAR(20),
        PRIMARY KEY(prof_ssn)
);

CREATE TABLE Department(
        dno CHAR(20) NOT NULL,
        prof_ssn CHAR(11) NOT NULL,
        dname CHAR(20),
        office CHAR(20),
        PRIMARY KEY(dno),
        FOREIGN KEY (prof_ssn) REFERENCES Professor(prof_ssn)
);

CREATE TABLE Project(
        pno CHAR(20) NOT NULL,
        prof_ssn CHAR(11) NOT NULL,
        sponsor CHAR(20),
        start_date DATE,
        end_date DATE,
        budget INTEGER,
        PRIMARY KEY(pno),
        FOREIGN KEY (prof_ssn) REFERENCES Professor
);

CREATE TABLE Graduate(
        grad_ssn CHAR(11) NOT NULL,
        ssn_advisor CHAR(11) NOT NULL,
        dno CHAR(20) NOT NULL,
        grad_name CHAR(20),
        grad_age INTEGER,
        deg_pg CHAR(20),
        PRIMARY KEY(grad_ssn),
        FOREIGN KEY (dno) REFERENCES Department,
        FOREIGN KEY (ssn_advisor) REFERENCES Graduate
);

CREATE TABLE work_dept(
        prof_ssn CHAR(11) NOT NULL,
        dno CHAR(20) NOT NULL,
        time_pc INTEGER,
        PRIMARY KEY(prof_ssn, dno),
        FOREIGN KEY(prof_ssn) REFERENCES Professor(prof_ssn),
        FOREIGN KEY(dno) REFERENCES Department
);

CREATE TABLE work_proj(
        pno CHAR(20) NOT NULL,
        grad_ssn CHAR(11) NOT NULL,
        prof_ssn CHAR(11) NOT NULL,
        since DATE,
        PRIMARY KEY(pno,grad_ssn),
        FOREIGN KEY (grad_ssn) REFERENCES Graduate,
        FOREIGN KEY (prof_ssn) REFERENCES Professor,
        FOREIGN KEY (pno) REFERENCES Project
);

CREATE TABLE work_in(
        prof_ssn CHAR(11) NOT NULL,
        pno CHAR(20) NOT NULL,
        PRIMARY KEY(prof_ssn, pno),
        FOREIGN KEY(prof_ssn) REFERENCES Professor,
        FOREIGN KEY (pno) REFERENCES Project
);
CREATE TABLE Musicians(
        musician_ssn CHAR(11) NOT NULL,
        musician_name CHAR(20) NOT NULL,
        PRIMARY KEY(musician_ssn)
);

CREATE TABLE Instruments(
        instrID CHAR(11) NOT NULL,
        dname CHAR(20) NOT NULL,
        instr_key CHAR(11),
        PRIMARY KEY(instrID)
);

CREATE TABLE Songs(
        songID CHAR(11) NOT NULL,
        song_name CHAR(20) NOT NULL,
        author CHAR(20) NOT NULL,
        albumID CHAR(11) NOT NULL,
        PRIMARY KEY(songID),
        FOREIGN KEY(albumID) REFERENCES Album
);

CREATE TABLE Album(
        albumID CHAR(11) NOT NULL,
        copyrightDate DATE,
        speed INTEGER,
        albumTitle CHAR(20) NOT NULL,
        musician_ssn CHAR(11) NOT NULL,
        PRIMARY KEY(albumID),
        FOREIGN KEY(musician_ssn) REFERENCES Musicians
);

CREATE TABLE Plays(
        musician_ssn CHAR(11) NOT NULL,
        instrID CHAR(11) NOT NULL,
        PRIMARY KEY(musician_ssn, instrID),
         FOREIGN KEY(musician_ssn) REFERENCES Musicians,
        FOREIGN KEY(instrID) REFERENCES Instruments
);

CREATE TABLE Performs(
        songID CHAR(11) NOT NULL,
        musician_ssn CHAR(11) NOT NULL,
        PRIMARY KEY(songID, musician_ssn),
        FOREIGN KEY(songID) REFERENCES Songs,
        FOREIGN KEY(musician_ssn) REFERENCES Musicians
);

CREATE TABLE Place(
        address CHAR(30) NOT NULL,
        PRIMARY KEY(address)
);

CREATE TABLE home_phone(
        phone_number CHAR(10) NOT NULL,
        address CHAR(30) NOT NULL,
        PRIMARY KEY(phone_number),
        FOREIGN KEY(address) REFERENCES Place
);

CREATE TABLE Lives(
        musician_ssn CHAR(11) NOT NULL,
        phone_number CHAR(10) NOT NULL,
        address CHAR(30) NOT NULL,
        PRIMARY KEY(musician_ssn, address),
        FOREIGN KEY(musician_ssn) REFERENCES Musicians,
        FOREIGN KEY(phone_number) REFERENCES home_phone,
        FOREIGN KEY(address) REFERENCES Place
);

\dt
\q
                                                  
