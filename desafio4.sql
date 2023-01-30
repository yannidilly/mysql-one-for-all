SELECT 
    user.user_name AS usuario,
    IF(history.played_date >= '2021-01-01 00:00:00.000001',
        'Usuário ativo',
        'Usuário inativo') AS status_usuario
FROM
    SpotifyClone.history AS history
        INNER JOIN
    SpotifyClone.user AS user ON history.user_id = user.user_id;