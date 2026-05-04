-- DROP TABLE ItemNotaFiscal;
-- DROP TABLE Medicamento;
-- DROP TABLE NotaFiscal;
-- DROP TABLE Cliente

create table pessoa 
(id int primary key, nome varchar(50), email varchar(50));

-- vai ser usada para gatilhos-triggers
create table registro_log 
(dt_op date, hr_op time, ds_op varchar(100));

CREATE TABLE cliente (
    cd_cliente integer  NOT NULL AUTO_INCREMENT,
    nm_cliente VARCHAR(255) NOT NULL,
    nr_telefone VARCHAR(15) NULL,
  dt_nascimento DATE NULL, primary key (cd_cliente)
);

CREATE TABLE Medicamento (cd_medicamento integer auto_increment,
  nm_medicamento varchar(50) ,
  ds_medicamento varchar(200) ,
  vl_custo decimal(8,2) default 0,
  vl_venda decimal(8,2) default 0, qt_estoque integer default 0, primary key(cd_medicamento)
);

CREATE TABLE NotaFiscal (nr_notafiscal integer auto_increment,
  cd_cliente integer references cliente(cd_cliente),
  dt_emissao date, vl_total decimal(8,2) default 0, primary key(nr_notafiscal)
);

CREATE TABLE ItemNotaFiscal (nr_notafiscal integer, cd_medicamento integer,
  qt_vendida integer default 0,
  vl_venda decimal(8,2) default 0, primary key (nr_notafiscal, cd_medicamento), foreign key(nr_notafiscal) 
	REFERENCES Notafiscal(nr_notafiscal), foreign key(cd_medicamento) 
	REFERENCES Medicamento(cd_medicamento)
);

INSERT INTO cliente (nm_cliente, nr_telefone, dt_nascimento) VALUES('Ana Clara Mendes', '(11) 91234-5678', '1995-04-12');
INSERT INTO cliente (nm_cliente, nr_telefone, dt_nascimento) VALUES('Bruno Alves', '(21) 99876-5432', '1988-11-03');
INSERT INTO cliente (nm_cliente, nr_telefone, dt_nascimento) VALUES('Carlos Eduardo', NULL, '1979-07-22');
INSERT INTO cliente (nm_cliente, nr_telefone, dt_nascimento) VALUES('Daniela Souza', '(31) 98765-4321', NULL);
INSERT INTO cliente (nm_cliente, nr_telefone, dt_nascimento) VALUES('Eduarda Lima', '(41) 99123-4567', '2000-01-15');

INSERT INTO Medicamento (nm_medicamento,ds_medicamento,vl_custo,vl_venda,qt_estoque) VALUES ('Benegripe', 'Remédio pra gripe', 5.0, 10.0, 11);
INSERT INTO Medicamento (nm_medicamento,ds_medicamento,vl_custo,vl_venda,qt_estoque) VALUES ('Aspirina C', 'Remédio pra aumentar a resistência', 7.0, 11.0, 22);
INSERT INTO Medicamento (nm_medicamento,ds_medicamento,vl_custo,vl_venda,qt_estoque) VALUES ('Dermatos', 'Remédio pra dores', 20.0, 30.0, 33);
INSERT INTO Medicamento (nm_medicamento,ds_medicamento,vl_custo,vl_venda,qt_estoque) VALUES ('Cataflan', 'Remédio pra dor de garganta', 10.0, 15.0, 44);
INSERT INTO Medicamento (nm_medicamento,ds_medicamento,vl_custo,vl_venda,qt_estoque) VALUES ('Remédio 5', 'Remédio pra dores na barriga', 35.0, 50.0, 55);
INSERT INTO Medicamento (nm_medicamento,ds_medicamento,vl_custo,vl_venda,qt_estoque) VALUES ('Benegripe Genérico', 'Remédio pra gripe genérico', 9.0, 15.0, 66);
INSERT INTO Medicamento (nm_medicamento,ds_medicamento,vl_custo,vl_venda,qt_estoque) VALUES ('Dermatos Genérico', 'Remédio pra dores genérico', 50.0, 70.0, 77);
INSERT INTO Medicamento (nm_medicamento,ds_medicamento,vl_custo,vl_venda,qt_estoque) VALUES ('Vodol 50mg','Remédio para micose',21.20, 28.90, 30);
INSERT INTO Medicamento (nm_medicamento,ds_medicamento,vl_custo,vl_venda,qt_estoque) VALUES ('Vick' ,'Pastilha para garganta',11.50, 17.50, 80);
INSERT INTO Medicamento (nm_medicamento,ds_medicamento,vl_custo,vl_venda,qt_estoque) VALUES ('Doralgina','Remédio para dor de cabeça',9.90, 15, 10);

