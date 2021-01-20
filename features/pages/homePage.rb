require_relative 'basePage.rb'

class HomePage < BasePage
    include PageObject
    #Defines the home url . It supposed to not be changed, but it is added as a good practice
    HOME_URL = 'www.google.com'

    def search_button
        @browser.button(:name => "btnK")
    end


    def visit_home
        @browser.goto HOME_URL
        check_language
    end

    def search(text)
        @browser.text_field(:title => "Search").send_keys(text)
    end

    def verify_author(author)
        return true
    end

    def isListDisplayed
        element = @browser.div(:text => "Clear")
        element_present = @browser.wait_until_present(element) rescue false    
        if element_present
            return true
        else 
            return false
        end
    end

    def get_first_suggestion
        @browser.div(xpath:"//*[@id='tsf']/div[2]/div[1]/div[2]/div[2]/ul/li[1]/div")
    end
=begin
    this should be a private field and it should be accesed in search method . I would change the steps definition
=end
   
    def isCurrentPage
        return true
    end

    private 
    
    def check_language
        #get the language link. if it exists with the text "English" then click it and change it in order to have google in English. This code should be changed
        element = @browser.link(:text => "English")
        element_present = browser.element.wait_until_present rescue false    
        if element_present
            element.click
        end
    end
end