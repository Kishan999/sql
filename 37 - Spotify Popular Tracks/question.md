# Spotify Popular Tracks

Suppose you are a data analyst working for Spotify (a music streaming service company). Your company is interested in analyzing user engagement with playlists and wants to identify the most popular tracks among all the playlists.

## Task

Write an SQL query to find the **top 2 most popular tracks** based on the number of playlists they are part of.

### Requirements

- Return the top 2 `track_id` values and the total number of playlists each track appears in.
- Sort by playlist count **descending**, then by `track_id` **descending**.
- Consider only playlists that were played by **at least 2 distinct users**.

## Schema

### `playlists`

| Column          | Type         |
|-----------------|--------------|
| `playlist_id`   | int          |
| `playlist_name` | varchar(15)  |

### `playlist_tracks`

| Column        | Type |
|---------------|------|
| `playlist_id` | int  |
| `track_id`    | int  |

### `playlist_plays`

| Column        | Type        |
|---------------|-------------|
| `playlist_id` | int         |
| `user_id`     | varchar(2)  |
