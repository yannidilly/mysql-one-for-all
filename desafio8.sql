SELECT 
    artist.artist_name AS artista, album.album_name AS album
FROM
    SpotifyClone.artist
        INNER JOIN
    SpotifyClone.album ON artist.artist_id = album.artist_id
WHERE
    artist.artist_name = 'Elis Regina';