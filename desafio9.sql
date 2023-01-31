SELECT 
    COUNT(history.music_id) AS quantidade_musicas_no_historico
FROM
    SpotifyClone.history
        INNER JOIN
    SpotifyClone.user ON user.user_id = history.user_id
WHERE
    user.user_name = 'Barbara Liskov'
GROUP BY user.user_name;