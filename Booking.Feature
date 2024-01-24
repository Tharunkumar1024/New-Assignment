Feature: Test API Calls for Restful Booker
 
  Background:
    * url 'https://restful-booker.herokuapp.com'
 
  Scenario: Get information about a booking
    Given path '/booking/{bookingId}'
    And def bookingId = 1
    When method GET
    Then status 200
 
  Scenario: Create a new booking
    Given path '/booking'
    And request 
    """
    {
      "firstname": "John",
      "lastname": "Doe",
      "totalprice": 200,
      "depositpaid": true,
      "bookingdates": {
        "checkin": "2022-01-01",
        "checkout": "2022-01-05"
      },
      "additionalneeds": "Breakfast"
    }
    """
    When method POST
    Then status 200
 
  Scenario: Update an existing booking with PUT
    Given path '/booking/{bookingId}'
    And def bookingId = 2
    And request 
    """
    {
      "firstname": "UpdatedFirstName",
      "lastname": "UpdatedLastName",
      "totalprice": 300,
      "depositpaid": false,
      "bookingdates": {
        "checkin": "2022-02-01",
        "checkout": "2022-02-05"
      },
      "additionalneeds": "Lunch"
    }
    """
    When method PUT
    Then status 200
 
  Scenario: Partially update an existing booking with PATCH
    Given path '/booking/{bookingId}'
    And def bookingId = 3
    And request 
    """
    {
      "totalprice": 250,
      "additionalneeds": "Dinner"
    }
    """
    When method PATCH
    Then status 200
 
  Scenario: Delete a booking
    Given path '/booking/{bookingId}'
    And def bookingId = 4
    When method DELETE
    Then status 200
	