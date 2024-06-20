CREATE PROCEDURE `sp_GetFolioP`(IN Periodo INT)
BEGIN
SELECT 
    fp as FolPeriodo
FROM
    foliospolizas f
        INNER JOIN
    cpoliza cp ON f.fk_poliza = cp.sys_pk
WHERE
    f.periodo = Periodo
ORDER BY f.sys_pk DESC
LIMIT 1
;
END