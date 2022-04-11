-- CREATE USERS --
CREATE USER itdocadm WITH PASSWORD 'postgres';
CREATE USER itdocweb WITH PASSWORD 'postgres';

-- CREATE DATABASE --
CREATE DATABASE itdoc;

-- SELECT DATABASE --
\c itdoc

-- CREATE EXTENSION --
CREATE EXTENSION pgcrypto;

-- CREATE SCHEMA --
CREATE SCHEMA itdoc;

-- GRANT USER --
GRANT ALL ON DATABASE itdoc TO itdocadm;
GRANT ALL ON SCHEMA itdoc TO itdocadm;


-- SET DEFAULT SCHEMA --
SET itdocadm TO itdoc;


	
-- CREATE tutorials TABLE --
	CREATE TABLE cocoapp.words
(
	word_id SERIAL NOT NULL,
	name text NOT NULL,
	category_name varchar(255) NOT NULL,
	author varchar(255) NOT NULL,
	description text NOT NULL,
	image_name varchar(255),
	like_count integer NOT NULL,
	CONSTRAINT pk_tutorials PRIMARY KEY (tutorial_id),
	CONSTRAINT fk_tutorials_categories FOREIGN KEY(category_name) REFERENCES cocoapp.categories(name)
	);

	
-- CREATE posts TABLE --
	CREATE TABLE cocoapp.words
	(
	post_id SERIAL NOT NULL,
	position integer NOT NULL,
	page_id integer NOT NULL,
	title text NOT NULL,
	content text NOT NULL,
	creation_date timestamp NOT NULL,
	update_date timestamp NOT NULL,
	CONSTRAINT pk_posts PRIMARY KEY (post_id),
	CONSTRAINT fk_posts_pages FOREIGN KEY(page_id) REFERENCES cocoapp.pages(page_id)
	);
	
-- CREATE dictionnaries TABLE --
	CREATE TABLE cocoapp.dictionnaries
	(
	word varchar(255) NOT NULL UNIQUE,
	description text NOT NULL,
	used integer NOT NULL,
	CONSTRAINT pk_dictionnaries PRIMARY KEY (word)
	);
	
	
	
-- GRANT cocoadm -- 
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA cocoapp TO cocoadm;	
GRANT SELECT, UPDATE, USAGE ON ALL SEQUENCES IN SCHEMA cocoapp to cocoadm;

-- GRANT cocoweb --
GRANT SELECT, UPDATE, INSERT , DELETE ON TABLE comments TO cocoweb;
GRANT SELECT, UPDATE, USAGE ON "comments_comment_id_seq" TO cocoweb;

GRANT SELECT, UPDATE, INSERT , DELETE ON TABLE tutorials TO cocoweb;
GRANT SELECT, UPDATE, USAGE ON "tutorials_tutorial_id_seq" TO cocoweb;

GRANT SELECT, UPDATE, INSERT , DELETE ON TABLE pages TO cocoweb;
GRANT SELECT, UPDATE, USAGE ON "pages_page_id_seq" TO cocoweb;

GRANT SELECT, UPDATE, INSERT , DELETE ON TABLE posts TO cocoweb;
GRANT SELECT, UPDATE, USAGE ON "posts_post_id_seq" TO cocoweb;

GRANT SELECT, UPDATE, INSERT , DELETE ON TABLE categories TO cocoweb;
GRANT SELECT, UPDATE, INSERT , DELETE ON TABLE dictionnaries TO cocoweb;
