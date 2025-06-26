module Tmdb
  TMDB_BASE_URL = ENV.fetch("TMDB_BASE_URL")
  TMDB_API_KEY = ENV.fetch("TMDB_API_KEY")

  def self.get_collection(id)
    res = HTTParty.get(
      "#{TMDB_BASE_URL}/collection/#{id}?language=en-US",
      headers: {
        Authorization: "Bearer #{TMDB_API_KEY}"
      }
    )
    res.parsed_response
  end

  def self.get_movie(id)
    res = HTTParty.get(
      "#{TMDB_BASE_URL}/movie/#{id}",
      headers: {
        Authorization: "Bearer #{TMDB_API_KEY}"
      }
    )
    res.parsed_response
  end
end
