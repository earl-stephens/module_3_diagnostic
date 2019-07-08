class FoodService

  def initialize(search_terms)
    @search_term = search_terms
  end

  def conn
    Faraday.new('https://api.nal.usda.gov') do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def get_food_data(limit=10)
    response = conn.get("/ndb/search/?format=json&q=#{@search_term}&api_key=#{ENV['gov_data_key']}&max=#{limit}")
    JSON.parse(response.body, symbolize_names: true)
  end

end
