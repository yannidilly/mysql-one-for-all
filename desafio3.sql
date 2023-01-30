SELECT
	user.user_name AS usuario,
	COUNT(history.music_id) AS qt_de_musicas_ouvidas
FROM SpotifyClone.history AS history
INNER JOIN SpotifyClone.user AS user
	ON history.user_id = user.user_id
GROUP BY user.user_name;