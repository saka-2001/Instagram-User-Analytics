SELECT * FROM users ORDER BY created_at LIMIT 5;

select id, username from users where id not in (select user_id from photos);

select users.id, users.username, likes.photo_id, photos.image_url, count(likes.user_id) as max_likes from photos 
join users on photos.user_id = users.id
join likes on likes.photo_id = photos.id
group by photo_id
order by max_likes desc 
limit 1;

SELECT tags.tag_name, COUNT(tags.id) as max_tagname from tags
inner join photo_tags on photo_tags.tag_id = tags.id
group by tags.id
order by max_tagname desc
limit 5;

SELECT COUNT(id), dayname(created_at) as creation_day
FROM users
GROUP BY creation_day
order by Count(id) desc;
select count(photos.id) as `AVG POSTS PER USER`, username from users inner join 
photos on photos.user_id = users.id
group by users.id;

SELECT
  (SELECT COUNT(*) FROM photos) AS photo_count,
  (SELECT COUNT(*) FROM users) AS user_count,
  (SELECT round((photo_count / user_count),2)) AS AVG_TOTAL_PHOTOS;
select username, count(*) as `likes_count`
from likes
join users on users.id = likes.user_id
group by user_id
having likes_count = (select count(*) from photos);



