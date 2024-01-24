Feature: Perform CRUD operations on the Restful Booker API
 
  Background:
    * url 'https://restful-booker.herokuapp.com'
 	* print url
 	
  Scenario: Get Booking Information
    Given path '/booking/{bookingId}'
    And path '1'
    When method GET
    Then status 200
 
  Scenario: Create a New Booking
    Given path '/booking'
    And request { "firstname": "John", "lastname": "Doe", "totalprice": 100, "depositpaid": true, "bookingdates": { "checkin": "2024-01-23", "checkout": "2024-01-25" }, "additionalneeds": "Breakfast" }
    When method POST
    Then status 200
 
  Scenario: Update Booking Information
    Given path '/booking/{bookingId}'
    And path '2'
    And request { "firstname": "UpdatedFirstName", "lastname": "UpdatedLastName", "totalprice": 150, "depositpaid": false, "bookingdates": { "checkin": "2024-02-01", "checkout": "2024-02-05" }, "additionalneeds": "UpdatedNeeds" }
    When method PUT
    Then status 200
 
  Scenario: Partially Update Booking Information
    Given path '/booking/{bookingId}'
    And path '3'
    And request { "firstname": "PartialUpdate", "lastname": "Doe" }
    When method PATCH
    Then status 200
 
  Scenario: Delete a Booking
    Given path '/booking/{bookingId}'
    And path '4'
    When method DELETE
    Then status 200
