# frozen_string_literal: true

require 'pg'

feature 'adding bookmark' do
  scenario 'adds bookmark to bookmarks' do
    visit '/bookmarks/new'
    fill_in 'url', with: 'https://www.technologyreview.com/'
    click_button 'Submit'

    expect(page).to have_content 'https://www.technologyreview.com/'
  end
end
