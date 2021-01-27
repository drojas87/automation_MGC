Feature: Search for a book in google 

Scenario: User search for a book in google
Given I’m on google homepage 
When I search for "Los siete locos - Roberto Arlt"
Then I see the results page 
And the first link result is “Los siete locos - Roberto Arlt" 
And the link corresponds to wikipedia
When I enter to wikipedia
Then I should see the name of the book in the title

Scenario: User can search images by book and author
Given I’m on google homepage 
When I search for "Los siete locos - Roberto Arlt"
Then I see the results page
When I go to see the images for the book title and author 
Then I can see a list of images
When I select the first image
Then The image is open in a bigger size
And the title description contains the book title