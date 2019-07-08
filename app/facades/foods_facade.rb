class FoodsFacade

  def initialize(search_terms, limit)
    @search_term = search_terms
    @limit = limit
  end

  def number_results
    service_results[:list][:total]
  end

  def food_data(limit=10)
    service_results[:list][:item].map do |individual_item|
      Food.new(individual_item)
    end
  end

  private

  def service
    @_service ||= FoodService.new(@search_term, @limit)
  end

  def service_results
    @_service_results ||= service.get_food_data
  end

end
