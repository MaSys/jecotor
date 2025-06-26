require 'dotenv'
require 'httparty'
require 'json'

Dotenv.load

require_relative 'jelly.rb'
require_relative 'tmdb.rb'


collections_hash = {}
index = 0
movies = Jelly.get_movies(index)
while movies.count > 0
  movies.each do |movie|
    collection_id = movie["ProviderIds"]["TmdbCollection"]
    next if collection_id.nil?

    collections_hash[collection_id] ||= []
    collections_hash[collection_id] << movie
  end
  index += 20
  movies = Jelly.get_movies(index)
end

# jelly_collections = get_collections
collections_hash.each do |collection_id, group|
  next if group.size < 3

  collection = Tmdb.get_collection(collection_id)
  next unless collection

  ids = group.map { |row| row["Id"] }
  Jelly.create_collection({ name: collection["name"], ids: ids.join(",") })["Id"]
end
