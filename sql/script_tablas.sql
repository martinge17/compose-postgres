Create table profesor(
      nss numeric(8) constraint pk_profesor primary key,
      nome varchar(12) not null,
      enderezo varchar(20) not null,
      email varchar(25),
      telefono varchar(9),
      organizacion varchar(9),
      data_alta date);
      
Create table curso(
      cod_c numeric(2) constraint pk_curso primary key,
      nome varchar(12) not null,
      descricion varchar(20),
      horas numeric(3),
      requisito numeric(2) references curso
      );
      
Create table capacitado(
      cod_c numeric(2),
      nss numeric(8),
      constraint pk_capacitado primary key (cod_c,nss),
      constraint fk_capa_cur foreign key (cod_c) references curso,
      constraint fk_capa_pro foreign key (nss) references profesor);
      
Create table edicion(
      cod_c numeric(2),
      numero numeric(3),
      prezo numeric(5),
      data_comezo date,
      data_fin date,
      nss numeric(8) constraint fk_edi_pro references profesor,
      constraint pk_edicion primary key (cod_c,numero),
      constraint fk_edi_cur foreign key (cod_c) references curso);
      
Create table alumno(
      email varchar(25) constraint pk_alumno primary key,
      nome varchar (12) not null,
      enderezo varchar(20) not null,
      telefono varchar(9),
      organizacion varchar(9));
      
Create table rexistrase(
      email varchar(25),
      cod_c numeric(2),
      numero numeric(3),
      data date,
      metpago varchar(13),
      constraint fk_rex_edi foreign key (cod_c, numero) references edicion,
      constraint pk_rexistrase primary key (email, cod_c, numero),
      constraint fk_rex_alu foreign key (email) references alumno);
      
Create table tema(
      id_tema numeric(2) constraint pk_tema primary key,
      asunto varchar(15) not null,
      descricion varchar(30),
      data date,
      cod_c numeric(2),
      numero numeric(3),
      constraint fk_tem_edi foreign key (cod_c, numero) references edicion);
      
Create table men_foro(                        
      id_men numeric(5) constraint pk_mensaxe primary key,
      asunto varchar(15) not null,
      corpo varchar(25),
      data date,
      email varchar(25),
      nss numeric(8) constraint fk_mem_pro references profesor,
      resposta_de numeric(5) constraint fk_mem_mem references men_foro,
      constraint fk_men_alu foreign key (email) references alumno);
      
Create table pertenece(
      id_men numeric(5),
      id_tema numeric(3),
      constraint pk_pert primary key (id_men,id_tema),
      constraint fk_per_men foreign key (id_men) references men_foro,
      constraint fk_per_tema foreign key (id_tema) references tema);    
                   

insert into profesor values(11111111, 'Bacterio', 'Cuartel xeral TIA','bacterio@tia.ole','686686686','T.I.A', '2005-03-12');
insert into profesor values(22222222, 'Mona', 'TBEO','mona@tbeo.ole','699699699', 'M.TRIUNFO', '2006-05-23');
insert into profesor values(33333333, 'Vacarotti', 'TBEO','vacarotti@tbeo.ole','655655655','M.TRIUNFO','2008-07-01');
insert into profesor values(44444444, 'Bacilez', 'Rebolling street 1','bacilez@abuela.ole',null,'ABUELA','2007-06-03');
insert into profesor values(55555555, 'Bestiajez', 'Cuartel ABUELA','bestiajez@abuela.ole',null,'ABUELA','2005-06-03');

insert into curso values (1,'Camuflaxe','Técnicas camuflaxe',50,null);
insert into curso values (2,'Tortas','Técnicas Tortas',80,1);
insert into curso values (3,'Pócimas','Pócimas varias', 70,1);
insert into curso values (4,'Detecta Malo','Tec detecta malos',40,2);
insert into curso values (5,'Escaquearse','Técnicas  escaqueo',90,2);
insert into curso values (6,'T.N.T','Técnicas  T.N.T',100,4);

insert into capacitado values(3, 11111111);
insert into capacitado values(1, 22222222);
insert into capacitado values(2, 22222222);
insert into capacitado values(3, 22222222);
insert into capacitado values(4, 22222222);
insert into capacitado values(5, 22222222);
insert into capacitado values(1, 33333333);
insert into capacitado values(2, 33333333);
insert into capacitado values(3, 33333333);
insert into capacitado values(4, 33333333);
insert into capacitado values(5, 33333333);
insert into capacitado values(4, 44444444);
insert into capacitado values(6, 22222222);

insert into edicion values(1,1, 300, '2011-01-01','2011-04-01', 22222222);
insert into edicion values(1,2, 300, '2011-04-02','2011-07-01', 33333333);
insert into edicion values(1,3, 350, '2011-07-02','2011-10-01', 22222222);
insert into edicion values(2,1, 150, '2011-01-01','2011-02-01', 22222222);
insert into edicion values(2,2, 150, '2011-02-02','2011-04-01', 22222222);
insert into edicion values(2,3, 150, '2011-02-01','2011-04-01', 22222222);
insert into edicion values(3,1, 250, '2011-02-02','2011-04-01', 22222222);	
insert into edicion values(3,2, 300, '2011-12-01','2012-02-01', 11111111);
insert into edicion values(3,3, 300, '2012-02-02','2012-04-01', 11111111);	
insert into edicion values(4,1, 500, '2012-02-02','2012-04-01', 33333333);	
insert into edicion values(4,2, 500, '2012-04-02','2012-06-01', 22222222);	
insert into edicion values(4,3, 600, '2012-04-02','2012-06-01', 22222222);	

insert into alumno values('mortadelo@tia.ole','Mortadelo','Pensión el Calvario','654654654','T.I.A');
insert into alumno values('filemon@tia.ole','Filemon','Pensión el Calvario','622654654','T.I.A');
insert into alumno values('elsuper@tia.ole','El Super','Cuartel xeral TIA',null,'T.I.A');
insert into alumno values('ofelia@tia.ole','Ofelia','Cuartel xeral TIA',null,'T.I.A');
insert into alumno values('irma@tia.ole','Irma','Cuartel xeral TIA',null,'T.I.A');
insert into alumno values('bichez@abuela.ole','Bichez','Cuartel ABUELA',null,'ABUELA');
insert into alumno values('ladrillez@abuela.ole','Ladrillez','Cuartel ABUELA',null,'ABUELA');

insert into rexistrase values('mortadelo@tia.ole',1,1,'2010-12-28','tarxeta');
insert into rexistrase values('mortadelo@tia.ole',2,2,'2011-01-01','tarxeta');
insert into rexistrase values('mortadelo@tia.ole',3,1,'2011-01-01','tarxeta');
insert into rexistrase values('mortadelo@tia.ole',4,2,'2012-01-01','transferencia');
insert into rexistrase values('filemon@tia.ole',1,2,'2011-03-01','tarxeta');
insert into rexistrase values('filemon@tia.ole',3,2,'2011-10-01','transferencia');
insert into rexistrase values('filemon@tia.ole',4,3,'2012-03-01','tarxeta');
insert into rexistrase values('elsuper@tia.ole',1,1,'2010-12-29','tarxeta');
insert into rexistrase values('elsuper@tia.ole',1,2,'2011-03-01','tarxeta');
insert into rexistrase values('elsuper@tia.ole',1,3,'2011-06-01','tarxeta');
insert into rexistrase values('elsuper@tia.ole',2,2,'2010-12-29','tarxeta');
insert into rexistrase values('ofelia@tia.ole',2,1,'2010-12-29','tarxeta');
insert into rexistrase values('ofelia@tia.ole',2,2,'2010-12-29','tarxeta');
insert into rexistrase values('ofelia@tia.ole',3,1,'2011-01-01','transferencia');
insert into rexistrase values('ofelia@tia.ole',4,1,'2012-01-01','transferencia');
insert into rexistrase values('ofelia@tia.ole',4,2,'2012-03-01','transferencia');
insert into rexistrase values('ofelia@tia.ole',4,3,'2012-03-01','transferencia');
insert into rexistrase values('irma@tia.ole',1,1,'2011-01-01','tarxeta');
insert into rexistrase values('irma@tia.ole',3,2,'2011-10-01','transferencia');
insert into rexistrase values('irma@tia.ole',3,3,'2012-01-01','transferencia');
insert into rexistrase values('bichez@abuela.ole',1,1,'2011-01-01','transferencia');
insert into rexistrase values('bichez@abuela.ole',3,1,'2011-01-01','transferencia');
insert into rexistrase values('bichez@abuela.ole',3,3,'2012-01-01','tarxeta');
insert into rexistrase values('bichez@abuela.ole',4,1,'2012-01-01','transferencia');
insert into rexistrase values('bichez@abuela.ole',4,2,'2012-03-01','transferencia');
insert into rexistrase values('bichez@abuela.ole',4,3,'2012-03-01','tarxeta');
insert into rexistrase values('ladrillez@abuela.ole',2,2,'2010-12-29','tarxeta');
insert into rexistrase values('ladrillez@abuela.ole',3,1,'2011-01-01','transferencia');
insert into rexistrase values('ladrillez@abuela.ole',4,1,'2012-01-01','transferencia');
insert into rexistrase values('ladrillez@abuela.ole',4,2,'2012-03-01','transferencia');
insert into rexistrase values('ladrillez@abuela.ole',4,3,'2012-03-01','transferencia');

insert into tema values (1,'Tortas','Como librarse de tortas', '2011-01-02',2,1);
insert into tema values (2,'Bacterio','Convertiume en cucharacha','2011-12-03',3,2);
insert into tema values (3,'Persiguen','Evitar ao Super','2011-12-03',1,1);
insert into tema values (4,'O mellor','É mortadelo o mellor?','2010-12-28',1,1);
insert into tema values (5,'Malo','Neste curso hai 1 malo','2011-02-01',4,1);
insert into tema values (6,'Feo','Seguro que é o feo','2011-02-03',4,2);

insert into men_foro values (1,'Do Super','Son durísimas','2011-01-03','filemon@tia.ole',null,null);
insert into men_foro values (2,'De Bestiajez','Doen moito','2011-01-04','filemon@tia.ole',null,null);
insert into men_foro values (3,'Nooon','Se son caricias','2011-01-05',null,44444444,2);
insert into men_foro values (4,'Bacterio','As pócimas son malas','2011-01-04','mortadelo@tia.ole',null,null);
insert into men_foro values (5,'Pillareite','Xa te pillarei','2011-01-05',null,11111111,4);
insert into men_foro values (6,'Se me ves','Estou enfrente de ti','2011-01-05','mortadelo@tia.ole',null,5);
insert into men_foro values (7,'O Super','Quere buscar ladrillez','2012-02-01','mortadelo@tia.ole',null,null);
insert into men_foro values (8,'E máis vale','Que o pilledes','2012-02-01','elsuper@tia.ole', null,7);
insert into men_foro values (9,'Si si','Xa imos','2012-02-01','filemon@tia.ole',null,8);
insert into men_foro values (10,'Mortadelooooo','Matoooooote','2012-04-01','elsuper@tia.ole',null,null);
insert into men_foro values (11,'Xefe','Necesita unha tila','2012-04-01','mortadelo@tia.ole',null,10);
insert into men_foro values (12,'Busque','Ofelia atopa a eses 2','2012-05-01','elsuper@tia.ole',null,null);
insert into men_foro values (13,'Son bos','Foron curso de camuflaxe','2012-05-01','ofelia@tia.ole',null,12);
insert into men_foro values (14,'Os mellores','Recibindo tortas','2012-06-01',null,22222222,null);
insert into men_foro values (15,'Práctica','Con práctica mellórase','2012-06-01','mortadelo@tia.ole',null,14);
insert into men_foro values (16,'Talento','Tedes talento natural','2012-07-01',null,22222222,15);
insert into men_foro values (17,'So','Atopo os dentes ','2012-07-08','ofelia@tia.ole',null,12);
insert into men_foro values (18,'JuaJua','Ven ven','2011-01-05',null,55555555,2);

insert into pertenece values (1,1);
insert into pertenece values (2,1);
insert into pertenece values (3,1);
insert into pertenece values (4,2);
insert into pertenece values (5,2);
insert into pertenece values (6,2);
insert into pertenece values (6,4);
insert into pertenece values (7,3);
insert into pertenece values (7,1);
insert into pertenece values (8,3);
insert into pertenece values (8,1);
insert into pertenece values (9,3);
insert into pertenece values (9,1);
insert into pertenece values (10,4);
insert into pertenece values (11,4);
insert into pertenece values (10,2);
insert into pertenece values (12,3);
insert into pertenece values (13,3);
insert into pertenece values (14,1);
insert into pertenece values (15,1);
insert into pertenece values (16,1);
insert into pertenece values (17,3);
insert into pertenece values (18,1);
