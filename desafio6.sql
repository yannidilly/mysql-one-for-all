SELECT 
    MIN(price) AS faturamento_minimo,
    MAX(price) AS faturamento_maximo,
    ROUND(AVG(plan.price), 2) AS faturamento_medio,
    ROUND(SUM(plan.price), 2) AS faturamento_total
FROM
    SpotifyClone.plan
        INNER JOIN
    SpotifyClone.user AS user ON user.plan_id = plan.plan_id;
