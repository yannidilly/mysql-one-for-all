DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.plan(
      plan_id INT PRIMARY KEY auto_increment,
      plan_name VARCHAR(45) NOT NULL,
      price INT NOT NULL,
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.user(
      user_id INT PRIMARY KEY auto_increment,
      user_name VARCHAR(45) NOT NULL,
      age INT NOT NULL,
      plan_id INT NOT NULL,
      FOREIGN KEY (plan_id) REFERENCES plan (plan_id),
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artist(
    artist_id INT PRIMARY KEY auto_increment,
    artist_name VARCHAR(45) NOT NULL,
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.follow(
    user_id INT PRIMARY KEY,
    artist_id INT PRIMARY KEY,
    FOREIGN KEY (user_id) REFERENCES user (user_id),
    FOREIGN KEY (artist_id) REFERENCES artist (artist_id),
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.album(
    album_id INT PRIMARY KEY auto_increment,
    album_name VARCHAR(45) NOT NULL,
    release_year YEAR(4) NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artist (artist_id),
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.music(
    music_id INT PRIMARY KEY auto_increment,
    music_name VARCHAR(45) NOT NULL,
    duration INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES album (album_id),
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.history(
    user_id INT PRIMARY KEY,
    music_id INT PRIMARY KEY,
    played_date DATETIME(19),
    FOREIGN KEY (user_id) REFERENCES user (user_id),
    FOREIGN KEY (music_id) REFERENCES music (music_id),
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.plan (plan_id, plan_name, price)
  VALUES
    (1, 'gratuito', 0.00),
    (2, 'pessoal', 6.99);
    (3, 'familiar', 7.99),
    (4, 'universitário', 5.99),

  INSERT INTO SpotifyClone.user (user_id, user_name, age, plan_id)
  VALUES
    (1, 'Barbara Liskov', 82, 1),
    (2, 'Robert Cecil Martin', 58, 1),
    (3, 'Ada Lovelace', 37, 3),
    (4, 'Martin Fowler', 46, 3),
    (5, 'Sandi Metz', 58, 3),
    (6, 'Paulo Freire', 19, 4),
    (7, 'Bell Hooks', 26, 4),
    (8, 'Christopher Alexander', 85, 2),
    (9, 'Judith Butler', 45, 2),
    (10, 'Jorge Amado', 58, 2);

INSERT INTO SpotifyClone.artist (artist_id, artist_name)
VALUES
  (1, 'Beyoncé'),
  (2, 'Queen'),
  (3, 'Elis Regina'),
  (4, 'Baco Exu do Blues'),
  (5, 'Blind Guardian'),
  (6, 'Nina Simone');

INSERT INTO SpotifyClone.follow (user_id, artist_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (10, 2);

INSERT INTO SpotifyClone.album (album_id, album_name, release_year, artist_id)
VALUES
  (1, 'Renaissance', 2022, 1),
  (2, 'Jazz', 1978, 2),
  (3, 'Hot Space', 1982, 2),
  (4, 'Falso Brilhante', 1998, 3),
  (5, 'Vento de Maio', 2001, 3),
  (6, 'QVVJFA?', 2003, 4),
  (7, 'Somewhere Far Beyond', 2007, 5),
  (8, 'I Put A Spell On You', 2012, 6);
