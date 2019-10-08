# frozen_string_literal: true

require 'pg'

feature 'shows all bookmarks' do
  scenario 'Page returns all bookmarks' do
    add_bookmarks

    visit('/')

    click_button 'Show all bookmarks'
    expect(page).to have_content "https://www.miniclip.com/games/en/"
    expect(page).to have_content "https://shredsauce.com/"
    expect(page).to have_content "https://www.spacejam.com/archive/spacejam/movie/jam.htm"
  end
end
