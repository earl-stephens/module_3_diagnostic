require "rails_helper"

describe FoodService do
  it 'gets data' do
    search_term = 'sweet potatoes'
    service = FoodService.new(search_term)

    results = service.get_food_data

    expect(results).to be_a Hash
    expect(results).to have_key(:list)
    expect(results[:list]).to have_key(:total)
    expect(results[:list][:item][0][:ds]).to eq('LI')
  end
end
