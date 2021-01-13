require_relative 'basePage.rb'


class SearchResPage < BasePage
    include PageObject

    def isCurrentPage
        return true
    end

    def isFirstResult(book_name , author)

    end

    def get_first_link
        @browser.span(text:'VISTA PREVIA')
       
    end

end