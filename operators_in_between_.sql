ELECT
	`customers`.`cname`,
	    `customers`.`city`,
		`customers`.`rating`,
		    `customers`.`snum`
		FROM
			`shop`.`customers`
			    WHERE `customers`.`city` IN ('Новосибирск', 'Омск');
			    
			SELECT
				`sales`.`sdate`, `sales`.`amount`
				FROM 
					`shop`.`sales`
					WHERE
						`sales`.`sdate` IN ('2024-09-12', '2024-09-13','2024-09-17');
						    
						/*BETWEEN - выборка из диапозона значений*/
SELECT
	`sales`.`sdate`,`sales`.`amount`
	FROM 
		`shop`.`sales`
		WHERE
			`sales`.`sdate` BETWEEN '2024-09-12' AND '2024-09-17';
			    
			SELECT
				`salespeople`.`sname`,
					`salespeople`.`city`,
						`salespeople`.`comm`
						FROM
							`shop`.`salespeople`
							WHERE
								`salespeople`.`comm` BETWEEN 0.09 AND 0.11
									AND NOT `salespeople`.`comm` IN (0.09 , 0.11);
									    
									/*Исключение границ*/

SELECT
	`customers`.`cname`,
	    `customers`.`city`,
		`customers`.`rating`,
		    `customers`.`snum`
		FROM
			`shop`.`customers`
			WHERE 
			    `customers`.`city` BETWEEN 'Н' AND 'Омскк'
			    ORDER BY `customers`.`city`;
			    
			/*Оператор LIKE*/
/* '%' - любое количество любых символов, '_' - один любой символ*/

SELECT
	`customers`.`cnum`,
	    `customers`.`cname`,
	    `customers`.`city`,
		`customers`.`rating`,
		    `customers`.`snum`
		FROM
			`shop`.`customers`
			WHERE
				cname LIKE '%ул%';
				    
				    /* Применение символов исключения при помощи escape */
    SELECT
	`customers`.`cnum`,
	    `customers`.`cname`,
	    `customers`.`city`,
		`customers`.`rating`,
		    `customers`.`snum`
		FROM
			`shop`.`customers`
			 
			 WHERE  
			    cname LIKE '%ул%\%' escape '/';
			    
