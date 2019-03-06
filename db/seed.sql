INSERT INTO users (username, is_admin) VALUES ('Pedro', 't');

INSERT INTO cellars (cellar_name, user_id) VALUES ('Home Cellar', '1');
INSERT INTO cellars (cellar_name, user_id) VALUES ('Wish List Cellar', '1');

INSERT INTO wines (wine_name, winemaker, wine_region, wine_varietals, wine_vintage, wine_image_url, wine_link, wine_notes)
VALUES ('Neck', 'Sylvain Bock', 'Vallee du Rhone', 'Grenache', '2017', '', '', 'Thumbs way UP for this excellenc Grenache!' );
INSERT INTO wines (wine_name, winemaker, wine_region, wine_varietals, wine_vintage, wine_image_url, wine_link, wine_notes)
VALUES ('Le Repenti Blanc', 'Thibault Stephan', 'Pays de la Loire', 'Chenin Blanc', '2016', '', '', 'Absolutely smiley face for the 2016!' );



-- CREATE TABLE wines(
-- 	id SERIAL PRIMARY KEY,
-- 	wine_name VARCHAR(63),
-- 	winemaker VARCHAR(63),
-- 	wine_region VARCHAR(63),
-- 	wine_varietals VARCHAR(127),
-- 	wine_vintage SMALLINT,
-- 	wine_image_url TEXT,
-- 	wine_link VARCHAR(255),
-- 	wine_notes TEXT
-- );