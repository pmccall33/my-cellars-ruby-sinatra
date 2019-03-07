DROP DATABASE IF EXISTS wine_cellar_db;
CREATE DATABASE wine_cellar_db;

\c wine_cellar_db

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  username VARCHAR(32),
  password_digest VARCHAR(60),
  is_admin BOOLEAN DEFAULT FALSE 
);

CREATE TABLE cellars(
	id SERIAL PRIMARY KEY,
	cellar_name VARCHAR(32),
	user_id INTEGER REFERENCES users(id)
);

CREATE TABLE wines(
	id SERIAL PRIMARY KEY,
	wine_name VARCHAR(63),
	winemaker VARCHAR(63),
	wine_region VARCHAR(63),
	wine_varietals VARCHAR(127),
	wine_vintage SMALLINT,
	wine_image_url TEXT,
	wine_link VARCHAR(255),
	wine_notes TEXT
);

CREATE TABLE cellar_wines(
	id SERIAL PRIMARY KEY,
	cellar_id INTEGER REFERENCES cellars(id),
	wine_id INTEGER REFERENCES wines(id)
);

