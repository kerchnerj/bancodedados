select * from logradouro;
select * from logradouro where cep = '89224381';
explain bairros;
select ds_logradouro_nome, ds_bairro_nome, ds_cidade_nome, ds_uf_sigla, ds_uf_nome  from logradouro,bairros, cidades, uf
where cep = '89220720'
and bairros_cd_bairro = cd_bairro
and cidade_cd_cidade = cd_cidade
and uf_cd_uf = cd_uf;

select nome, ds_logradouro_nome, ds_bairro_nome, ds_cidade_nome, ds_uf_sigla, ds_uf_nome, descricao_tipo
from cad_usuario, logradouro ,bairros, cidades, uf, tipo_usuario
where  bairros_cd_bairro = cd_bairro
and cidade_cd_cidade = cd_cidade
and uf_cd_uf = cd_uf
and cad_usuario.log_cd_logradouro = logradouro.cd_logradouro
and cad_usuario.tipuser_cd = tipo_usuario.cod_tip_user;

select nome, cpf, cod_pedido, dtped
from cad_usuario, pedidos
where cad_usuario.cpf = pedidos.cad_usuario_cpf;

select nome, cpf, cod_pedido, dtped, qtditem, descricao, preco_unit
from cad_usuario, pedidos, itemped, produto
where cad_usuario.cpf = pedidos.cad_usuario_cpf
and pedidos.cod_pedido = itemped.ped_codpedidos
and itemped.prod_cod_produto = produto.cod_produto;

select descricao, preco_unit, preco_emb
from produto  
where preco_unit >= 3.00;

select nome, email, tel, cod_pedido, dtped, qtditem, descricao, preco_unit
from cad_usuario, pedidos , itemped, produto
where cad_usuario.cpf = pedidos.cad_usuario_cpf and 
pedidos.cod_pedido = itemped.ped_codpedidos and 
itemped.prod_cod_produto = produto.cod_produto and
cad_usuario.cpf = '56572286932';

select ds_logradouro_nome, ds_bairro_nome, ds_cidade_nome
from logradouro, bairros, cidades, tipo_logradouro
where logradouro.bairros_cd_bairro = bairros.cd_bairro and
bairros.cidade_cd_cidade = cidades.cd_cidade and
logradouro.log_cd_tip_log = tipo_logradouro.cd_tipo_logradouro and 
tipo_logradouro.desc_tip_log = 'rodovia' and
cidades.ds_cidade_nome = 'joinville';

select cod_pedido, cad_usuario_cpf, dtped, faturado, naofaturado, dtentrega, qtditem, descricao, preco_unit 
from pedidos, itemped, produto
where pedidos.cod_pedido = itemped.ped_codpedidos and 
itemped.prod_cod_produto = produto.cod_produto and
produto.preco_unit >= 1.20 and produto.preco_unit <= 8.00;



select * from produto;

select descricao, preco_unit, (preco_unit + 2.50)/2 as calculo from produto;


select cod_pedido, cad_usuario_cpf, dtped, faturado, naofaturado, dtentrega, qtditem, descricao, preco_unit 
from pedidos, itemped, produto
where pedidos.cod_pedido = itemped.ped_codpedidos and 
itemped.prod_cod_produto = produto.cod_produto and 
pedidos.faturado is not null;

select cod_produto, descricao, preco_unit,
preco_emb, qtd_emb, (preco_unit * qtd_emb) preco_embalagem
from produto;

select cod_produto, descricao, preco_unit,
preco_emb, qtd_emb, (preco_unit * qtd_emb) preco_embalagem
from produto where cod_produto = 22;

update produto set preco_emb =  (preco_unit * qtd_emb) where cod_produto = 22;

update produto set preco_emb =  (preco_unit * qtd_emb) where preco_emb is null;

update produto set preco_emb =  (preco_unit * qtd_emb)
 where preco_emb <> (preco_unit * qtd_emb);

 