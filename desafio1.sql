DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.planos(
      plano_id INT PRIMARY KEY AUTO_INCREMENT,
      plano VARCHAR(100) NOT NULL,
      valor_plano FLOAT NOT NULL
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.usuarios(
      usuario_id INT PRIMARY KEY AUTO_INCREMENT,
      data_assinatura DATE NOT NULL,
      usuario VARCHAR(100) NOT NULL,
      plano_id INT NOT NULL,
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
      data_reproducao DATE NOT NULL,
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
    ('Pessoal', 6.99),
    ('Universitario', 5.99);
    
  INSERT INTO SpotifyClone.usuarios (data_assinatura, usuario, plano_id)
  VALUES
    ('2020-05-05', 'Gustavo',1),
    ('2020-05-06', 'Gabriel',2),
    ('2020-05-09', 'João',2),
    ('2020-05-11', 'João',2),
    ('2020-05-04', 'Leo',2),
    ('2020-05-03', 'Luis',2),
    ('2020-05-02', 'Filipe',2),
    ('2020-05-01', 'Lorena',2),
    ('2020-05-08', 'Carol',2),
    ('2020-05-07', 'Guilherme',3);
    
  INSERT INTO SpotifyClone.artistas (artista)
  VALUES
    ('Beyoncé'),
    ('Titans'),
    ('Lulu Santos'),
    ('Isa'),
    ('Diogo Nogueira'),
    ('Freddie Mercury');
    
  INSERT INTO SpotifyClone.albuns (album, artista_id)
  VALUES
    ('Renaissance', 1),
    ('Chromatica', 2),
    ('Supervision', 3),
    ('The Long Goodbye', 4),
    ('Róisín Machine', 1),
    ('Future Nostalgia', 2),
    ('After Hours', 3),
    ('Jazz', 4);
    
  INSERT INTO SpotifyClone.cancoes (cancao, duracao_segundos,  albuns_id)
  VALUES
    ('BREAKE MY SOUL', '279', 1),
    ('VIRG`S GROOVE', '369', 2),
    ('ALIEN SUPERSTAR', '300', 3),
    ('Alone Again', '230', 4),
    ('Too Late', '120', 5),
    ('Hardest To Love', '110', 6),
    ('Scared To Live', '132', 7),
    ('Snowchild', '101', 8),
    ('Escape from LA', '403', 1),
    ('Don`t Stop Me Now', '200', 2);
    
  INSERT INTO SpotifyClone.historico (data_reproducao, cancao_id, usuario_id)
  VALUES
    ('2020-05-04', 1,1),
    ('2020-05-04', 1,2),
    ('2020-05-10', 1,3),
    ('2020-05-10', 1,4),
    ('2020-05-10', 2,1),
    ('2020-05-10', 2,2),
    ('2020-05-10', 2,3),
    ('2020-05-10', 2,4),
    ('2020-05-10', 3,1),
    ('2020-05-10', 3,2),
    ('2020-05-10', 3,3),
    ('2020-05-10', 3,4),
    ('2020-05-10', 4,1),
    ('2020-05-10', 4,2),
    ('2020-05-10', 4,3),
    ('2020-05-10', 4,4);
    
  INSERT INTO SpotifyClone.seguindo ( artista_id, usuario_id)
  VALUES
    (1,1),
    (1,2),
    (1,3),
    (1,4),
    (2,1),
    (2,2),
    (2,3),
    (2,4),
    (3,1),
    (3,2),
    (3,3),
    (3,4),
    (4,1),
    (4,4);