INSERT INTO  medicos Values 
	(null,"Anny Quintanilha","1970-11-10" ,86132473009,120935,"rs" , "(69)3752-5488", "Rua Flores 10, apto 101"),
	 (null,"Suéli Simão Pegado","1990-08-27", 62876978067, 15891,"SP","(97) 2810-2734", "Avenida Japão 50"),
	 (null,"Alisson Sacramento ","1981-01-15",80814279023,178105,"MG","(79) 2718-0264","Rua Albieri 480"),
	 (null,"Lívia Veloso","1972-03-22",20924987030,17897,"MG", "(61) 3019-1483", "Travessa A 89"),
	 (null,"Gael Milheiro Lemes","1964-02-13",38603737061,9826,"RS","(82) 2433-7762","Rua das Rosas, 80, apto 200"),
	 (null,"Gisela Espinosa","1980-09-12",23529091049,34548,"SP","(86) 3368-4812","Avenida Santos, 90"),
	 (null,"Nelson Anjos Palmeira","1980-10-14", 03626639045,344789, "SP","(54) 3941-4795","Rua Álamo, 180, ap 90"),
	 (null,"Ezequiel Pestana Henriques","1979-06-30",67297959057,9756,"RS","(69) 2537-6076","Avenida Chateaubriand, 150"),
	 (null,"Tito Carqueijeiro","1973-05-19",74588651056,14777,"RS","(83) 3272-8326","Rua Flores 670"),
     (null,"Cristovão Xavier","1979-12-12",92690490005,67432,"RS","(24) 2448-9465","Rua da Luz, 80");



INSERT INTO especialidades  values 
		(null,"pediatria "),
		(null,"clínico geral"),
		(null,"gastroenterologia"),
		(null,"dermatologista"),
        (null,"Psiquiatria"),
        (null,"Endocrinologia"),
        (null,"Neurologia"),
        (null,"Oftalmologia");
        
        
        
        INSERT INTO especialidades_medicos VALUES 
        (null,1,1),
        (null,1,2),
        (null,2,2),
        (null,3,3),
        (null,4,1),
        (null,4,3),
        (null,5,4),
        (null,6,2),
        (null,7,1),
        (null,8,1),
        (null,9,2),
        (null,10,4),
        (null,10,1);




INSERT INTO pacientes  values
		 (null,"Karine Macena Porciúncula","KarineMacenaPorciúncula@gmail.com","(51)998231241","1986-10-23","rua guarulhos, centro 23","12 425 678-9",02728135123),
		 (null, "Zilda Gomide Osório","ZildaGomideOsório@gmail.com", "(51)9982331241"," 1977-10-25", "rua almeida , 03 " ,"12 825 678-9",29231221322),
		 (null,"Fabrício Norões Xavier","FabrícioNorõesXavier@hotmail.com","(51) 9272311231","1981-05-19","Av presidente lucena , 23","13 028 937-2",83921314255),
		 (null,"César Sítima Faria", "César SítimaFaria@gmail.com","(51)9981231241","1990-02-03","rua jose alencar 225"," 15 828 038-1 ",20720281233),
		(null,"Silvana Fartaria Nazário","SilvanaFartariaNazário@gmail.com","(51)998231551" , "1985-12-05", "rua alce 228", "19 092 831-5",02726551255),
		(null,"Evandro Trindade Bouça","EvandroTrindadeBouça@gmail.com","(51)993312331","1993-04-20","rua martin hugo 325"," 21 927 028-1",02135123511),
		(null,"Ivo Brandão Palos","IvoBrandãoPalos@gmail.com","(51) 992723123", "1989-09-18","rua muller dias 320","55 028 723-5",02723512353),
		(null,"Armindo Moreira Azeredo","Armindomoreiraazeredo@gmail.com","(51) 992732123", "1979-08-10","rua arthur holler , 28","98 012 282-3",02812352399),
		(null,"Mark Festas Santana","Markfestassantana@gmail.com","(51) 992312532","1995-06-09","rua marta de rocha , 520","09 521 203-9",50233112322),
		(null,"Helton Espinosa","Heltonespinosa@gmail.com","(51) 992312521", "1989-10-09","rua vargas luiz , 120", "10 827 923-8",02831235111);


INSERT INTO convenios  VALUES 
	(null,"Pro Health",43780556000150,30),
	(null,"UniSaude",26458369000136,90),
	(null,"MedMais",98892354700068,60),
	(null,"HealthSaude",67561317000178,180);



INSERT INTO tipos_quartos VALUES
		(null,"Quarto completo , muit conforto para atender o paciente da melhor forma possivel.","300.00"),
		(null,"Quarto completo , um pouco menos conforto, mas exelente para atender o paciente da melhor forma possivel.","200.00"),
		(null,"Quarto simples , apenas atender o paciente e ajudar a se recupera. ","100.00"); 
		
INSERT INTO quartos  VALUES 
	(null,01,1),
	(null,02,2),
	(null,03,3);





INSERT INTO consultas  VALUES
(null,"2019:11:01 08:10",1,8,150.00,null,null,1),
(null,"2019-07-02 16:10",2,4,110.90,null,null,3),
(null,"2019-05-24 11:10",3,3,150.00,null,null,4),
(null,"2019-02-06 09:20",4,1,110.90,null,null,5),
(null,"2019-11-17 13:10",5,9,100.00,2,4351315,7),
(null,"2019-07-20 12:10",6,5,180.00,null,null,8),
(null,"2019-11-20 15:00",7,2,110.90,3,55643215,9),
(null,"2020-09-20 11:10",8,6,110.90,2,2354641656,10),
(null,"2019-10-14 09:20",9,7,75.00,1,12342342,11),
(null,"2020-07-16 11:20",10,10,110.00,1,542315,12);




INSERT INTO internacoes VALUES 
	 (null,"2017-05-20","2017-06-01","2017-05-31","O paciente foi operado com sucesso, por conta disso foi liberado antes da data prevista.",1,1,1),
	 (null,"2017-10-01","2017-11-25","2017-11-30","O paciente novamente compareceu ao hospital, estava mais grave, foi liberado após a data prevista.",2,1,1),
	 (null,"2018-02-07","2018-02-20","2018-02-25","O paciente estava estável, mas o quadro piorou , por conta disso foi liberado após a data prevista.",3,2,2),
	 (null,"2018-05-02","2018-06-10","2018-05-30","O paciente teve uma exelence melhora, por conta disso foi liberado antes da data prevista.",3,2,2),
	 (null,"2018-07-10","2018-07-25","2018-07-20","O paciente foi liberado antes da data prevista,melhorou muito o seu quadro e por conta diso foi liberado antes.",4,3,1),
	 (null,"2018-08-05","2018-08-15","2018-08-30","O paciente teve seu quadro piorado e ficou mais tempo que o previsto.",5,4,3),
	 (null,"2019-01-10","2019-03-05","2019-04-20","O paciente teve seu quadro muito extremo e acabou ficando um mês a mais do que o previsto.",6,5,1),
	 (null,"2020-03-05","2020-03-29","2020-03-20","O paciente foi liberado antes da data prevista, melhorou seu quadro antes da data prevista",7,6,2);




INSERT INTO tipos_quartos VALUES 
(null,"Apartamento aconchegante, com muito equipamento de alto nível para dar o melhor para o paciente com auxilio de efermeiras(os).",500),
(null,"Quarto Duplo, muito bem equipado, para servir ao paciente da melhor forma possível, com auxílio de enfermeiras.",400),
(null,"Enfermaria, muito bem equipada, com auxílio de enfermeira(o) , muito bem equipado para dar a melhor experiência possível.",250);


INSERT INTO enfermeiros VALUES 
(null,"José Machado", 52997569095,458723),
(null,"André Oliveira da Silva",80387619011,321654),
(null,"Teresina de Souza",96621091028,789456),
(null,"Lucas Mathias",15240806080,246810),
(null,"Martina Oliveira",39135648023,357924),
(null,"Sofia Conrar",23411743026,468135),
(null,"Gaspar Vinicius",02764727054,579486);






-- PARTE 2 -- 


ALTER TABLE medicos ADD em_atividade bit default 1;

UPDATE internacoes
SET data_alta = DATE_ADD(data_entrada, INTERVAL 3 DAY)
WHERE quarto_id = 1;


DELETE FROM convenios
 WHERE nome = 'Pro Health';
 
 
 DELETE FROM consultas WHERE (`id` = '10');

DELETE FROM consultas WHERE (`id` = '9');




















-

