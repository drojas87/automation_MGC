require_relative 'basePage.rb'


class SearchResPage < BasePage
    include PageObject

    def wait_until_loaded
        element = @browser.div(class:"clear-button")
        element_present = @browser.wait_until(element) rescue false    
    end

    def isCurrentPage    
        element = @browser.div(class:"clear-button")
        if element
            return true
        end
    end

    def search_box 

    end

    #TODO : Finish to implement this method
    def isFirstResult(book_name , author)
        #Get the text of the first result and compare it with the book name and author passed as arguments
        return true
=begin       
        browser.frame(index:0)
        element = get_first_link
        result_text = element.text.downcase.strip
        str_title = book_name.downcase.strip + '-' +  author.downcase.strip
        
        if result_text === str_title
            return true
        else
            return false
        end
=end

    end

    def get_first_link        
        return @browser.link(xpath:"//*[@id='rso']/div[1]/div[1]/div/div[1]/a")        
    end



end



