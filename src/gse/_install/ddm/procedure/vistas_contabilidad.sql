
DROP VIEW IF EXISTS `qrypoliza`;
DROP VIEW IF EXISTS `qryuserprofile`;
DROP VIEW IF EXISTS `qryusersbygroup`;

DROP TABLE IF EXISTS `qrypoliza`;
CREATE TABLE `qrypoliza` (
	`Sys_PK` INT(11) NOT NULL,
	`fet` INT(11) NULL,
	`Tipo` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`Fecha` DATE NOT NULL,
	`Concepto` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`Debe` DECIMAL(26,8) NULL,
	`Haber` DECIMAL(26,8) NULL,
	`Aplicada` TINYINT(1) NULL,
	`Referencia` VARCHAR(35) NOT NULL COLLATE 'latin1_swedish_ci',
	`Auditada` TINYINT(1) NULL,
	`Notas` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`fe` INT(11) NULL,
	`fp` INT(11) NULL,
	`fpt` INT(11) NULL,
	`Sys_GUID` VARCHAR(32) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

DROP TABLE IF EXISTS `qryuserprofile`;
CREATE TABLE `qryuserprofile` (
	`userid` VARCHAR(120) NOT NULL COLLATE 'latin1_swedish_ci',
	`item` INT(11) NOT NULL,
	`description` VARCHAR(250) NULL COLLATE 'latin1_swedish_ci',
	`itemid` VARCHAR(32) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

DROP TABLE IF EXISTS `qryusersbygroup`;
CREATE TABLE `qryusersbygroup` (
	`UserID` VARCHAR(120) NOT NULL COLLATE 'latin1_swedish_ci',
	`UserName` VARCHAR(120) NOT NULL COLLATE 'latin1_swedish_ci',
	`PWD` VARCHAR(32) NULL COLLATE 'latin1_swedish_ci',
	`Message` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`Locked` TINYINT(1) NULL,
	`Notes` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`GroupID` VARCHAR(15) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

DROP TABLE IF EXISTS `qrypoliza`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `qrypoliza` AS select cpoliza.sys_pk AS Sys_PK,foliospolizas.fet AS fet,ctipospolizas.Const AS Tipo,cpoliza.Fecha AS Fecha,cpoliza.Concepto AS Concepto,cpoliza.Debe AS Debe,cpoliza.Haber AS Haber,cpoliza.Aplicada AS Aplicada,cpoliza.Referencia AS Referencia,cpoliza.Auditada AS Auditada,cpoliza.Notas AS Notas,foliospolizas.fe AS fe,foliospolizas.fp AS fp,foliospolizas.fpt AS fpt,cpoliza.sys_guid AS Sys_GUID from ((ctipospolizas join cpoliza on((ctipospolizas.ID = cpoliza.Tipo))) left join foliospolizas on((cpoliza.sys_pk = foliospolizas.fk_poliza))) order by ctipospolizas.Const,foliospolizas.fet,cpoliza.Fecha ;
DROP TABLE IF EXISTS `qryuserprofile`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `qryuserprofile` AS select tuser.userid, profile.item, sitem.description, sitem.itemid from sitem inner join (tuser inner join (user_usergroup_ inner join profile on user_usergroup_.groups=profile.usergroup) on tuser.sys_pk=user_usergroup_.users) on sitem.sys_pk=profile.item group by tuser.userid, profile.item, sitem.description, sitem.itemid ;
DROP TABLE IF EXISTS `qryusersbygroup`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `qryusersbygroup` AS SELECT TUser.UserID, TUser.UserName, TUser.PWD, TUser.Message, TUser.Locked, TUser.Notes, UserGroup.GroupID FROM TUser INNER JOIN (UserGroup INNER JOIN User_UserGroup_ ON UserGroup.Sys_PK=User_UserGroup_.Groups) ON TUser.Sys_PK=User_UserGroup_.Users ;

