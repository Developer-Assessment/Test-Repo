Feature: Create Booking
  I want to create a Booking

  Scenario: A user can create a booking by sending a POST request
    When I send a POST request to "/api/bookings/create" with the following:
      | name | test booking |
      | email| em@em.em |
      | mobile | 95456599 |
      | booking_date | 10/10/2022 |
      | from_time | 10:00:00 |
      | to_time | 12:00:00 |
    Then The following json response is sent:
    """
      {
        "message": "Booking Created Successfully",
        "errors": null
      }
    """
    And The response status should be "200"

  Scenario: A user cann't create booking with out name
    When I send a POST request to "/api/bookings/create" with the following:
      | email| em@em.em |
      | mobile | 95456599 |
      | booking_date | 10/10/2022 |
      | from_time | 10:00:00 |
      | to_time | 12:00:00 |
    Then The following json response is sent:
    """
      {
        "message": "Failed To Create Booking",
        "errors": {
          "name": [
              "Name should not be empty"
          ]
        }
      }
    """
    And The response status should be "406"

    Scenario: A user cann't create booking with out email
    When I send a POST request to "/api/bookings/create" with the following:
      | name | test booking |
      | mobile | 95456599 |
      | booking_date | 10/10/2022 |
      | from_time | 10:00:00 |
      | to_time | 12:00:00 |
    Then The following json response is sent:
    """
      {
        "message": "Failed To Create Booking",
        "errors": {
          "email": [
            "Email Should not be empty"
          ]
        }
      }
    """
    And The response status should be "406"

    Scenario: A user cann't create booking with out mobile
      When I send a POST request to "/api/bookings/create" with the following:
        | name | test booking |
        | email| em@em.em |
        | booking_date | 10/10/2022 |
        | from_time | 10:00:00 |
        | to_time | 12:00:00 |
      Then The following json response is sent:
      """
        {
          "message": "Failed To Create Booking",
          "errors": {
            "email": [
              "Mobile Should not be empty"
            ]
          }
        }
      """
      And The response status should be "406"