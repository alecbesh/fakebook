
-- Create User Views Table
CREATE VIEW View_User_Information AS
SELECT u.user_id as user_id, u.first_name as first_name, u.last_name as last_name, u.year_of_birth as year_of_birth, u.month_of_birth as month_of_birth, 
u.day_of_birth as day_of_birth, u.gender as gender, c1.city_name as current_city, c1.state_name as current_state, c1.country_name as current_country,
c2.city_name as hometown_city, c2.state_name as hometown_state, c2.country_name as hometown_country, p.institution as institution_name, 
e.program_year as program_year, p.concentration as program_concentration, p.degree as program_degree
FROM Users u
INNER JOIN User_Current_Cities cc ON u.user_id = cc.user_id
INNER JOIN User_Hometown_Cities hc ON u.user_id = hc.user_id
INNER JOIN Cities c1 ON c1.city_id = cc.current_city_id
INNER JOIN Cities c2 ON c2.city_id = hc.hometown_city_id
LEFT JOIN Education e ON u.user_id = e.user_id
LEFT JOIN Programs p ON p.program_id = e.program_id;


-- Create Friends Views Table
CREATE VIEW View_Are_Friends AS
SELECT f.user1_id as user1_id, f.user2_id as user2_id
FROM Friends f;

-- Create Photo Views Table
CREATE VIEW View_Photo_Information AS
SELECT a.album_id as album_id, a.album_owner_id as owner_id, a.cover_photo_id as cover_photo_id, a.album_name as album_name, 
a.album_created_time as album_created_time, a.album_modified_time as album_modified_time, a.album_link as album_link, a.album_visibility as album_visibility, 
p.photo_id as photo_id, p.photo_caption as photo_caption, p.photo_created_time as photo_created_time, p.photo_modified_time as photo_modified_time, 
p.photo_link as photo_link
FROM Albums a, Photos p
WHERE a.album_id = p.album_id;

-- Create Event Views Table
CREATE VIEW View_Event_Information AS
SELECT u.event_id as event_id, u.event_creator_id as event_creator_id, u.event_name as event_name, u.event_tagline as event_tagline, 
u.event_description as event_description, u.event_host as event_host, u.event_type as event_type, u.event_subtype as event_subtype, 
u.event_address as event_address, c.city_name as event_city, c.state_name as event_state, c.country_name as event_country, 
u.event_start_time as event_start_time, u.event_end_time as event_end_time
FROM User_Events u, Cities c
WHERE u.event_city_id = c.city_id;

-- Create Tag Views Table
CREATE VIEW View_Tag_Information AS
SELECT t.tag_photo_id as photo_id, t.tag_subject_id as tag_subject_id, t.tag_created_time as tag_created_time, t.tag_x as tag_x_coordinate, 
t.tag_y as tag_y_coordinate
FROM Tags t;