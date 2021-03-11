*** Settings ***
Documentation   https://openweathermap.org/guide
Resource        ../../resources/resourceApi.robot

*** Test Case ***
Scenario: Get weather by city name
    When search the weather on "Dubai"
    Then the status code is "200"
    And the response is valid
    And the city name is "Dubai"

Scenario: Get weather by city id
    When search the weather by the city id "3448439"
    Then the status code is "200"
    And the response is valid
    And the city name is "São Paulo"

Scenario: Get weather by geographic coordinates
    When search the weather by the latitude "35" and longitude "139"
    Then the status code is "200"
    And the response is valid
    And the city name is "Shuzenji"

Scenario: Get weather by zip code
    When search the weather by the zip code "94040,us"
    Then the status code is "200"
    And the response is valid
    And the city name is "Mountain View"

Scenario: Get weather with invalid API Key
    When search the weather on "Dubai" using a invalid api key
    Then the status code is "401"
    And the message error is "Invalid API key. Please see http://openweathermap.org/faq#error401 for more info."

Scenario: Get weather by empty city name
    When search the weather on ""
    Then the status code is "400"
    And the message error is "Nothing to geocode"

Scenario: Get weather by invalid city id
    When search the weather by the city id "0000"
    Then the status code is "400"
    And the message error is "Invalid ID"

Scenario: Get weather by non existent city name
    When search the weather on "TEST"
    Then the status code is "404"
    And the message error is "city not found"