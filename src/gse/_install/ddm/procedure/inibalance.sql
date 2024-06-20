

CREATE PROCEDURE `UpdateInitialBalance`(in pk int)
BEGIN
DECLARE cr_stack_depth_handler INTEGER;
DECLARE cr_stack_depth INTEGER DEFAULT cr_debug.ENTER_MODULE2('UpdateInitialBalance', 'se_e8d4bdd1559a48b599f33a2562508286', 7, 100636);
	
	DECLARE Padre INT DEFAULT NULL;
    DECLARE SaldoHijos INT DEFAULT 0;
    CALL cr_debug.UPDATE_WATCH3('pk', pk, 'int', cr_stack_depth);
CALL cr_debug.UPDATE_WATCH3('Padre', Padre, 'INT', cr_stack_depth);
CALL cr_debug.UPDATE_WATCH3('SaldoHijos', SaldoHijos, 'INT', cr_stack_depth);
CALL cr_debug.TRACE(2, 2, 0, 5, cr_stack_depth);
CALL cr_debug.TRACE(6, 6, 4, 65, cr_stack_depth);
SET Padre = (Select ICuenta FROM ccontable WHERE sys_pk= pk);
CALL cr_debug.UPDATE_WATCH3('Padre', Padre, '', cr_stack_depth);
    
	CALL cr_debug.TRACE(8, 75, 1, 11, cr_stack_depth);
IF((select detalle from ccontable where sys_pk = pk) = 1)
    THEN
		CALL cr_debug.TRACE(10, 39, 2, 9, cr_stack_depth);
IF((select Tipo from ccontable where sys_pk = pk) = 0)
        THEN
		CALL cr_debug.TRACE(12, 24, 2, 80, cr_stack_depth);
UPDATE ccontable SET S01 = SInicial + (D01 - H01) * 1,
							 S02 = S01 + (D02 - H02) * 1,
                             S03 = S02 + (D03 - H03) * 1,
                             S04 = S03 + (D04 - H04) * 1,
                             S05 = S04 + (D05 - H05) * 1,
                             S06 = S05 + (D06 - H06) * 1,
                             S07 = S06 + (D07 - H07) * 1,
                             S08 = S07 + (D08 - H08) * 1,
                             S09 = S08 + (D09 - H09) * 1,
                             S10 = S09 + (D10 - H10) * 1,
                             S11 = S10 + (D11 - H11) * 1,
                             S12 = S11 + (D12 - H12) * 1,
                             SFinal = S12 + (DFinal - HFinal) WHERE sys_pk = pk;
CALL cr_debug.UPDATE_SYSTEM_CALLS(104);
		ELSE
        CALL cr_debug.TRACE(26, 38, 8, 87, cr_stack_depth);
UPDATE ccontable SET S01 = SInicial + ((D01 - H01) * -1),
							 S02 = S01 + ((D02 - H02) * -1),
                             S03 = S02 + ((D03 - H03) * -1),
                             S04 = S03 + ((D04 - H04) * -1),
                             S05 = S04 + ((D05 - H05) * -1),
                             S06 = S05 + ((D06 - H06) * -1),
                             S07 = S06 + ((D07 - H07) * -1),
                             S08 = S07 + ((D08 - H08) * -1),
                             S09 = S08 + ((D09 - H09) * -1),
                             S10 = S09 + ((D10 - H10) * -1),
                             S11 = S10 + ((D11 - H11) * -1),
                             S12 = S11 + ((D12 - H12) * -1),
                             SFinal = S12 + ((DFinal - HFinal) * -1) WHERE sys_pk = pk;
CALL cr_debug.UPDATE_SYSTEM_CALLS(104);
		END IF;
CALL cr_debug.UPDATE_SYSTEM_CALLS(101);
	ELSE
		CALL cr_debug.TRACE(41, 74, 2, 19, cr_stack_depth);
IF((select Tipo from ccontable where sys_pk = pk) = 0)
			THEN
            CALL cr_debug.TRACE(43, 43, 12, 122, cr_stack_depth);
SET SaldoHijos = (SELECT IFNULL(SUM(SInicial*(1 - (Tipo*-2))),0.00) Saldos FROM ccontable WHERE ICuenta = pk);
CALL cr_debug.UPDATE_WATCH3('SaldoHijos', SaldoHijos, '', cr_stack_depth);
			CALL cr_debug.TRACE(44, 44, 3, 64, cr_stack_depth);
UPDATE ccontable SET SInicial = SaldoHijos WHERE sys_pk = pk;
CALL cr_debug.UPDATE_SYSTEM_CALLS(104);
            CALL cr_debug.TRACE(45, 57, 12, 80, cr_stack_depth);
UPDATE ccontable SET S01 = SInicial + (D01 - H01) * 1,
							 S02 = S01 + (D02 - H02) * 1,
                             S03 = S02 + (D03 - H03) * 1,
                             S04 = S03 + (D04 - H04) * 1,
                             S05 = S04 + (D05 - H05) * 1,
                             S06 = S05 + (D06 - H06) * 1,
                             S07 = S06 + (D07 - H07) * 1,
                             S08 = S07 + (D08 - H08) * 1,
                             S09 = S08 + (D09 - H09) * 1,
                             S10 = S09 + (D10 - H10) * 1,
                             S11 = S10 + (D11 - H11) * 1,
                             S12 = S11 + (D12 - H12) * 1,
                             SFinal = S12 + (DFinal - HFinal) WHERE sys_pk = pk;
CALL cr_debug.UPDATE_SYSTEM_CALLS(104);
            ELSE
            CALL cr_debug.TRACE(59, 59, 12, 127, cr_stack_depth);
SET SaldoHijos = (SELECT IFNULL(SUM(SInicial*(1 - (Tipo*-2)* - 1)),0.00) Saldos FROM ccontable WHERE ICuenta = pk);
CALL cr_debug.UPDATE_WATCH3('SaldoHijos', SaldoHijos, '', cr_stack_depth);
            CALL cr_debug.TRACE(60, 60, 12, 73, cr_stack_depth);
UPDATE ccontable SET SInicial = SaldoHijos WHERE sys_pk = pk;
CALL cr_debug.UPDATE_SYSTEM_CALLS(104);
            CALL cr_debug.TRACE(61, 73, 12, 87, cr_stack_depth);
UPDATE ccontable SET S01 = SInicial + ((D01 - H01) * -1),
							 S02 = S01 + ((D02 - H02) * -1),
                             S03 = S02 + ((D03 - H03) * -1),
                             S04 = S03 + ((D04 - H04) * -1),
                             S05 = S04 + ((D05 - H05) * -1),
                             S06 = S05 + ((D06 - H06) * -1),
                             S07 = S06 + ((D07 - H07) * -1),
                             S08 = S07 + ((D08 - H08) * -1),
                             S09 = S08 + ((D09 - H09) * -1),
                             S10 = S09 + ((D10 - H10) * -1),
                             S11 = S10 + ((D11 - H11) * -1),
                             S12 = S11 + ((D12 - H12) * -1),
                             SFinal = S12 + ((DFinal - HFinal) * -1) WHERE sys_pk = pk;
CALL cr_debug.UPDATE_SYSTEM_CALLS(104);
            End IF;
CALL cr_debug.UPDATE_SYSTEM_CALLS(101);
    End IF;
CALL cr_debug.UPDATE_SYSTEM_CALLS(101);
    CALL cr_debug.TRACE(76, 79, 4, 11, cr_stack_depth);
IF(Padre is not null)
    THEN
		CALL cr_debug.TRACE(78, 78, 2, 35, cr_stack_depth);
Call UpdateInitialBalance(Padre);
CALL cr_debug.UPDATE_WATCH3('Padre', Padre, '', cr_stack_depth);
    END IF;
CALL cr_debug.TRACE(80, 80, 0, 3, cr_stack_depth);
CALL cr_debug.LEAVE_MODULE(cr_stack_depth - 1);
END

