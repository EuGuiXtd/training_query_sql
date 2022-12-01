SELECT
    u.usuario AS usuario,
    IF(MAX(YEAR(data_reproducao)) >= '2021', 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM
    SpotifyClone.historico AS h
    INNER JOIN SpotifyClone.usuarios AS u ON h.usuario_id = u.usuario_id
GROUP BY u.usuario_id
ORDER BY u.usuario;