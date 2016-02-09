def add_link
  fill_in "Title", with: 'DataMapper'
  fill_in "URL", with: 'http://datamapper.org/'
  click_button 'Add new bookmark'
end
