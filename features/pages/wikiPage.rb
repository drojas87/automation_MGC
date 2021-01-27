require_relative 'basePage.rb'
require 'rspec/expectations'


class WikiPage < BasePage
    include PageObject

    def wait_until_loaded
        #TODO , call base page method only using ID
        @browser.div(id:"footer-places-privacy").wait_until(timeout:10,&:exists?)
        
    end

    def isCurrentPage    
        
    end

    def check_title(title) 
        return get_title.downcase.strip.include?(title.downcase.strip)
    end

    def get_title
        return @browser.h1(id:'firstHeading').text
    end

end



