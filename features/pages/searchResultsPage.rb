require_relative 'basePage.rb'
require 'rspec/expectations'

class SearchResPage < BasePage
    include PageObject

    def wait_until_loaded
        @browser.div(id:"footcnt").wait_until(timeout:10,&:exists?)
    end

    def isCurrentPage    
        element = @browser.div(class:"clear-button")
        if element
            return true
        end
    end

    def search_box 

    end

    def isFirstResult(book_name , author)
        return get_first_link.text.downcase.strip.include?(book_name.downcase.strip)
    end

    def get_first_link        
        return @browser.link(xpath:"//*[@id='rso']/div[1]/div/div[1]/a") 
    end

    def get_images_link
        return @browser.link(xpath:"//*[@id='hdtb-msb-vis']/div[2]/a")
    end



end



