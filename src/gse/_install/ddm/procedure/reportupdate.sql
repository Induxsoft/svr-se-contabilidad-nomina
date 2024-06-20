CREATE PROCEDURE `SE_Reports_UpdateInserData`(
		IN idVar longtext,
       	IN idVarEncabezado longtext,
		IN idVarLogo longtext,
		IN Pie longtext,
		IN Encab longtext,
		IN Log longtext

		)
proc_label:BEGIN
		DECLARE _errorState tinyint(1);
		declare banderaExiste int;
		declare banderaExiste2 int;
		declare banderaExiste3 int;
		declare success int;
		declare msg varchar(1024);
		declare msg1 varchar(1024);
		declare msg2 varchar(1024);
		declare msg3 varchar(1024);

		DECLARE CONTINUE HANDLER FOR SQLEXCEPTION BEGIN SET _errorState = 1; END;
		set banderaExiste = (select ifnull((select sys_pk from se_var where id = idVarEncabezado), 0));
		set banderaExiste2 = (select ifnull((select sys_pk from se_var where id = idVar), 0));
		set banderaExiste3 = (select ifnull((select sys_pk from se_var where id = idVarLogo), 0));

		START TRANSACTION;

		if(banderaExiste > 0) then
			update se_var set value = Encab where  sys_pk = banderaExiste;
			IF _errorState THEN
			ROLLBACK;
			SET success=0;
			set msg='No fue posible actualizar1';
			select success, msg;
			LEAVE proc_label;
		  END IF;
		  
		  set msg1 = 'Item actualizado1';
		else
			if(banderaExiste <= 0) then
				insert into se_var (sys_timestamp,sys_guid,id,value) values (now(),replace(uuid(), '-', ''), 'SE_Reports_Encabezado', Encab);
				IF _errorState THEN
				ROLLBACK;
				SET success=0;
				set msg='No fue posible insertar1';
				select success, msg;
				LEAVE proc_label;
				end if;
				set msg1 = 'Item insertado 1';
			end if;
		  commit;  
		end if;

		if(banderaExiste2 > 0) then
			update se_var set value = Pie where  sys_pk = banderaExiste2;
			IF _errorState THEN
			ROLLBACK;
			SET success=0;
			set msg='No fue posible actualizar2';
			select success, msg;
			LEAVE proc_label;
		  END IF;
		  set msg2 = 'Item actualizado2';
		else
			if(banderaExiste2 <= 0) then
				insert into se_var (sys_timestamp,sys_guid,id,value) values (now(),replace(uuid(), '-', ''), 'SE_Reports_Pie', Pie);
				IF _errorState THEN
				ROLLBACK;
				SET success=0;
				set msg='No fue posible insertar2';
				select success, msg;
				LEAVE proc_label;
				end if;
				set msg2 = 'Item insertado 2';
			end if;
		  commit;  
		end if;

		if(banderaExiste3 > 0) then
			update se_var set value = Log where  sys_pk = banderaExiste3;
			IF _errorState THEN
			ROLLBACK;
			SET success=0;
			set msg='No fue posible actualizar3';
			select success, msg;
			LEAVE proc_label;
		  END IF;
		  set msg3 = 'Item actualizado3';
		else
			if(banderaExiste3 <= 0) then
				insert into se_var (sys_timestamp,sys_guid,id,value) values (now(),replace(uuid(), '-', ''), 'SE_Reports_Logo', Log);
				IF _errorState THEN
				ROLLBACK;
				SET success=0;
				set msg='No fue posible insertar3';
				select success, msg;
				LEAVE proc_label;
				end if;
				set msg3 = 'Item insertado3';
			end if;  
		end if;


		Commit;
		select msg1, msg2, msg3;
		END