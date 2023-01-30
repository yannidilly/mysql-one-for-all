SELECT 
    music.music_name AS cancao,
    COUNT(history.music_id) AS reproducoes
FROM
    SpotifyClone.history AS history
        INNER JOIN
    SpotifyClone.music AS music ON history.music_id = music.music_id
GROUP BY history.music_id
ORDER BY reproducoes DESC , cancao
LIMIT 2;