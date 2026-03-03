create table Client
(IdClient CHAR(10) PRIMARY KEY,
 Name VARCHAR(25) NOT NULL,
 Address VARCHAR(60) NOT NULL,
 NumCC CHAR(16) NOT NULL);
create table Orders
(IdOrder CHAR(10) PRIMARY KEY,
 IdClient CHAR(10) NOT NULL REFERENCES Client on delete cascade,
 DateOrder DATE,
 DateExped DATE);
create table Author
( idAuthor NUMBER PRIMARY KEY,
  Name VARCHAR(25));
create table Book
(ISBN CHAR(15) PRIMARY KEY,
Title VARCHAR(60) NOT NULL,
Author CHAR(4) NOT NULL,
PurchasePrice NUMBER(6,2) DEFAULT 0,
SalePrice NUMBER(6,2) DEFAULT 0);
create table Author_Book
(ISBN CHAR(15),
Author NUMBER,
CONSTRAINT al_PK PRIMARY KEY (ISBN, Author),
CONSTRAINT BookA_FK FOREIGN KEY (ISBN) REFERENCES `Book`(ISBN) on delete cascade,
CONSTRAINT Author_FK FOREIGN KEY (Author) REFERENCES `Author`(idAuthorA));
create table Books_Order(
ISBN CHAR(15),
IdOrder CHAR(10),
amount NUMBER(3) CHECK (amount >0),
CONSTRAINT lp_PK PRIMARY KEY (ISBN, idOrder),
CONSTRAINT Book_FK FOREIGN KEY (ISBN) REFERENCES `Book`(ISBN) on delete cascade,
CONSTRAINT pedido_FK FOREIGN KEY (IdOrder) REFERENCES `Orders`(IdOrder) on delete cascade);
