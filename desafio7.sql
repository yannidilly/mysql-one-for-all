SELECT 
    artist.artist_name AS artista,
    album.album_name AS album,
    COUNT(follow.user_id) AS seguidores
FROM
    SpotifyClone.artist AS artist
        INNER JOIN
    SpotifyClone.album AS album ON artist.artist_id = album.artist_id
        INNER JOIN
    SpotifyClone.follow AS follow ON follow.artist_id = artist.artist_id
GROUP BY album , artista
ORDER BY seguidores DESC, artista, album;