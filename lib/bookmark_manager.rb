require 'pg'

class BookmarkManager
  attr_reader :bookmarks

  def self.all
    if ENV['ENVIRONMENT'] == "test"
      connection = PG.connect(dbname: 'bookmarks_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    rs = connection.exec "SELECT * FROM bookmarks"
    rs.map do |bookmark|
      bookmark['url']
    end
  end

  def self.create(url:)
    if ENV['ENVIRONMENT'] == "test"
      connection = PG.connect(dbname: 'bookmarks_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  end


  # def environment_setup
  #   if ENV['ENVIRONMENT'] == "test"
  #     connection = PG.connect(dbname: 'bookmarks_manager_test')
  #   else
  #     connection = PG.connect(dbname: 'bookmark_manager')
  #   end
  # end
end
