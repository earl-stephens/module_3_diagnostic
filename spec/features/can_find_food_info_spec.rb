require "rails_helper"

describe 'a user can find info' do
  it 'about a specific food' do
    VCR.use_cassette("feature_test") do
      # As a user,
      visit '/'
      # When I visit "/"
      fill_in 'q', with: 'sweet potatoes'
      # And I fill in the search form with "sweet potatoes"
      # (Note: Use the existing search form)
      click_on 'Search'
      # And I click "Search"
      expect(current_path).to eq ('/foods')
      # Then I should be on page "/foods"
      expect(page).to have_content('Results: 531')
      # Then I should see a total of the number of items returned by the
      # search. (531 for sweet potatoes)
      expect(page).to have_css('.foods', count: 10)
      # Then I should see a list of ten foods sorted by relevance.
      #
      within (first('.foods')) do
        expect(page).to have_css('.ndb_number')
        expect(page).to have_css('.name')
        expect(page).to have_css('.food_group')
        expect(page).to have_css('.data_source')
        expect(page).to have_css('.manufacturer')
      end
      # And for each of the foods I should see:
      # - The food's NDB Number
      # - The food's name
      # - The food group to which the food belongs
      # - The food's data source
      # - The food's manufacturer
    end
  end
end
