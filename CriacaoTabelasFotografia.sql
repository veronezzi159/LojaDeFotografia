USE DBLojaFotografia;

CREATE TABLE Endereco (
	idEndereco int IDENTITY(1,1),
	Estado varchar(25),
	Cidade varchar(30),
	Bairro varchar(30),
	Logadouro varchar(30),
	TipoLogadouro varchar(15),
	CEP varchar(08),
	CONSTRAINT pk_endereco primary key (idEndereco)

);


CREATE TABLE Departamento (
	codDepartamento varchar(5),
	Nome varchar(25),
	Constraint pk_departamento primary key (codDepartamento)
);

CREATE TABLE Funcionario(
	Codigo varchar(5),
	Nome varchar(50),
	Contato varchar(50),
	Telefone varchar(14),
	Funcao  varchar(25),
	Numero	int,
	Complemento varchar(100),
	id_endereco int,
	CodDP varchar(5),
	CONSTRAINT pk_func primary key (Codigo),
	CONSTRAINT fk_end foreign key(id_endereco) references Endereco (idEndereco),
	CONSTRAINT fk_dp  foreign key(CodDp) references Departamento(codDepartamento)
);

CREATE TABLE Cliente (
	Codigo int identity(1,1),
	Nome varchar(50),
	tipo varchar(25),
	numero varchar(5),
	complemento varchar(100),
	IdEndereco int,
	CONSTRAINT pk_cliente primary key (Codigo),
	CONSTRAINT fk_end_cliente foreign key (IdEndereco) references Endereco(idEndereco)

);

CREATE TABLE PessoaFisica (
	CPF varchar(11),
	RG varchar (09),
	Sexo char(1),
	DataNascimento date,
	CodCliente int,
	CONSTRAINT pk_pessoa primary key (CPF),
	CONSTRAINT un_pessoa unique (RG),
	CONSTRAINT fk_cod_client_pessoa foreign key (CodCliente) references Cliente (Codigo),
	CONSTRAINT un_cod_client_pessoa unique (CodCliente)

);

CREATE TABLE PessoaJuridica(
	CNPJ varchar(18),
	InscricaoEstadual varchar(9),
	NomeResponsavel varchar(50),
	CodCliente int,
	CONSTRAINT pk_juridica primary key (CNPJ),
	CONSTRAINT fk_cod_client_juridica foreign key (CodCliente) references Cliente (codigo),
	CONSTRAINT un_cod_client_juridica unique (CodCliente)

);

CREATE TABLE Telefone (
	CodCliente int,
	Numero varchar(14),
	Tipo varchar (25),
	CONSTRAINT pk_fone primary key (CodCliente,Numero),
	CONSTRAINT fk_cod_client_fone foreign key (CodCliente) references Cliente (codigo)

);
CREATE TABLE Produto (
	Codigo varchar(5),
	Tipo varchar(25),
	Descricao varchar(100),
	Constraint pk_produto primary key (Codigo)

);

CREATE TABLE Compra(
	Codigo int identity(1,1),
	Preco numeric(8,2),
	Quantidade int,
	DataCompra date,
	CodProduto varchar(5),
	CONSTRAINT pk_compra primary key (Codigo),
	CONSTRAINT fk_cod_produto_compra foreign key (CodProduto) references Produto (Codigo)

);

CREATE TABLE Venda (
	Codigo int identity(1,1),
	Preco numeric (10,2),
	DataVenda date,
	CodFuncionario varchar(5),
	CodCliente int,
	CONSTRAINT pk_venda primary key (Codigo),
	CONSTRAINT fk_func_venda foreign key (CodFuncionario) references Funcionario (codigo),
	CONSTRAINT fk_client_venda foreign key (CodCLiente) references Cliente (codigo)

);

CREATE TABLE ItemVenda (
	codigoVenda int,
	codigoProduto varchar(5),
	quantidade numeric (10,2),
	CONSTRAINT pk_itemVenda primary key(codigoVenda,codigoProduto),
	CONSTRAINT fk_produto_item foreign key (codigoProduto) references Produto (codigo),
	CONSTRAINT fk_venda_item foreign key (codigoVenda) references Venda (codigo)
);