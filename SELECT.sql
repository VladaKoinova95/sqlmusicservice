--Название и продолжительность самого длительного трека
select name, duration 
from tracks
where duration = (select max(duration) from tracks)

--Название треков, продолжительность которых не менее 3,5 минут
select name
from tracks
where duration >= 3.5 * 60

--Названия сборников, вышедших в период с 2018 по 2020 год включительно
select name
from compilations
where year between 2018 and 2020

--Исполнители, чьё имя состоит из одного слова
select name
from artists
where trim(name) not like '% %';

--Название треков, которые содержат слово «мой» или «my»
select name
from tracks
where name ilike '%my%' or name ilike '%мой%';

--Количество исполнителей в каждом жанре
select name, count(*) 
from genres g
left join genreartist ga on g.genre_id = ga.genre_id
group by name;

--Количество треков, вошедших в альбомы 2019–2020 годов
select count(*)  
from tracks t
left join albums a on t.album_id = a.album_id
where year between 2019 and 2020;

--Средняя продолжительность треков по каждому альбому
select a.name, avg(duration)
from albums a
left join tracks t on a.album_id = t.album_id
group by a.name;

--Все исполнители, которые не выпустили альбомы в 2020 году
select distinct name from artists
where name not in (select a.name
from artists a
left join albumartist a2 on a.artist_id = a2.artist_id
left join albums a3 on a2.album_id = a3.album_id
where year = 2020);


--Названия сборников, в которых присутствует конкретный исполнитель (Мадонна)
select c.name
from compilations c
left join compilationtrack c2 on c.compilation_id = c2.compilation_id
left join tracks t on c2.track_id = t.track_id
left join albums a on t.album_id = a.album_id
left join albumartist a2 ON a.album_id = a2.album_id
left join artists a3 on a2.artist_id = a3.artist_id
where a3.name = 'Мадонна';
