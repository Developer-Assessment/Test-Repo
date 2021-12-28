Feature: Product Creation

  Creating a product

  Scenario: I want to create a product with all required parameters
    When To create product I send a POST request to "api/products/create" with following parameters
      | name | prod-11 |
      | code | PROD11  |
    Then I receive following JSON response from create product API
    """
    {
      "message": "Product Created Successfully",
      "errors": null
    }
    """
    And The response status of create product API should be "201"
  
  Scenario: I won't be able to create product without name
    When To create product I send a POST request to "api/products/create" with following parameters
      | code | PROD11  |
    Then I receive following JSON response from create product API
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
    And The response status of create product API should be "406"

  Scenario: I won't be able to create product without code
    When To create product I send a POST request to "api/products/create" with following parameters
      | name | PROD-11 |
    Then I receive following JSON response from create product API
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
    And The response status of create product API should be "406"
