require 'rails_helper'
RSpec.feature 'User can delete movies' do

  scenario 'succesfully' do
    FactoryBot.create(:movie, title: 'Avengers')

    visit '/'
    click_link 'Avengers'
    click_link 'Delete'

    expect(page).not_to have_content 'Avengers'
    expect(page.current_url).to eq movies_url
  end
end
