def add_link
  fill_in "Title", with: 'DataMapper'
  fill_in "URL", with: 'http://datamapper.org/'
  fill_in "Tags", with: 'data'
  click_button 'Add new bookmark'
end
