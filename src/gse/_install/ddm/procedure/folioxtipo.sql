CREATE PROCEDURE `sp_GetFolioPXTipo`(IN Periodo INT, IN Tipo INT)
BEGIN
SELECT 
    fpt as FolPeriodoXTipo
FROM
    foliospolizas f
        INNER JOIN
    cpoliza cp ON f.fk_poliza = cp.sys_pk
WHERE
    f.periodo = Periodo AND
    f.fk_tipo = Tipo
ORDER BY f.sys_pk DESC
LIMIT 1;
END