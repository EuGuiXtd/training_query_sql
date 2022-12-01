SELECT 
c.cancao AS nome, 
COUNT(h.cancao_id) AS reproducoes
FROM SpotifyClone.cancoes AS c
INNER JOIN SpotifyClone.historico AS h ON c.cancao_id = h.cancao_id
WHERE h.usuario_id = 1 OR h.usuario_id = 2 OR h.usuario_id = 8 OR h.usuario_id = 9 OR h.usuario_id = 10
GROUP BY nome
ORDER BY nome;