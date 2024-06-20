CREATE PROCEDURE `sp_GetFolioGXTipo`(IN Ejercicio INT, IN Tipo INT)
BEGIN
SELECT 
    fet as FolGeneralXTipo
FROM
    foliospolizas f
        INNER JOIN
    cpoliza cp ON f.fk_poliza = cp.sys_pk
WHERE
    f.ejercicio = Ejercicio AND
    f.fk_tipo=Tipo
ORDER BY f.sys_pk DESC
LIMIT 1
;
END