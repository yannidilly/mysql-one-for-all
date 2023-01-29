DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plan(
    plan_id INT PRIMARY KEY auto_increment,
    plan_name VARCHAR(45) NOT NULL,
    price INT NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.user(
    user_id INT PRIMARY KEY auto_increment,
    user_name VARCHAR(45) NOT NULL,
    age INT NOT NULL,
    plan_id INT NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES plan (plan_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artist(
    artist_id INT PRIMARY KEY auto_increment,
    artist_name VARCHAR(45) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.follow(
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (user_id, artist_id),
    FOREIGN KEY (user_id) REFERENCES user (user_id),
    FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.album(
    album_id INT PRIMARY KEY auto_increment,
    album_name VARCHAR(45) NOT NULL,
    release_year YEAR(4) NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.music(
    album_id INT NOT NULL,
    music_id INT PRIMARY KEY auto_increment,
    music_name VARCHAR(45) NOT NULL,
    duration INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES album (album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.history(
    user_id INT NOT NULL,
    music_id INT NOT NULL,
    played_date DATETIME(6),
    CONSTRAINT PRIMARY KEY (user_id, music_id),
    FOREIGN KEY (user_id) REFERENCES user (user_id),
    FOREIGN KEY (music_id) REFERENCES music (music_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.plan (plan_id, plan_name, price)
VALUES
  (1, 'gratuito', 0.00),
  (2, 'pessoal', 6.99),
  (3, 'familiar', 7.99),
  (4, 'universitário', 5.99);

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

INSERT INTO SpotifyClone.music (album_id, music_id, music_name, duration)
VALUES
  (1, 1, 'BREAK MY SOUL', 279),
  (1, 2, 'VIRGO’S GROOVE', 369),
  (1, 3, 'ALIEN SUPERSTAR', 116),
  (2, 4, 'Don’t Stop Me Now', 203),
  (3, 5, 'Under Pressure', 152),
  (4, 6, 'Como Nossos Pais', 105),
  (5, 7, 'O Medo de Amar é o Medo de Ser Livre', 207),
  (6, 8, 'Samba em Paris', 267),
  (7, 9, 'The Bard’s Song', 244),
  (8, 10, 'Feeling Good', 100);

INSERT INTO SpotifyClone.history (user_id, music_id, played_date)
VALUES
  (1, 8, "2022-02-28 10:45:55"),
  (1, 2, "2020-05-02 05:30:35"),
  (1, 10, "2020-03-06 11:22:33"),
  (2, 10, "2022-08-05 08:05:17"),
  (2, 7, "2020-01-02 07:40:33"),
  (3, 10, "2020-11-13 16:55:13"),
  (3, 2, "2020-12-05 18:38:30"),
  (4, 8, "2021-08-15 17:10:10"),
  (5, 8, "2022-01-09 01:44:33"),
  (5, 5, "2020-08-06 15:23:43"),
  (6, 7, "2017-01-24 00:31:17"),
  (6, 1, "2017-10-12 12:35:20"),
  (7, 4, "2011-12-15 22:30:49"),
  (8, 4, "2012-03-17 14:56:41"),
  (9, 9, "2022-02-24 21:14:22"),
  (10, 3, "2015-12-13 08:30:22");