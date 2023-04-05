USE sprint2;
drop table usuario;
drop table endereco;
drop table motorista;
drop table caminhao;
drop table trajeto;
drop table sensor;
drop table capturaSensor;
drop table tomate;

CREATE TABLE usuario (
idUsuario INT PRIMARY KEY auto_increment NOT NULL,
nomeUsuario VARCHAR(50),
cpf char(11),
telefone varchar(11),
email varchar(100)
);

CREATE TABLE endereco (
idEndereco INT PRIMARY KEY auto_increment NOT NULL,
endereco varchar(100),
cep char(8)
);

CREATE TABLE motorista (
idMotorista INT PRIMARY KEY auto_increment NOT NULL,
nome VARCHAR(50),
telMotorista VARCHAR(11),
cpf char(11)
);

CREATE TABLE caminhao (
idCaminhao INT PRIMARY KEY auto_increment NOT NULL,
empresa varchar(50),
marca varchar(45),
cor varchar(45),
placa varchar(7)
);

CREATE TABLE trajeto (
idTrajeto INT PRIMARY KEY auto_increment NOT NULL,
inicio varchar(40),
destino varchar(40),
tempoEntrega char(8)
);

CREATE TABLE sensor (
idSensor INT PRIMARY KEY auto_increment NOT NULL,
qtdSensor int
);

CREATE TABLE capturaSensor (
idCapturaSensor INT PRIMARY KEY auto_increment NOT NULL,
umidade int,
temperatura int,
dtCaptura date,
horas CHAR(5)
);

CREATE TABLE tomate (
idTomate INT PRIMARY KEY auto_increment NOT NULL,
qtdTomate INT,
tomateEntregue INT
);

INSERT INTO usuario VALUE
	(null,'Ricardo eletro','39584723232','11945568723','ricardoeletro@hotmail.com'),
    (null,'São João','34567893231','11945656854','saojoao@gmail.com'),
    (null,'Matheus Jose','39495845449','11987654321','matheusjose@outlook.com');

INSERT INTO endereco VALUE
	(null,'av santa catarina','01546120'),
    (null,'rua haddock lobo','01316100'),
    (null, 'rua povo branco','04671200');

INSERT INTO motorista VALUE
	(null,'Gustavo Rimbo','23456781233','11943345823'),
    (null,'Bruno Costa','34582134572','11943345678'),
    (null,'Guilherem Fonseca','34523452718','11954456839');
    
INSERT INTO caminhao VALUE
	(null,'Rodonaves Transportes','hyndai','prata','LDFF345'),
    (null,'Alfa Transportes','toyota','vermelho','FDFD234'),
    (null,'Transportes Translovato','volkswagen','preto','ASWC456');

INSERT INTO trajeto VALUE
	(null,'São Paulo','Rio de Janeiro','08h30min'),
    (null,'São Paulo','Brasília','11h00min'),
    (null,'Rio Grande do Sul','Paraná','02h30min');
    
INSERT INTO sensor VALUE
	(null,6),
    (null,8),
    (null,7);
    
INSERT INTO capturaSensor VALUE
	(null,85,18,20230504,'05:00'),
    (null,84,18,20230220,'20:00'),
    (null,87,17,20231007,'16:00');
    
INSERT INTO tomate VALUE
	(null,500,490),
    (null,700,697),
    (null,812,805);
    
alter table usuario ADD COLUMN fkEndereco int,
	ADD foreign key (fkEndereco) references endereco(idEndereco);
    
alter table usuario ADD COLUMN fkTomate int,
	ADD foreign key (fkTomate) references tomate(idTomate);

alter table caminhao ADD COLUMN fkTrajeto int,
	ADD foreign key (fkTrajeto) references trajeto(idTrajeto);

alter table caminhao ADD COLUMN fkSensor int,
	ADD foreign key (fkSensor) references sensor(idSensor);

alter table sensor ADD COLUMN fkCapturaSensor int,
	ADD foreign key (fkCapturaSensor) references CapturaSensor(idCapturaSensor);
    