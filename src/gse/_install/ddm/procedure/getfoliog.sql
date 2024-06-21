DROP PROCEDURE IF EXISTS `sp_GetFolioG`;
CREATE PROCEDURE `sp_GetFolioG`(IN Ejercicio INT)
BEGIN
SELECT 
    fe as FolGeneral
FROM
    foliospolizas f
        INNER JOIN
    cpoliza cp ON f.fk_poliza = cp.sys_pk
WHERE
    f.ejercicio = Ejercicio
ORDER BY f.sys_pk DESC
LIMIT 1
;
END