SELECT 
    COUNT(DISTINCT music.music_id) AS cancoes,
    COUNT(DISTINCT artist.artist_id) AS artistas,
    COUNT(DISTINCT album.album_id) AS albuns
FROM
    SpotifyClone.music,
    SpotifyClone.artist,
    SpotifyClone.album;