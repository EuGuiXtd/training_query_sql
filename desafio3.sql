SELECT
    usuario.usuario AS usuario,
    COUNT(h.cancao_id) AS qt_de_musicas_ouvidas,
    ROUND(
        SUM(cancao.duracao_segundos / 60),
        2
    ) AS total_minutos
FROM
    SpotifyClone.historico AS h
    INNER JOIN SpotifyClone.usuarios AS usuario ON h.usuario_id = usuario.usuario_id
    INNER JOIN SpotifyClone.cancoes AS cancao ON h.cancao_id = cancao.cancao_id
GROUP BY usuario.usuario_id
ORDER BY usuario.usuario;