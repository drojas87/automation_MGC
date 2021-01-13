require_relative 'basePage.rb'


class BookPage < BasePage
    include PageObject

    #TODO
    def isCurrentPage
        return true
    end

    def search(title)
        return true
    end

    def isListDisplayed
        return true
    end

    def get_first_link

    end

    def verify_author(author)
        return true
    end

    
end