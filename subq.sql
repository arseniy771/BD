ELECT 
    *
FROM
    sales
WHERE
    snum = (SELECT 
	            snum
		        FROM
			            salespeaple
				        WHERE
					            sname = 'Саша');
					         
					         
					         /*если подзапрос может верноть несколько значений, 
         то возамоно использование оператора in во внешнем запросе*/
      SELECT 
    *
FROM
    sales
WHERE
    snum in (SELECT 
	            snum
		        FROM
			            salespeaple
				        WHERE
					            sname = 'Саша');      
					            
					            
					            SELECT 
						    *
						FROM
						    sales
						WHERE
						    snum IN (SELECT 
							            snum
								        FROM
									            salespeaple
										        WHERE
											            city = 'Новосибирск');

											/*Список продаж покупателей с номером "201"*/

SELECT 
    amount, sdate, salespeaple.snum, salespeaple.sname
FROM
    sales natural join salespeaple
WHERE
    snum IN (SELECT 
	            snum
		        FROM
			            sales
				        WHERE
					            cnum = '201');

					/*Комиссионные продавцов, обслуживающие покупателей из "Санкт-Петербург"*/

SELECT 
    comm
FROM
    salespeaple
WHERE
    snum IN (SELECT 
	            snum
		        FROM
			            customers
				        WHERE
					            city = 'Санкт-Петербург');
					            
					/*Использование агрегатных функций в подзапросах*/

SELECT 
    *
FROM
    sales
WHERE
    amount > (SELECT 
	            AVG(amount)
		        FROM
			            sales
				        WHERE
					            sdate = '2024-09-12');


					SELECT 
					    *
					FROM
					    sales
					WHERE
					    amount > (SELECT 
						            500+AVG(amount)
							        FROM
								            sales
									        WHERE
										            sdate = '2024-09-12' and sdate < '2024-09-12' + interval 15 day);










									
