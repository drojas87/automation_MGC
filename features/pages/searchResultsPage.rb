require_relative 'basePage.rb'


class SearchResPage < BasePage
    include PageObject

    def isCurrentPage    
        element = @browser.div(class:"clear-button")
        if element
            return true
        end
    end

    #TODO : Finish to implement this method
    def isFirstResult(book_name , author)

        #return true # get the element is not working fine , it is not finding it
        #Get the text of the first result and compare it with the book name and author passed as arguments

        browser.frame(index:0)
        element = get_first_link
        result_text = element.text.downcase.strip
        str_title = book_name.downcase.strip + '-' +  author.downcase.strip
        
        if result_text === str_title
            return true
        else
            return false
        end

    end

    def get_first_link        
        return @browser.link(xpath:"//*[@id='rso']/div[1]/div[1]/div/div[1]/a")
    end

end


