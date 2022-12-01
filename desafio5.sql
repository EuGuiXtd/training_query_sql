SELECT 
COUNT(h.cancao_id) AS reproducoes,
c.cancao AS cancao
FROM SpotifyClone.historico AS h
INNER JOIN SpotifyClone.cancoes AS c ON h.cancao_id = c.cancao_id
group by h.cancao_id
ORDER BY reproducoes DESC, c.cancao ASC
LIMIT 2;