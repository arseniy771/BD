/* Оператор exists */
/* Подзапросы с оператором exists возвращают логическое значение true или false */
/* При наличии любого не пустого результата, выводимого подзапросом, exists принимает значение true. 
При отсуствии данных, возвращаемых подзапросом, exists принимает значение false */
SELECT 
    cnum, cname, city
FROM
    customers
WHERE
    EXISTS (SELECT 
            *
        FROM
            customers
        WHERE
            city = 'Новосибирск');

/* Примеры использования exists с коррелированными подзапросами */
/* Результатом запроса является информация о покупателях, которых обслуживают продавцы, за которыми закреплены более одного покупателя */
SELECT 
    *
FROM
    customers `outer`
WHERE
    EXISTS( SELECT 
            *
        FROM
            customers `inner`
        WHERE
            `inner`.snum = `outer`.snum
                AND `inner`.cnum <> `outer`.cnum);

/* Комбинирование exists с соединениями */
/* Вывод информации о продавцах, используя результаты предыдущего запроса*/
SELECT DISTINCT
    `first`.snum, sname, `first`.city
FROM
    salespeaple `first`,
    customers `second`
WHERE
    EXISTS( SELECT 
            *
        FROM
            customers `third`
        WHERE
            `second`.snum = `third`.snum
                AND `second`.cnum <> `third`.cnum
                AND `first`.snum = `second`.snum);

/* Использование NOT EXISTS */
/* Для каждого null-значения в поле snum основной запрос выводит отдельную строку в виде результата, так как инвертируется логическое значение, возвращаемое оператором EXISTS */
SELECT 
    *
FROM
    customers `outer`
WHERE
    NOT EXISTS( SELECT 
            *
        FROM
            customers `inner`
        WHERE
            `inner`.snum = `outer`.snum
                AND `inner`.cnum <> `outer`.cnum);

/* Пример сложного подзапроса с EXISTS */
/* Выводим информацию о продавцах, которые обслуживают покупателей с более, чем одним заказом */
SELECT 
    *
FROM
    salespeaple `first`
WHERE
    EXISTS( SELECT 
            *
        FROM
            customers `second`
        WHERE
            `first`.snum = `second`.snum
                AND 1 < (SELECT 
                    COUNT(*)
                FROM
                    sales
                WHERE
                    sales.cnum = `second`.cnum));
                    
/* Специальный оператор ANY (SOME) */
/* Запрос выводит продавцов, живущих с покупателями в одном городе*/
SELECT 
    *
FROM
    salespeaple
WHERE
    city = ANY (SELECT 
            city
        FROM
            customers);			

SELECT 
    *
FROM
    salespeaple
WHERE
    city = SOME (SELECT 
            city
        FROM
            customers);			
            
/* Запросы с операторами IN или EXISTS вместо ANY */
/* Результат эквивалентен результату предыдущего запроса*/
SELECT 
    *
FROM
    salespeaple
WHERE
    city IN (SELECT 
            city
        FROM
            customers);

/* ANY, в отличие от IN, может применяться с неравенствами */
/* Запрос выводит тех продавцов, чьи имена предшествуют именам покупателей в алфавитном порядке */
SELECT 
    *
FROM
    salespeaple
WHERE
    sname < ANY (SELECT 
            cname
        FROM
            customers);
            
/* Эквивалентный предыдущему запрос можно реализовать при помощи EXISTS */
/* Различия в применении ANY и EXISTS в том, что ANY работает в трёхзначной логике, а EXISTS - в двузначной*/
SELECT 
    *
FROM
    salespeaple `outer`
WHERE
    EXISTS( SELECT 
            *
        FROM
            customers `inner`
        WHERE
            `outer`.sname < `inner`.cname);
/* Пример работы ANY с числовыми значениями - отбираются все рейтинги, которые больше минимального, возвращаемого подзапросом*/            
SELECT 
    *
FROM
    customers
WHERE
    rating > ANY (SELECT 
            rating
        FROM
            customers
        WHERE
            city = 'Новосибирск');

/* Отбираем те заказы, которые сделаны на большую сумму, чем хотя бы один из заказов от 15 сентября 2024 */
SELECT 
    *
FROM
    sales
WHERE
    amount > ANY (SELECT 
            amount
        FROM
            sales
        WHERE
            sdate = '2024-09-15');

/* Пример использования ANY с соединениями */
/* Отбираем информацию о заказах на сумму, меньшую, чем любой заказ, сделанный покупателем из Омска */
SELECT 
    *
FROM
    sales
WHERE
    amount < ANY (SELECT 
            amount
        FROM
            sales a,
            customers b
        WHERE
            a.cnum = b.cnum AND b.city = 'Омск');

/* Эквивалентный запрос составляется при помощи агрегатной функции, подзапроса и соединения */
SELECT 
    *
FROM
    sales
WHERE
    amount < (SELECT 
            MAX(amount)
        FROM
            sales a,
            customers b
        WHERE
            a.cnum = b.cnum AND b.city = 'Омск');
            
/* Специальный оператор ALL */
SELECT 
    *
FROM
    customers
WHERE
    rating < ALL (SELECT 
            rating
        FROM
            customers
        WHERE
            city = 'Санкт-Петербург');
            
/* Аналогичный предыдущему запрос с использованием EXISTS. Этот запрос работает с null-значениями */
SELECT 
    *
FROM
    customers `outer`
WHERE
    NOT EXISTS( SELECT 
            *
        FROM
            customers `inner`
        WHERE
            `outer`.rating >= `inner`.rating
                AND `inner`.city = 'Санкт-Петербург');
