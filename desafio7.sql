SELECT 
    artist.artist_name, album.album_name
FROM
    SpotifyClone.artist AS artist
        INNER JOIN
    SpotifyClone.album AS album ON artist.artist_id = album.artist_id;