USE codelard;


create table maison(
m_nom varchar(50) not null,
m_devise varchar(100) not null,
m_animal varchar(50) not null,
primary key(m_nom));

create table élève(
e_id varchar(50) not null,
e_nom varchar(50) not null,
e_prénom varchar(50) not null,
primary key(e_id));

create table appartient(
e_id varchar(50) not null,
m_nom varchar(50) not null,
primary key (e_id),
foreign key (e_id) references élève(e_id),
foreign key (m_nom) references maison(m_nom));

create table professeur(
p_id varchar(50) not null,
p_nom varchar(50) not null,
p_prénom varchar(50) not null,
primary key(p_id));

create table cours(
c_id varchar(50) not null,
c_intitulé varchar(100) not null,

primary key(c_id));

create table suit(
e_id varchar(50) not null,
c_id varchar(50) not null,
note char(1) not null,
primary key (e_id, c_id),
foreign key (e_id) references élève(e_id),
foreign key (c_id) references cours(c_id));

create table enseigne(
c_id varchar(50) not null,
p_id varchar(50) not null,
primary key (c_id),
foreign key (c_id) references cours(c_id),
foreign key (p_id) references professeur(p_id));

create table attribue_des_points(
id_attribution int not null auto_increment,
nb_points int not null,
motif varchar(255) not null,
p_id varchar(50) not null,
m_nom varchar(50) not null,
primary key (id_attribution),
foreign key (p_id) references professeur(p_id),
foreign key (m_nom) references maison(m_nom));

show tables;






    
