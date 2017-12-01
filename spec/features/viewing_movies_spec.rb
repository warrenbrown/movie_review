require 'rails_helper'
RSpec.feature 'Users can view movies' do
  scenario 'successfully' do
    FactoryBot.create(:movie, title: 'Avengers', description: 'My descripition')

    visit '/'
    click_link 'Avengers'

    expect(page).to have_content 'Avengers'
  end
end
