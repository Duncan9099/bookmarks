# frozen_string_literal: true
require 'pg'
require 'bookmark_manager'

describe BookmarkManager do
  subject(:bookmark_manager) { described_class.new }

  describe '#all' do
    it 'returns all bookmarks' do
      add_bookmarks

      bookmarks = BookmarkManager.all

      expect(bookmarks).to include("https://www.miniclip.com/games/en/")
      expect(bookmarks).to include("https://shredsauce.com/")
      expect(bookmarks).to include("https://www.spacejam.com/archive/spacejam/movie/jam.htm")
    end
  end

  describe '#create' do
    it 'add new bookmark' do
      BookmarkManager.create(url: "https://www.technologyreview.com/")

      expect(BookmarkManager.all).to include "https://www.technologyreview.com/"
    end
  end
end
