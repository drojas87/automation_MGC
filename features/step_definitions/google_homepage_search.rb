require_relative '../pages/homePage.rb'
require_relative '../pages/basePage.rb'
require_relative '../pages/bookPage.rb'
require_relative '../pages/searchResultsPage.rb'





Given('I’m on the homepage') do
  @home_page = HomePage.new(@browser)
  @home_page.visit_home
end
  
  When('I type “The name of the wind” into the search field') do
    @home_page.search("The name of the wind")
  end
  
=begin 
  TODO : the steps could be implemented in a different way. "I search " , then I don't need to be tied to the specific components and I would implement this
   in this way
   When('I search for a book') do
     home_page.search 
   and having two methods inside of home_page.search

   def HomePage::Search(name_of_the_book)
      search_textbox.send_keys(name_of_the_book)
      search_button.click
   end
=end
  When('I click the Google Search button') do
    @home_page.search_button.click
  end


  Then('I go to the search results page') do
    @search_results = SearchResPage.new(@browser)
    expect(@search_results.isCurrentPage) 
  end
  
  Then('the first result is “The Name of the Wind - Patrick Rothfuss”') do
    expect(@search_results.isFirstResult("The Name of the Wind" , "Patrick Rothfuss"))
  end
  
  When('I click on the first result link') do
    @search_results.get_first_link
  end
  
  Then('I go to the “Patrick Rothfuss - The Books” page') do
    @book_page = BookPage.new(@browser)
    @book_page.verify_author("Patrick Rothfuss")
  end
  
  When('I type “The name of the w” into the search field') do
    @book_page = BookPage.new(@browser)

    @book_page.search("The name of the w")
  end
  
  When('the suggestions list is displayed') do
    @book_page.isListDisplayed()
  end
  
  When('I click on the first suggestion in the list') do
    @book_page.get_first_link
  end