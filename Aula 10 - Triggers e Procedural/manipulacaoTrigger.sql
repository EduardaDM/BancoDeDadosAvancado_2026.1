select * from medicamentos;
select * from notaFiscal;
select * from intemnotafiscal;

delimiter $ 
create or replace trigger tg_venda_medicamento before insert 
	on itemnotafical for each row
begin
	declare v_valor_met decimal(8,2) default 0.0;
    declare v_estoque_med int default 0;
    -- obtendo a qntdd em estoque de medicamento
    select m.qt_estoque into v_estoque_med -- atribui ao estoque
		from medicamento m where m.cd_medicamneto = new.cd_medicamento;
        -- testando  o estoque
	if v_estoque_med < new.qt_vendida then
		signal sqlstate '45000' set message_text = 'Estoque insuficiente!'; -- tratamento
	end if;
    -- baixando a qntdd de estoque
	update medicamento m
		set m.qt_estoque = m.qt_estoque - NEW.qt_vendida
        where m.cd_medicamento = NEW.cd_medicamento;
        -- obtendo o valor do medicamento
	select m_vl_valor into v_valor_med from medicamento m 
		where m_cd_medicamento = new_cd_medicamento;
	-- ajustando o valor da venda
	set new.vl_venda = v_valor_med; -- atualiza valores
    -- atualizando total valor da nf
    update notafiscal nf 
		set nf.vl_total = nf.vl_total + (new.vl_venda)
        where nf.nr_notafiscal = new.nr_notafiscal;
end $

insert into cliente (nm_cliente) values ('Jose');
insert into notaFiscal(dc_cliente) values(1);
delete from itemnotafiscal where nr_notafiscal;
insert into itemnotafiscal(nr_notafiscal, cd_medicamento, qt_vendida,vl_venda) 
			values(1, 1, 2, 0);

select * from medicamento;
select * from notafiscal;
select * from itemnotafiscal;