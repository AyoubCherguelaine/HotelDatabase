drop database Project;
create database Project;
use Project;

CREATE TABLE HOTEL (
    HOTELID INT AUTO_INCREMENT,
    nomHOTEL VARCHAR(30),
    Adresse VARCHAR(30),
    Ville VARCHAR(20),
    Superficie DECIMAL(15),
    pays VARCHAR(15),
    ETOILE               int,
    CONSTRAINT HOTELPK PRIMARY KEY (HOTELID)
);
create table CLIENT_(
	CLIENT_ID int auto_increment,
    nomCLIENT_ varchar(20),
    Adresse varchar(30),
    Telephone varchar(14),
    categorie varchar(15),
    mode_de_paiement varchar(20),
    
    constraint CLIENT_PK primary key (CLIENT_ID)

);

create table CL_IN_HOTEL(
		EntreId int auto_increment ,
		CLIENT_ID int,
        HOTELID int,
        DateReg date,
        primary key(EntreId),
	constraint CLHFK1 foreign key (CLIENT_ID) references CLIENT_(CLIENT_ID)on delete restrict on update restrict,
    constraint CLHFK2 foreign key (HOTELID) references HOTEL(HOTELID)on delete restrict on update restrict
        
        
);

create table Facture(
   FACTEUR_             int not null auto_increment,
   EntreId int  ,
   CLIENT_ID             int not null,
   HOTELID              int not null,
   DATE_                datetime,
   MontantGeneral  decimal(2),
   primary key (FACTEUR_),
   constraint FACTFK3 foreign key (EntreId) references CL_IN_HOTEL(EntreId) on delete restrict on update restrict,
   constraint CLIENT_IDFK foreign key (CLIENT_ID) references CLIENT_(CLIENT_ID)on delete restrict on update restrict,
   constraint HOTELIDFK foreign key (HOTELID) references HOTEL(HOTELID)on delete restrict on update restrict
   
);

create table LIGNEDEFACTURE
(
	LINGEID int not null auto_increment,
   LIGNEDEFACTURE       text not null,
   FACTEUR_ int not null,
	Montant decimal(2),
   primary key (LINGEID),
    constraint LigneFK foreign key (FACTEUR_) references Facture(FACTEUR_)on delete restrict on update restrict
);

create table RESTAURANT
(
   RESTOID              int not null auto_increment,
   HOTELID              int not null,
   NOMRESTO             text,
   SUPERFICIE_          decimal,
   Type_                 text,
   ETAT_                text,
   primary key (RESTOID),
   constraint RestoFK foreign key (HOTELID) references HOTEL(HOTELID)on delete restrict on update restrict
);

create table Cl_RESTAURANT(
	CLIENT_ID int not null,
    RESTOID int not null,
    RepatMontant decimal(2),
	EntreId int ,
    constraint primary key (EntreId),
    constraint CLACFK foreign key (EntreId) references CL_IN_HOTEL(EntreId) on delete restrict on update restrict,
    constraint CL_RES3FK foreign key (CLIENT_ID) references CLIENT_(CLIENT_ID)on delete restrict on update restrict,
    constraint RSFK foreign key (RESTOID) references RESTAURANT(RESTOID)on delete restrict on update restrict
);

create table DETENTE
(
   DETENTE_ID           int not null auto_increment,
   HOTELID              int not null,
   NOM_D                text,
   SUPERFICIE           decimal,
   TYPE                 text,
   ETAT                 text,
   primary key (DETENTE_ID),
   constraint DETENTEFK foreign key (HOTELID) references HOTEL(HOTELID)on delete restrict on update restrict
);

create table CL_DETENETE(
	CLIENT_ID int not null,
    DETENTE_ID int not null,
    EntreId int ,
      constraint CL_DETFK3 foreign key (EntreId) references CL_IN_HOTEL(EntreId) on delete restrict on update restrict,
    constraint primary key (EntreId),
    constraint CLIENTFK foreign key (CLIENT_ID) references CLIENT_(CLIENT_ID) on delete restrict on update restrict,
    constraint DENTENTEFK foreign key (DETENTE_ID) references DETENTE(DETENTE_ID) on delete restrict on update restrict

);

create table DISTRATICT
(
   DISTRACT_ID           int not null auto_increment,
   HOTELID              int not null,
   NOM                  text,
   SUPERFICIE_          decimal,
   TYPE_                text,
   ETAT_                text,
   primary key (DISTRACT_ID),
   constraint DISFK foreign key (HOTELID) references HOTEL(HOTELID)on delete restrict on update restrict
);

create table CL_DISTRATICT(
	CLIENT_ID int not null,
    DISTRACT_ID int not null,
    EntreId int,
    constraint primary key (EntreId),
    constraint CL_DIST3FK foreign key (EntreId) references CL_IN_HOTEL(EntreId) on delete restrict on update restrict,
    constraint CL_DIST1fk foreign key (CLIENT_ID) references CLIENT_(CLIENT_ID)on delete restrict on update restrict,
    constraint CL_DIST2fk foreign key (DISTRACT_ID) references DISTRATICT(DISTRACT_ID)on delete restrict on update restrict
);


create table REGROUPEMENT
(
   PROFID               int not null auto_increment,
   HOTELID              int not null,
   NOM                  text,
   SUPERFICE            decimal,
   CAPACITE             int,
   ETAT                 text,
   TYPE                 text,
   primary key (PROFID),
   constraint REGFK foreign key (HOTELID) references HOTEL(HOTELID)on delete restrict on update restrict
);

create table CL_REGROUPEMENT (
	CLIENT_ID int not null,
    PROFID int not null,
    
    EntreId int,
    constraint primary key (EntreId),
	constraint CLREG3FK foreign key (EntreId) references CL_IN_HOTEL(EntreId) on delete restrict on update restrict,
    constraint CL_REG1fk foreign key (CLIENT_ID) references CLIENT_(CLIENT_ID)on delete restrict on update restrict,
    constraint CL_REG2fk foreign key (PROFID) references REGROUPEMENT(PROFID)on delete restrict on update restrict
);


create table SEJOUR
(
   SEJOU_ID             int not null auto_increment,
   HOTELID              int not null,
   SUPERFICIE_          decimal,
   TYPE_                text,
   STATUT               text,
   ETAT                 text,
   primary key (SEJOU_ID),
   constraint SEJOURFK foreign key (HOTELID) references HOTEL(HOTELID)on delete restrict on update restrict
);

create table CL_SEJOUR(
CLIENT_ID int not null,
    SEJOU_ID int not null,
    EntreId int ,
    constraint primary key (EntreId),
   constraint CL_SEJOURFK3 foreign key (EntreId) references CL_IN_HOTEL(EntreId) on delete restrict on update restrict,
    constraint CL_SEJ1FK foreign key (CLIENT_ID) references CLIENT_(CLIENT_ID)on delete restrict on update restrict,
    constraint CL_SEJ2FK foreign key (SEJOU_ID) references SEJOUR(SEJOU_ID)on delete restrict on update restrict
);

create table SORTIE
(
   SORTIE_ID            int not null auto_increment,
   HOTELID              int not null,
   DATE_                 date,
   Lieu					text,
   Type_				text,
   HD                   datetime,
   HR                   datetime,
   primary key (SORTIE_ID),
   constraint SORFK foreign key (HOTELID) references HOTEL(HOTELID)on delete restrict on update restrict
);

create table CL_SORTIE(
CLIENT_ID int not null,
    SORTIE_ID int not null,
    EntreId INT,
    constraint primary key (EntreId),
	constraint CL_SORFK3 foreign key (EntreId) references CL_IN_HOTEL(EntreId) on delete restrict on update restrict,
    constraint CL_SOR1FK foreign key (CLIENT_ID) references CLIENT_(CLIENT_ID)on delete restrict on update restrict,
    constraint CL_SOR2FK foreign key (SORTIE_ID) references SORTIE(SORTIE_ID)on delete restrict on update restrict
    );

create table SPORTS
(
   SPORTID              int not null auto_increment,
   HOTELID              int not null,
 
   SUPERFICIE_          decimal,
   TYPE                 text,
   ETAT                 text,
   primary key (SPORTID),
   constraint SPORTFK foreign key (HOTELID) references HOTEL(HOTELID) on delete restrict on update restrict
);

create table CL_SPORT(CLIENT_ID int not null,
    SPORTID int not null,
    EntreId int,
    constraint primary key (CLIENT_ID),
  constraint CL_SROFK3 foreign key (EntreId) references CL_IN_HOTEL(EntreId) on delete restrict on update restrict,
    constraint CL_SPO1FK foreign key (CLIENT_ID) references CLIENT_(CLIENT_ID) on delete restrict on update restrict,
    constraint CL_SPO2FK foreign key (SPORTID) references SPORTS(SPORTID) on delete restrict on update restrict
    );



/*insert */
use Project;


insert into HOTEL(nomHOTEL,Adresse,Ville,Superficie,pays) values
('Hotel1','adresse1','blida',10000.00,'algeria'),
('Hotel2','adresse2','alger',10000.00,'algeria'),
('Hotel3','adresse3','oran',10000.00,'algeria'),
('Hotel4','adresse4','boumerdas',10000.00,'algeria'),
('Hotel5','adresse5','ilizi',10000.00,'algeria'),
('Hotel6','adresse6','anaba',10000.00,'algeria');

insert into CLIENT_(nomCLIENT_,Adresse,Telephone,categorie,mode_de_paiement) values
('client1','adresseCL1','0555555555','particuliers','Especes'),
('client2','adresseCL2','0555555555','entreprise','Virement'),
('client3','adresseCL3','0555555555','association','visa'),
('client4','adresseCL4','0555555555','gouvernement','Especes'),
('client5','adresseCL5','0555555555','particuliers','Especes'),
('client6','adresseCL6','0555555555','association','visa');

insert into SEJOUR(HOTELID,SUPERFICIE_,TYPE_,STATUT,ETAT) values
(1,30,'chambre simple',true,'excellent'),
(2,60,'chambre double',true,'excellent'),
(3,120,'suite',true,'bon'),
(4,30,'chambre double',true,'excellent'),
(5,70,'chambre double',true,'excellent'),
(6,30,'chambre simple',false,'excellent'),
(1,40,'chambre double',true,'bon'),
(2,30,'chambre double',false,'fermée'),
(3,200,'suite',true,'excellent');

insert into RESTAURANT(HOTELID,NOMRESTO,SUPERFICIE_,Type_,ETAT_) values 
(1,'Restau1',400,'resto','bon'),
(2,'pizziria1',150,'pizzeria','bon'),
(3,'Restau2',400,'resto','‘excellent'),
(4,'Sand1',80,'sandwicherie','bon'),
(4,'pizziria2',120,'pizzeria','bon'),
(3,'Restau3',400,'resto','excellent'),
(5,'cafe1',400,'cafétéria','bon');

insert into DETENTE(HOTELID,NOM_D,SUPERFICIE,TYPE,ETAT) values
(1,'detente1',250,'Sauna','bon'),
(2,'detente1',130,'Jacuzzi','excellent'),
(4,'detente1',230,'Sauna','très bon'),
(6,'detente1',200,'Soins','bon'),
(5,'detente1',100,'Soins','excellent');

insert into DISTRATICT(HOTELID,NOM,SUPERFICIE_,TYPE_,ETAT_) values
(1,'salle1',400,'salle de cinéma','bon'),
(1,'salle2',150,'salle de jeux','bon'),
(2,'salle3',250,'salle de jeux','bon'),
(3,'salle4',350,'salle de cinéma','bon'),
(3,'salle5',180,'salle de jeux','bon'),
(3,'salle6',160,'salle de jeux','bon'),
(5,'salle7',460,'salle de cinéma','bon'),
(5,'salle8',300,'salle de jeux','bon');


insert into REGROUPEMENT(HOTELID,NOM,SUPERFICE,CAPACITE,TYPE,ETAT) values 
(1,'REG1',600,400,'salle de conférence','bon'),
(2,'REG2',700,450,'salle de conférence','excellent'),
(1,'REG1',110,30,'salle de réunions','bon'),
(3,'REG1',500,340,'salle de conférence','bon'),
(2,'REG1',200,50,'salle de réunions','excellent'),
(2,'REG1',50,20,'salle de réunions','excellent');

insert into SORTIE(HOTELID,DATE_,Lieu,Type_,HD,HR) values
 (1,'2021/02/27','cheria','montagne','9:00:00','19:00:00'),
 (2,'2021/02/19','tikejda','montagne','10:00:00','18:00:00'),
 (4,'2021/02/25','ghardaia','desert','6:00:00','19:00:00'),
 (3,'2021/02/22','casbah','Touristique','10:00:00','18:00:00'),
 (2,'2021/02/27','cheria','montagne','9:00:00','16:00:00');
 
 insert into SPORTS(HOTELID,SUPERFICIE_,TYPE,ETAT) values
(1,1000,'stade','bon'),
(2,500,'piscine','excellent'), 
(3,1000,'stade','excellent'),
(4,650,'piscine','excellent'),
(6,1000,'salle fitness','très bon');







/* devoir  */
/* 1 */
select HOTELID,nomHOTEL,Adresse,Ville from HOTEL where pays='algeria';
/* 2 */
select HOTEL.HOTELID,nomHOTEL,Adresse,Ville,SEJOUID,TYPE,État 
from.      HOTEL right join SEJOUR 
On   HOTEL.HOTELID = SEJOUR.HOTELID 
 
group by nomHOTEL having
TYPE_='chambre'
And 
(Ville = 'blida' or Ville='alger' or Ville ='boumerdas' )
And 
(ETAT='très bon' or ETAT = 'excellent') ;


/* 3 */


   select NOM,SUPERFICE,TYPE,CAPACITE,Ville from HOTEL right join regroupement
ON HOTEL.HOTELID = regroupement.HOTELID 
group by  regroupement.
TYPE = 'salle de conference'
    having CAPACITE >=200 and Ville='Blida 'or Ville='Alger' or Ville='boumerdas' ;

 /* 4 */
select * from SORTIE left join HOTEL 
on HOTEL.HOTELID = SORTIE.HOTELID 
group by sortie.HOTELID
having 
Lieu = 'desert';
 
 /* 6 */
 select count(nomCLIENT),categories from CLIENT group by categories;
 

