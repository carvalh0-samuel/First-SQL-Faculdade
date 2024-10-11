create database db_clinica_samuel;

create table tb_medico(
crm int not null,
nome varchar(50) not null,
primary key(crm)
);

alter table tb_medico add sexo enum ('F','M');
alter table tb_medico change nome nome varchar(100);

create table tb_paciente(
id int not null,
nome varchar(50) not null,
primary key(id)
);
create table tb_consulta(
id int not null,
crm int not null,
id_paciente int not null,
primary key(id),
foreign key(crm) references tb_medico(crm),
foreign key(id_paciente) references tb_paciente(id)
);

alter table tb_consulta add data_consulta date not null;
update tb_medico set sexo='M' where crm=12345;

truncate table tb_consulta;

insert into tb_medico (crm, nome, sexo) values (15894, "Chico Trovao", 'M');
insert into tb_paciente (id, nome) values (1, "Francisco");
insert into tb_consulta (id, crm, id_paciente, data_consulta) values (1, 12345, 1, "2024-10-11");
insert into tb_medico (crm, nome, sexo) values (10101, "Helena Oliveira", 'F');


select * from tb_medico;
select * from tb_paciente;
select tb_consulta.id,tb_consulta.crm,tb_consulta.id_paciente,tb_consulta.data_consulta, tb_medico.nome as nome_medico,tb_paciente.nome as nome_paciente from tb_consulta join tb_medico on tb_consulta.crm=tb_medico.crm join tb_paciente on tb_consulta.id_paciente=tb_paciente.id;

drop database db_clinica_vitor