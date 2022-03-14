/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de cr�ation :  12/03/2022 14:32:10                      */
/*==============================================================*/


drop table if exists Achat;

drop table if exists Article;

drop table if exists Categorie;

drop table if exists Client;

drop table if exists Fournisseur;

drop table if exists Role;

drop table if exists Utilisateur;

drop table if exists Vente;

/*==============================================================*/
/* Table : Achat                                                */
/*==============================================================*/
create table Achat
(
   code_achat           int not null,
   code_article         int not null,
   date_achat           datetime,
   quantite             int,
   prix_unitaire        float,
   prix_total           float,
   primary key (code_achat)
);

/*==============================================================*/
/* Table : Article                                              */
/*==============================================================*/
create table Article
(
   code_article         int not null,
   code_categorie       int not null,
   libelle              varchar(254),
   description          varchar(254),
   prix_unitaire        float,
   quantite             int,
   primary key (code_article)
);

/*==============================================================*/
/* Table : Categorie                                            */
/*==============================================================*/
create table Categorie
(
   code_categorie       int not null,
   nom_categorie        varchar(254),
   primary key (code_categorie)
);

/*==============================================================*/
/* Table : Client                                               */
/*==============================================================*/
create table Client
(
   code_client          int not null,
   nom_client           varchar(254),
   prenom_client        varchar(254),
   adresse              varchar(254),
   tel                  int,
   email                varchar(254),
   primary key (code_client)
);

/*==============================================================*/
/* Table : Fournisseur                                          */
/*==============================================================*/
create table Fournisseur
(
   code_fournisseur     int not null,
   code_achat           int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   adresse              varchar(254),
   tel                  int,
   email                varchar(254),
   primary key (code_fournisseur)
);

/*==============================================================*/
/* Table : Role                                                 */
/*==============================================================*/
create table Role
(
   code_role            int not null,
   nom_role             varchar(254),
   primary key (code_role)
);

/*==============================================================*/
/* Table : Utilisateur                                          */
/*==============================================================*/
create table Utilisateur
(
   code_utilisateur     int not null,
   code_achat           int not null,
   code_vente           int not null,
   code_role            int not null,
   nom                  varchar(254),
   email                varchar(254),
   mot_de_passe         varchar(254),
   primary key (code_utilisateur)
);

/*==============================================================*/
/* Table : Vente                                                */
/*==============================================================*/
create table Vente
(
   code_vente           int not null,
   code_client          int not null,
   code_article         int not null,
   date_vente           datetime,
   quantite             int,
   prix_unitaire        float,
   prix_total           float,
   primary key (code_vente)
);
INSERT INTO Article ( code_article , code_categorie, libelle, description, prix_unitaire ,quantite )
VALUES 
('001','1011','Ordinateur','Probook','500000','5'),
('002','1012','Lait','President','1000','3'),
('003','1013','Pates alimentaires','gilda','750','2');

INSERT INTO Categorie ( code_categorie , nom_categorie )
VALUES 
('1011','HP'),
('1012','Lait frais'),
('1013','Maccaroni');

INSERT INTO Achat (code_achat, code_article, date_achat, quantite, prix_unitaire, prix_total )
VALUES 
('6061','001','2022/02/20','5','500000','2500000'),
('6062','002','2022/02/22','3','1000','3000'),
('6063','003','2022/02/25','2','750','1500');

INSERT INTO Client (code_client, nom_client, prenom_client, adresse, tel, email )
VALUES 
('2021','KABORE','Joel','06 BP 485123','70021352','joel@gmail.com'),
('2022','TRAORE','Sandrine','06 BP 597123','71892352','sandy@gmail.com'),
('2023','YONLI','Adama','06 BP 125123','61021352','adams@gmail.com');

INSERT INTO Fournisseur (code_fournisseur, code_achat, nom, prenom, adresse, tel, email)
VALUES 
('3031','6061','KABRE','Rouki','06 BP 527123','65471352','rouki@gmail.com'),
('3032','6062','KAMBOU','Roland','06 BP 684123','01021352','rolan@gmail.com'),
('3033','6063','SOW','Elisha','06 BP 154107','79961352','elisha@gmail.com');

INSERT INTO Role ( code_role, nom_role)
VALUES 
('4041','Solder'),
('4042','Enregistrer'),
('4043','Faire un depot');

INSERT INTO Vente (code_vente , code_client, code_article, date_vente, quantite , prix_unitaire, prix_total)
VALUES 
('5051','2021','001','2022/03/06','8','5000','40000'),
('5052','2022','002','2022/03/07','5','10000','50000'),
('5053','2023','003','2022/03/08','20','20000','400000');

INSERT INTO Utilisateur (code_utilisateur, code_achat, code_vente, code_role, nom, email, mot_de_passe)
VALUES 
('7071','6061','5051','4041','YONLI','adi@gmail.com','yoyo120'),
('7072','6062','5052','4042','OUBDA','ouab@gmail.com','ouata8mp'),
('7073','6063','5053','4043','YEYE','yye@gmail.com','iyye01');

alter table Achat add constraint FK_Association_4 foreign key (code_article)
      references Article (code_article) on delete restrict on update restrict;

alter table Article add constraint FK_Association_1 foreign key (code_categorie)
      references Categorie (code_categorie) on delete restrict on update restrict;

alter table Fournisseur add constraint FK_Association_5 foreign key (code_achat)
      references Achat (code_achat) on delete restrict on update restrict;

alter table Utilisateur add constraint FK_Association_10 foreign key (code_achat)
      references Achat (code_achat) on delete restrict on update restrict;

alter table Utilisateur add constraint FK_Association_6 foreign key (code_role)
      references Role (code_role) on delete restrict on update restrict;

alter table Utilisateur add constraint FK_Association_8 foreign key (code_vente)
      references Vente (code_vente) on delete restrict on update restrict;

alter table Vente add constraint FK_Association_11 foreign key (code_client)
      references Client (code_client) on delete restrict on update restrict;

alter table Vente add constraint FK_Association_9 foreign key (code_article)
      references Article (code_article) on delete restrict on update restrict;
