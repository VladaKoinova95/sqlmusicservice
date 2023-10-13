-- Создание таблицы жанров
CREATE TABLE IF NOT EXISTS Genres (
	genre_id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

-- Создание таблицы исполнителей
CREATE TABLE IF NOT EXISTS Artists (
	artist_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

-- Создание таблицы альбомов
CREATE TABLE IF NOT EXISTS Albums (
 	album_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	year INT
);

-- Создание таблицы треков
CREATE TABLE IF NOT EXISTS Tracks (
	track_id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES Albums(album_id),
	name VARCHAR(100) NOT NULL,
	duration INT
);

-- Создание таблицы сборников
CREATE TABLE IF NOT EXISTS Compilations (
	compilation_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	year INT
);

CREATE TABLE IF NOT EXISTS GenreArtist (
	genre_id INTEGER REFERENCES Genres(genre_id),
	artist_id INTEGER REFERENCES Artists(artist_id),
	CONSTRAINT pk_GenreArtist PRIMARY KEY (genre_id, artist_id)
);

CREATE TABLE IF NOT EXISTS AlbumArtist (
	album_id INTEGER REFERENCES Albums(album_id),
	artist_id INTEGER REFERENCES Artists(artist_id),
	CONSTRAINT pk_AlbumArtist PRIMARY KEY (album_id, artist_id)
);

CREATE TABLE IF NOT EXISTS CompilationTrack (
	compilation_id INTEGER REFERENCES Compilations(compilation_id),
	track_id INTEGER REFERENCES Tracks(track_id),
	CONSTRAINT pk_CompilationTrack PRIMARY KEY (compilation_id, track_id)
);