require 'rails_helper'
RSpec.feature 'Users can create movies' do
  scenario 'with valid attributes' do
    visit '/'

    click_link 'New Movie'

    fill_in 'Title', with: 'Avengers'
    fill_in 'Description', with: 'Lorme ipsum'
    fill_in 'Genre', with: 'Action'
    click_button 'Create Movie'

    expect(page).to have_content 'Movie has been created.'
    expect(page).to have_content 'Avengers'
  end
end
