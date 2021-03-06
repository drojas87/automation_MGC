require 'page-object'
require 'watir'

def set_driver(os)
    chromedriver_path = nil
    if os === 'linux'
        chromedriver_path = File.join(File.absolute_path('../..', File.dirname(__FILE__)),"drivers","chromedriver_linux")
    else
        chromedriver_path = File.join(File.absolute_path('../..', File.dirname(__FILE__)),"drivers","chromedriver_windows.exe")
    end
    Selenium::WebDriver::Chrome::Service.driver_path = chromedriver_path
end


os = 'linux'; # change this variable to 'window' if you are in windows os
set_driver(os)
#For each new test it is going to initialize a new browser instance
Before do
    @browser = Watir::Browser.new :chrome
    Watir.default_timeout = 10
    @browser.window.maximize
end

#Assure that in all executions the browser will be closed
After do
    @browser.close
end