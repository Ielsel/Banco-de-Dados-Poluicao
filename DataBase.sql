create table projbd.regulamentacoes(
    id integer primary key not null,
    data date,
    orgao_regulador varchar(100)
);

create table projbd.localizacao(
    id integer primary key not null,
    rua varchar(30),
    cidade varchar(20),
    estado varchar(20)
);

create table projbd.insercao(
    id_regulamentacoes integer,
    id_localizacao integer,
    foreign key (id_regulamentacoes) references projbd.regulamentacoes,
    foreign key (id_localizacao) references projbd.localizacao
);

create table projbd.fonte(
    id integer primary key not null,
    qtd_poluentes numeric,
    id_localizacao integer,
    foreign key (id_localizacao) references projbd.localizacao
);

create table projbd.metodocontroledePoluicao(
    id integer primary key not null,
    desc_metodoDeControle varchar (500)
);

create table projbd.usa(
    id_metodoDeControle integer,
    id_fonte integer,
    foreign key (id_metodoDeControle) references projbd.metodoControledePoluicao,
    foreign key (id_fonte) references projbd.fonte
);
create table projbd.tiposDePoluicao(
    id integer primary key not null,
    desc_poluente varchar(500),
    id_fonte integer,
    foreign key (id_fonte) references projbd.fonte
);

create table projbd.possui(
    id_metodoDeControle integer,
    id_tipoPoluente integer,
    foreign key (id_metodoDeControle) references projbd.metodoControledePoluicao,
    foreign key (id_tipoPoluente) references projbd.metodoControledePoluicao
);

create table projbd.medicoesDePoluicao(
    id integer primary key not null,
    nivel_concentração numeric
);

create table projbd.medida(
    id_tipoPoluente integer,
    id_medicao integer,
    data date,
    foreign key (id_tipoPoluente) references projbd.tiposDePoluicao,
    foreign key (id_medicao) references projbd.medicoesDePoluicao
);

create table projbd.metodoDeMedicao(
    id integer primary key not null,
    desc_metodo varchar (500)
);

create table projbd.utiliza(
    id_medicao integer,
    id_metodo integer,
    foreign key (id_medicao) references projbd.medicoesDePoluicao,
    foreign key (id_metodo) references projbd.metodoDeMedicao
);
