CREATE PROCEDURE `spCuentaXRubro`(IN _Mes int, IN _Rubro INT)
BEGIN
IF _Rubro is not null THEN
Select DISTINCT
	c.Codigo, c.Descripcion,
    ifnull(if(_Mes=01, SInicial , if(_Mes=02, S01 , if(_Mes=03, S02, if(_Mes=04, S03, if(_Mes=05, S04, if(_Mes=06, S05, if(_Mes=07, S06, if(_Mes=08, S07, if(_Mes=09, S08, if(_Mes=10, S09, if(_Mes=11, S10, if(_Mes=12, S11, if(_Mes=13, S12, 0.00))))))))))))), 0.00)
    as 'SaldoInicial', 
    r.Descripcion as Rubro,
    ifnull(if(_Mes=01, D01 , if(_Mes=02, D02 , if(_Mes=03, D03, if(_Mes=04, D04, if(_Mes=05, D05, if(_Mes=06, D06, if(_Mes=07, D07, if(_Mes=08, D08, if(_Mes=09, D09, if(_Mes=10, D10, if(_Mes=11, D11, if(_Mes=12, D12, if(_Mes=13, DFinal, 0.00))))))))))))), 0.00)
    as 'Debe',
    ifnull(if(_Mes=01, H01 , if(_Mes=02, H02 , if(_Mes=03, H03, if(_Mes=04, H04, if(_Mes=05, H05, if(_Mes=06, H06, if(_Mes=07, H07, if(_Mes=08, H08, if(_Mes=09, H09, if(_Mes=10, H10, if(_Mes=11, H11, if(_Mes=12, H12, if(_Mes=13, HFinal, 0.00))))))))))))),0.00)
    as 'Haber',
    ifnull(if(_Mes=01, S01 , if(_Mes=02, S02 , if(_Mes=03, S03, if(_Mes=04, S04, if(_Mes=05, S05, if(_Mes=06, S06, if(_Mes=07, S07, if(_Mes=08, S08, if(_Mes=09, S09, if(_Mes=10, S10, if(_Mes=11, S11, if(_Mes=12, S12, if(_Mes=13, SFinal, 0.00))))))))))))),0.00)
    as 'Saldo',
	c.sys_pk,
	c.uf_sat_codigo,
    Tipo,
	if(c.Tipo = 1, 'Acreedora', 'Deudora') as Naturaleza,
	c.sys_user,
	c.sys_timestamp,
	c.sys_recver,
	c.sys_lock,
	c.sys_lastuser,
	c.sys_info,
	c.sys_guid,
	c.sys_exported,
	c.sys_dtexported,
	c.sys_dtcreated,
	c.sys_deleted,
	c.SFinal,
	c.P_Anual,
	c.IDivisa,
	c.ICuenta,
	c.HFinal,
	c.DFinal,
	c.Detalle,
    if(c.Detalle = 0, 'Acumulativa', 'Detalle') as TipoDetalle,
	c.Departamental,
	c.Contrapartida,
	c.APAC,
    sat.uf_CodAgrup as CodAgrup,
    d.Codigo as Divisa
    from ccontable c
    left join ccontable_crubro_ cR on c.Sys_PK = cR.Cuentas
    left join crubro r on cR.Rubros = r.Sys_PK
    left join ut_sat_cuenta sat on c.uf_sat_codigo = sat.sys_pk
    left join divisa d on c.IDivisa = d.sys_pk
	where cR.Rubros = _Rubro
    order by c.Codigo;
END IF;
IF _Rubro is null THEN
Select
	c.Codigo, c.Descripcion, 
    ifnull(if(_Mes=01, SInicial , if(_Mes=02, S01 , if(_Mes=03, S02, if(_Mes=04, S03, if(_Mes=05, S04, if(_Mes=06, S05, if(_Mes=07, S06, if(_Mes=08, S07, if(_Mes=09, S08, if(_Mes=10, S09, if(_Mes=11, S10, if(_Mes=12, S11, if(_Mes=13, S12, 0.00))))))))))))), 0.00)
    as 'SaldoInicial', 
    r.Descripcion as Rubro,
    ifnull(if(_Mes=01, D01 , if(_Mes=02, D02 , if(_Mes=03, D03, if(_Mes=04, D04, if(_Mes=05, D05, if(_Mes=06, D06, if(_Mes=07, D07, if(_Mes=08, D08, if(_Mes=09, D09, if(_Mes=10, D10, if(_Mes=11, D11, if(_Mes=12, D12, if(_Mes=13, DFinal, 0.00))))))))))))), 0.00)
    as 'Debe',
    ifnull(if(_Mes=01, H01 , if(_Mes=02, H02 , if(_Mes=03, H03, if(_Mes=04, H04, if(_Mes=05, H05, if(_Mes=06, H06, if(_Mes=07, H07, if(_Mes=08, H08, if(_Mes=09, H09, if(_Mes=10, H10, if(_Mes=11, H11, if(_Mes=12, H12, if(_Mes=13, HFinal, 0.00))))))))))))),0.00)
    as 'Haber',
    ifnull(if(_Mes=01, S01 , if(_Mes=02, S02 , if(_Mes=03, S03, if(_Mes=04, S04, if(_Mes=05, S05, if(_Mes=06, S06, if(_Mes=07, S07, if(_Mes=08, S08, if(_Mes=09, S09, if(_Mes=10, S10, if(_Mes=11, S11, if(_Mes=12, S12, if(_Mes=13, SFinal, 0.00))))))))))))),0.00)
    as 'Saldo',
	c.sys_pk,
	c.uf_sat_codigo,
    Tipo,
	if(c.Tipo = 1, 'Acreedora', 'Deudora') as Naturaleza,
	c.sys_user,
	c.sys_timestamp,
	c.sys_recver,
	c.sys_lock,
	c.sys_lastuser,
	c.sys_info,
	c.sys_guid,
	c.sys_exported,
	c.sys_dtexported,
	c.sys_dtcreated,
	c.sys_deleted,
	c.SFinal,
	c.P_Anual,
	c.IDivisa,
	c.ICuenta,
	c.HFinal,
	c.DFinal,
	c.Detalle,
    if(c.Detalle = 0, 'Acumulativa', 'Detalle') as TipoDetalle,
	c.Departamental,
	c.Contrapartida,
	c.APAC,
    sat.uf_CodAgrup as CodAgrup,
    d.Codigo as Divisa
    from ccontable c
    left join ccontable_crubro_ cR on c.Sys_PK = cR.Cuentas
    left join crubro r on cR.Rubros = r.Sys_PK
    left join ut_sat_cuenta sat on c.uf_sat_codigo = sat.sys_pk
    left join divisa d on c.IDivisa = d.sys_pk
    group by c.Codigo
    ;
END IF;
END