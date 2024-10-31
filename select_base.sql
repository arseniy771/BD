ELECT 
    `salespeople`.`sname`,
    `salespeople`.`city`,
    `salespeople`.`comm`
FROM `shop`.`salespeople`;


/* Отбор без повторяющихся значений */
SELECT all
`sales`.`sdate`, `sales`.`snum`
FROM `shop`.`sales`;



/* Отбор по условию (предложение where) */
/* Отбор продавцов из определённых городов*/
SELECT 
    `salespeople`.`sname`,
    `salespeople`.`comm`
FROM 
	`shop`.`salespeople`
	WHERE 
		`salespeople`.`city` = 'Новосибирск' OR `salespeople`.`city` = 'Тверь';
		/* Отбор покупателей по опредленённому рейтингу*/
SELECT 
    `customers`.`cname`,
    `customers`.`city`
FROM 
	`shop`.`customers`
	WHERE 
		NOT `customers`.`rating`>=200; 
		    
		   
		   /* Применение условий отбора для NULL-значений*/
    SELECT 
    `customers`.`cname`,
    `customers`.`city`
FROM 
	`shop`.`customers`
	WHERE 
		`customers`.`rating` <> 200 OR  `customers`. `rating` = 200; 

		/* NULL-значения (неизвестный результат сравнения) не выводятся в результат отбора*/

/*Составные условия с логическими операторами OR, AND, NOT */
 SELECT 
    `customers`.`cname`,
    `customers`.`city`
FROM 
	`shop`.`customers`
	WHERE 
		`customers`.`city` = 'Новосибирск' AND 	NOT `customers`. `rating` > 200; 
		    
		     SELECT 
		    `customers`.`cname`,
		    `customers`.`city`
		FROM 
			`shop`.`customers`
			WHERE 
				NOT `customers`.`city` = 'Новосибирск' AND 	NOT `customers`. `rating` > 200; 
				    
				     SELECT 
				    `customers`.`cname`,
				    `customers`.`city`
				FROM 
					`shop`.`customers`
					WHERE 
						NOT (`customers`.`city` = 'Новосибирск' AND  `customers`. `rating` > 200); 

						/* Пример отбора по детам */
SELECT 
	`sales`.`snum`,
	    `sales`.`cnum`,
	    `sales`.`sdate`,
	    `sales`.`amount`
	FROM 
		`shop`.`sales`
		WHERE 
			(`sales`.`sdate` > '2024-08-19'
				    AND `sales`.`sdate` < '2024-10-01')
			    AND (NOT (`sales`.`sdate` > '2024-07-13' 
					    AND `sales`.`sdate` < '2024-08-22')) 
			    AND NOT cnum=203;

			SELECT 
				`sales`.`snum`,
				    `sales`.`cnum`,
				    `sales`.`sdate`,
				    `sales`.`amount`
				FROM 
					`shop`.`sales`
					WHERE 
						(`sales`.`sdate` > '2024-08-19'
							    AND `sales`.`sdate` < '2024-10-01')
						    AND (NOT (`sales`.`sdate` > '2024-07-13' 
								    AND `sales`.`sdate` < '2024-08-22')) 
						    AND NOT cnum=203 OR (cnum=203) AND (`sales`.`sdate` > '2024-08-19'
							    AND `sales`.`sdate` < '2024-10-01') ;
						 
