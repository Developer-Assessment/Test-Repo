Feature: Product Creation

  Creating a product

  Scenario: I want to create a product with all required parameters
    When I send a POST request to "api/products/create" with the following:
      | name | prod-11 |
      | code | PROD11  |
    Then I receive following json response:
    """
    {
      "message": "Product Created Successfully",
      "errors": null
    }
    """
    And The response status should be "201"
  
  Scenario: I won't be able to create product without name
    When I send a POST request to "api/products/create" with the following:
      | code | PROD11  |
    Then I receive following json response:
    """
    {
      "message": "Failed To Create Product",
      "errors": {
        "name": [
          "Product name should not be empty"
        ]
      }
    }
    """
    And The response status should be "406"

  Scenario: I won't be able to create product without code
    When I send a POST request to "api/products/create" with the following:
      | name | PROD-11 |
    Then I receive following json response:
    """
    {
      "message": "Failed To Create Product",
      "errors": {
        "code": [
          "Product code Should not be empty"
        ]
      }
    }
    """
    And The response status should be "406"
