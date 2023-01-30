SELECT
	user.user_name AS usuario,
	COUNT(history.music_id) AS qt_de_musicas_ouvidas,
    ROUND(SUM(music.duration) / 60, 2) AS total_minutos
FROM SpotifyClone.history AS history
INNER JOIN SpotifyClone.user AS user
	ON history.user_id = user.user_id
INNER JOIN SpotifyClone.music AS music
	ON history.music_id = music.music_id
GROUP BY user.user_name ORDER BY user.user_name;