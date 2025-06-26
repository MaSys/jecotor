module Jelly
  JELLY_BASE_URL = ENV.fetch("JELLY_BASE_URL")
  JELLY_API_KEY = ENV.fetch("JELLY_API_KEY")
  JELLY_USER_ID = ENV.fetch("JELLY_USER_ID")

  def self.get_collections
    res = HTTParty.get(
      "#{JELLY_BASE_URL}/Users/#{JELLY_USER_ID}/Items",
      query: {
        IncludeItemTypes: "BoxSet",
        Recursive: true
      },
      headers: {
        "X-Emby-Token": JELLY_API_KEY
      }
    )
    res.parsed_response
  end

  def self.create_collection(params)
    res = HTTParty.post(
      "#{JELLY_BASE_URL}/Collections",
      query: params,
      headers: {
        "X-Emby-Token": JELLY_API_KEY
      }
    )
    res.parsed_response
  end

  def self.add_items_to_collection(collection_id, item_ids)
    res = HTTParty.post(
      "#{JELLY_BASE_URL}/Collections/#{collection_id}/Items",
      query: {
        ids: item_ids
      },
      headers: {
        "X-Emby-Token": JELLY_API_KEY
      }
    )
    res.parsed_response
  end

  # Get list of movies
  def self.get_movies(index = 0)
    res = HTTParty.get(
      "#{JELLY_BASE_URL}/Items",
      query: {
        recursive: true,
        limit: 20,
        startIndex: index,
        fields: "ProviderIds"
      },
      headers: {
        "X-Emby-Token": JELLY_API_KEY
      }
    )
    res.parsed_response["Items"]
  end
end
