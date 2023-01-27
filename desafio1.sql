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
    artist_id INT PRIMARY KEY,
    user_id INT PRIMARY KEY,
    FOREIGN KEY (artist_id) REFERENCES artist (artist_id),
    FOREIGN KEY (user_id) REFERENCES user (user_id),
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.album(
    album_id INT PRIMARY KEY auto_increment,
    album_name VARCHAR(45) NOT NULL,
    artist_id INT NOT NULL,
    release_year YEAR(4) NOT NULL,
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

  INSERT INTO SpotifyClone.tabela1 (coluna1, coluna2)
  VALUES
    ('exemplo de dados 1', 'exemplo de dados A'),
    ('exemplo de dados 2', 'exemplo de dados B'),
    ('exemplo de dados 3', 'exemplo de dados C');

  INSERT INTO SpotifyClone.tabela2 (coluna1, coluna2)
  VALUES
    ('exemplo de dados 1', 'exemplo de dados X'),
    ('exemplo de dados 2', 'exemplo de dados Y');