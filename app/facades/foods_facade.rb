class FoodsFacade

  def initialize(search_terms)
    @search_term = search_terms
  end

  def number_results
    conn = Faraday.new('https://api.nal.usda.gov') do |f|
      f.adapter Faraday.default_adapter
    end
    response = conn.get("/ndb/search/?format=json&q=sweet potatoes&api_key=#{ENV['gov_data_key']}")
    results = JSON.parse(response.body, symbolize_names: true)
    results[:list][:total]
  end

end
