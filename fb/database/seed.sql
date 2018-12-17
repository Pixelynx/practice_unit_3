DROP DATABASE IF EXISTS fb
CREATE DATABASE fb

\c practice_unit_3;


CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  age INT NOT NULL
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  poster_id INT REFERENCES users(id) ON DELETE CASCADE,
  body TEXT NOT NULL);

CREATE TABLE likes (
  id SERIAL PRIMARY KEY,
  liker_id INT REFERENCES users(id),
  poster_id INT REFERENCES posts(id)
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  commenter_id INT REFERENCES users(id),
  post_id INT REFERENCES posts(id),
  body TEXT NOT NULL
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id)
);

CREATE TABLE pictures (
  id SERIAL PRIMARY KEY,
  album_id INT REFERENCES album(id),
  url VARCHAR NOT NULL
);

INSERT INTO users (name, age) VALUES
  ("Victoria Adams", 47), ("Gerson Lopez", 33);

INSERT INTO posts (poster_id, body) VALUES
  (1, 'Zura ja nai! Katsura da!'), (2, 'Ichigo gyuunyuu~!'),
  (1, 'Rap ja nai. Katsu-rap da, *yo*!');

INSERT INTO likes (user_id, post_id) VALUES
  (1, 2), (2, 1), (2, 3);

INSERT INTO comments (commenter_id, post_id, body) VALUES
  (1, 2, 'ICHIGO GYUUNYUU!'), (2, 1, 'Oi. Zura!'),
  (2, 3, 'Omg ... *facepalm*.');

INSERT INTO albums (user_id) VALUES
  (1), (2);

INSERT INTO pictures (album_id, url) VALUES
  (1, 'https://i.pinimg.com/originals/ae/d7/bc/aed7bcbe347a262f89cc3867cdce54c2.jpg'),
  (2, 'https://i.pinimg.com/originals/11/d2/5d/11d25d3a7720c3a691949f2a74f6aece.jpg');
