# Jecotor
Jellyfin Collection Creator

This script will get all your movies, group them by `TheMovieDb Box Set Id` field, for each Collection that has 3 or more movies will create a collection in Jellyfin and add them.

## Installation
You need Ruby version `3.3.0`
```
$ bundle install
```

Copy `.env.example` to `.env`
```
$ cp .env.example .env
```

- You will need an API Key and User ID (optional) from Jellyfin
- You will need to create [themoviedb.com](https://www.themoviedb.org) account, and get an API Key from your account.
- Set ENV Variables in `.env` file.

After setting up everything, now you can run the script.
```
$ ruby app.rb
```
