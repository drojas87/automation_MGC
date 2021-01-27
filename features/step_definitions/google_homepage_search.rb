require_relative '../pages/homePage.rb'
require_relative '../pages/basePage.rb'
require_relative '../pages/searchResultsPage.rb'
require 'rspec/expectations'

  Given('I’m on google homepage') do
    @home_page = HomePage.new(@browser)
    @home_page.visit_home  
  end

  Then('I see the results page') do
    @results = SearchResPage.new(@browser)
    @results.wait_until_loaded
    expect(@results.isCurrentPage).to eq(true)
  end
  
  Then('the first link result is “Los siete locos - Roberto Arlt"') do
    expect(@results.isFirstResult("Los siete locos" , "Roberto Arlt"))
  end
  
  Then('the link corresponds to wikipedia') do
    expect(@results.get_first_link.text).to include('Wikipedia')
  end
  
  When('I enter to wikipedia') do
    @results.get_first_link.click
  end
  
  Then('I should see the name of the book in the title') do
    @wiki = WikiPage.new(@browser)
    expect(@wiki.check_title("Los siete locos")).to eq(true)
  end
  
  When('I go to see the images for the book title and author') do
    #Should I create another page for, "image results" ? that would be more time consuming, I think this lack of clarity is one of the problem with pageObject pattern. 
    #Just because this is a simple example I will keep using only one results page
    @results.get_images_link.click
  end
  
  Then('I can see a list of images') do
    expect(@results.isImageListDisplayed).to eq(true)
  end
  
  When('I select the first image') do
    @results.get_first_image.click
  end
  
  Then('The image is opened in a bigger size') do
    expect(@results.isImageDetailDisplayed).to eq(true)
  end
  
  Then('the title description contains the book title') do
    expect(@results.check_title_in_image("Los siete locos"))
  end

  When('I search for "Los siete locos - Roberto Arlt"') do
    @home_page.search("Los siete locos - Roberto Arlt")
  end
  