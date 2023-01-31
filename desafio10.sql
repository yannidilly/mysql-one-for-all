SELECT 
    music.music_name AS nome, COUNT(plan.plan_name)
FROM
    SpotifyClone.history AS history
        INNER JOIN
    SpotifyClone.music AS music ON music.music_id = history.music_id
        INNER JOIN
    SpotifyClone.user AS user ON history.user_id = user.user_id
        INNER JOIN
    SpotifyClone.plan AS plan ON user.plan_id = plan.plan_id
WHERE
    (plan.plan_name = 'gratuito'
        OR plan.plan_name = 'pessoal')
GROUP BY nome
ORDER BY nome;