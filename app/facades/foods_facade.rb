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

  def food_data(limit=10)
    conn = Faraday.new('https://api.nal.usda.gov') do |f|
      f.adapter Faraday.default_adapter
    end
    response = conn.get("/ndb/search/?format=json&q=sweet potatoes&api_key=#{ENV['gov_data_key']}&max=#{limit}")
    results = JSON.parse(response.body, symbolize_names: true)
    # binding.pry
    results[:list][:item].map do |individual_item|
      Food.new(individual_item)
    end
  end

end
