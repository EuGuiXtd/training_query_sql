SELECT 
al.album AS album, 
artista AS artista 
FROM  SpotifyClone.albuns AS al
INNER JOIN SpotifyClone.artistas AS a ON al.artista_id = a.artista_id
WHERE al.artista_id = 3;