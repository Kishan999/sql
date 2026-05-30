select track_id , count(playlist_id) as total_playlist from (
select playlists.playlist_id , playlist_name , track_id from playlists join playlist_tracks on playlist_tracks.playlist_id = playlists.playlist_id
where playlists.playlist_id in (
select playlist_id from playlist_plays group by playlist_id
having count(distinct user_id) >= 2)) inn_qry
group by track_id
order by total_playlist desc , track_id desc 
limit 2