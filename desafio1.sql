DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.planos(
      plano_id INT PRIMARY KEY AUTO_INCREMENT,
      plano VARCHAR(100) NOT NULL,
      valor_plano DECIMAL(6,2)
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.usuarios(
      usuario_id INT PRIMARY KEY AUTO_INCREMENT,
      data_assinatura DATE NOT NULL,
      usuario VARCHAR(100) NOT NULL,
      plano_id INT NOT NULL,
      idade INT NOT NULL,
      foreign key (plano_id) references planos(plano_id)
  ) engine = InnoDB;
  
    CREATE TABLE SpotifyClone.artistas(
      artista_id INT  PRIMARY KEY AUTO_INCREMENT,
      artista VARCHAR(100) NOT NULL
  ) engine = InnoDB;
  
      CREATE TABLE SpotifyClone.albuns(
      albuns_id INT  PRIMARY KEY AUTO_INCREMENT,
      album VARCHAR(100) NOT NULL,
      artista_id INT NOT NULL,
      ano_lancamento INT NOT NULL,
      foreign key (artista_id) references artistas(artista_id)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.cancoes(
      cancao_id INT  PRIMARY KEY AUTO_INCREMENT,
      cancao VARCHAR(100) NOT NULL,
      duracao_segundos INT NOT NULL,
      albuns_id INT NOT NULL,
      foreign key (albuns_id) references albuns(albuns_id)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.historico(
      data_reproducao DATETIME NOT NULL,
      cancao_id INT NOT NULL,
      usuario_id INT NOT NULL,
      PRIMARY KEY(cancao_id,usuario_id),
      foreign key (cancao_id) references cancoes(cancao_id),
      foreign key (usuario_id) references usuarios(usuario_id)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.seguindo(
      artista_id INT NOT NULL,
      usuario_id INT NOT NULL,
       PRIMARY KEY(artista_id,usuario_id),
       foreign key (artista_id) references artistas(artista_id),
       foreign key (usuario_id) references usuarios(usuario_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.planos (plano, valor_plano)
  VALUES
    ('Gratuito', 0.00),
    ('Familiar', 7.99),
    ('Universitario', 5.99),
    ('Pessoal', 6.99);
    
  INSERT INTO SpotifyClone.usuarios (data_assinatura, usuario, plano_id, idade)
  VALUES
    ('2019-10-20', 'Barbara Liskov',1, 82),
    ('2017-01-06', 'Robert Cecil Martin',1, 58),
    ('2017-12-30', 'Ada Lovelace',2, 37),
    ('2017-01-17', 'Martin Fowler',2, 46),
    ('2018-04-29', 'Sandi Metz',2, 58),
    ('2018-02-14', 'Paulo Freire',3, 19),
    ('2018-01-05', 'Bell Hooks',3, 26),
    ('2019-06-05', 'Christopher Alexander',4, 85),
    ('2020-05-13', 'Judith Butler',4, 45),
    ('2017-02-17', 'Jorge Amado',4, 58);
    
  INSERT INTO SpotifyClone.artistas (artista)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');
    
  INSERT INTO SpotifyClone.albuns (album, artista_id, ano_lancamento)
  VALUES
    ('Renaissance', 1, 2022),
    ('Jazz', 2, 1978),
    ('Hot Space', 2, 1982),
    ('Falso Brilhante', 3, 1998),
    ('Vento de Maio', 3, 2001),
    ('QVVJFA?', 4, '2003'),
    ('Somewhere Far Beyond', 5, 2007),
    ('I Put A Spell On You', 6, 2012);
    
  INSERT INTO SpotifyClone.cancoes (cancao, duracao_segundos,  albuns_id)
  VALUES
    ('BREAKE MY SOUL', '279', 1),
    ('VIRG`S GROOVE', '369', 1),
    ('ALIEN SUPERSTAR', '116', 1),
    ('Don`t Stop Me Now', '203', 2),
    ('Under Pressure', '152', 3),
    ('Como Nossos Pais', '105', 4),
    ('O Medo de Amar é o Medo de Ser Livre', '207', 5),
    ('Samba em Paris', '267', 6),
    ('The Bard`s Song', '244', 7),
    ('Feeling Good', '100', 8);
    
  INSERT INTO SpotifyClone.historico (data_reproducao, cancao_id, usuario_id)
  VALUES
    ('2022-02-28 10:45:55', 8,1),
    ('2020-05-02 05:30:35', 2,1),
    ('2020-03-06 11:22:33', 10,1),
    ('2022-08-05 08:05:17', 10,2),
    ('2020-01-02 07:40:33', 7,2),
    ('2020-11-13 16:55:13', 10,3),
    ('2020-12-05 18:38:30', 2,3),
    ('2021-08-15 17:10:10', 8,4),
    ('2022-01-09 01:44:33', 8,5),
    ('2020-08-06 15:23:43', 5,5),
    ('2017-01-24 00:31:17', 7,6),
    ('2017-10-12 12:35:20', 1,6),
    ('2011-12-15 22:30:49', 4,7),
    ('2012-03-17 14:56:41', 4,8),
    ('2022-02-24 21:14:22', 9,9),
    ('2015-12-13 08:30:22', 3,10);
    
  INSERT INTO SpotifyClone.seguindo ( artista_id, usuario_id)
  VALUES
    (1,1),
    (2,1),
    (3,1),
    (1,2),
    (3,2),
    (2,3),
    (4,4),
    (5,5),
    (6,5),
    (6,6),
    (1,6),
    (6,7),
    (3,9),
    (2,10);