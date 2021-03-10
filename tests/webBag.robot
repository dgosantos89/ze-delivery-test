*** Settings ***
Resource            ../resources/resource.robot
Resource            ../resources/pageObjects/home.robot
Resource            ../resources/pageObjects/login.robot
Resource            ../resources/pageObjects/product.robot
Resource            ../resources/pageObjects/bag.robot
Test Setup          Setup
Test Teardown       Teardown

*** Test Case ***
Scenario: Bag with value below the minimum does not allow purchase
    Given that the user is logged in
    When adding one "Sukita 2L" to the bag
    Then the subtotal must be "R$ 3,99"
    And the minimum value message is displayed
    And the finish order button is disabled

Scenario: Add product incompatible with the bag displays error message
    Given that the user have entered the address "Rua Fradique Coutinho, 1632"
    And have a "Sukita 2L" in the bag
    And close the bag
    When adding one "Vodka Smirnoff" to the bag
    Then the message product unavailable is displayed

Scenario: Increase the quantity of a product increases the total value
    Given that the user have entered the address "Rua Fradique Coutinho, 1632"
    And have a "Sukita 2L" in the bag
    When add more 5 unities
    Then the subtotal must be "R$ 23,94"

Scenario: Add diferent products in the bag
    Given that the user have entered the address "Rua Fradique Coutinho, 1632"
    And have a "Sukita 2L" in the bag
    And close the bag
    When adding one "Colorado Appia 600ml" to the bag
    Then the subtotal must be "R$ 15,98"
