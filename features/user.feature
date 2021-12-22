Feature: User Registration
  Creating a User

  Scenario: I want to create a user with all required parameters
    When  To create user I send a POST request to "api/users/create" with the following
      | name | Test user |
      | email | test@ttt.com |
      | mobile | 98349874386 |
      | password | 123456789 |
    Then I receive following JSON response from create user API
    """
      {
        "message": "User Created Successfully",
        "errors": null
      }
    """
    And The response status of create user API should be "201"

  Scenario: I won't be able to create user without name
    When  To create user I send a POST request to "api/users/create" with the following
      | email | test@ttt.com |
      | mobile | 98349874386 |
      | password | 123456789 |
    Then I receive following JSON response from create user API
    """
      {
        "message": "Failed To Create User",
        "errors": {
          "name": [
            "Name should not be empty"
          ]
        }
      }
    """
    And The response status of create user API should be "406"

  Scenario: I won't be able to create user without email
    When  To create user I send a POST request to "api/users/create" with the following
      | name | test test |
      | mobile | 98349874386 |
      | password | 123456789 |
    Then I receive following JSON response from create user API
    """
      {
        "message": "Failed To Create User",
        "errors": {
          "email": [
            "Email Should not be empty"
          ]
        }
      }
    """
    And The response status of create user API should be "406"

  Scenario: I won't be able to create user without mobil
    When  To create user I send a POST request to "api/users/create" with the following
      | name | test test |
      | email | test@tt.co |
      | password | 123456789 |
    Then I receive following JSON response from create user API
    """
      {
        "message": "Failed To Create User",
        "errors": {
          "mobile": [
            "Mobile Should not be empty"
          ]
        }
      }
    """
    And The response status of create user API should be "406"

  Scenario: I won't be able to create user with password of less than 8 characters
    When  To create user I send a POST request to "api/users/create" with the following
      | name | test test |
      | email | test@tt.co |
      | mobile | 867345345 |
      | password | 12345 |
    Then I receive following JSON response from create user API
    
    """
      {
        "message": "Failed To Create User",
        "errors": {
          "password": [
            "Your password must contain at least 8 characters"
          ]
        }
      }
    """

    And The response status of create user API should be "406"

  Scenario: I won't be able to create user without required fields
    When  To create user I send a POST request to "api/users/create" with the following
      | name ||
      | email ||
      | mobile ||
      | password ||
    Then I receive following JSON response from create user API
    
    """
      {
        "message": "Failed To Create User",
        "errors": {
          "name": [
            "Name should not be empty"
          ],
          "email": [
            "Email Should not be empty"
          ],
          "mobile": [
            "Mobile Should not be empty"
          ],
          "password": [
            "Your password must contain at least 8 characters"
          ]
        }
      }
    """
    
    And The response status of create user API should be "406"