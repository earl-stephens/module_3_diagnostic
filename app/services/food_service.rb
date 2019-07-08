class FoodService

  def initialize(search_terms, limit)
    @search_term = search_terms
    @limit = limit
  end

  def conn
    Faraday.new('https://api.nal.usda.gov') do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def make_get_request(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_food_data
    url = "/ndb/search/?format=json&q=#{@search_term}&api_key=#{ENV['gov_data_key']}&max=#{@limit}&sort=r"
    make_get_request(url)
  end

end
