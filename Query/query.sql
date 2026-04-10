# PER CLIENTE

SELECT 
    c.customerNumber,
    c.customerName,
    AVG(DATEDIFF(o.shippedDate, o.orderDate)) AS tempo_medio_consegna_giorni
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
WHERE o.shippedDate IS NOT NULL
GROUP BY c.customerNumber, c.customerName
order by tempo_medio_consegna_giorni DESC
LIMIT 5;

# PER VENDITORE

SELECT 
    e.employeeNumber,
    CONCAT(e.firstName, ' ', e.lastName) AS venditore,
    AVG(DATEDIFF(o.shippedDate, o.orderDate)) AS tempo_medio_consegna_giorni
FROM employees e
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders o ON c.customerNumber = o.customerNumber
WHERE o.shippedDate IS NOT NULL
GROUP BY e.employeeNumber, venditore
order by tempo_medio_consegna_giorni DESC
LIMIT 5;

# PER PRODOTTO

SELECT 
    p.productCode,
    p.productName,
    AVG(DATEDIFF(o.shippedDate, o.orderDate)) AS tempo_medio_consegna_giorni
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
JOIN orders o ON od.orderNumber = o.orderNumber
WHERE o.shippedDate IS NOT NULL
GROUP BY p.productCode, p.productName
order by tempo_medio_consegna_giorni desc
limit 5;