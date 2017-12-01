require 'rails_helper'
RSpec.feature 'Users can update movies' do

  scenario 'with valid attributes' do
    FactoryBot.create(:movie, title: 'Avengers')

    visit '/'
    click_link 'Avengers'
    click_link 'Edit Movie'

    fill_in 'Title', with: 'Thor Ragnarok'
    click_button 'Update Movie'

    expect(page).to have_content 'Movie has been updated.'
    expect(page).to have_content 'Thor Ragnarok'
  end
end
