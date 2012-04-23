Feature: Autocomplete
  In order to do funky stuff
  As a User
  I want autocomplete!

  Background: 
    Given the following brands exists:
      | name  |
      | Alpha |
      | Beta  |
      | Gamma |
    And the following features exists:
      | name  |
      | Shiny |
      | Glowy |

  @javascript
  Scenario: Autocomplete
    Given I go to the home page
    And I fill in "Brand name" with "al"
    And I choose "Alpha" in the autocomplete list
    Then the "Brand name" field should contain "Alpha"

  @javascript
  Scenario: Autocomplete, id_element option
    Given I go to the new id element page
    And I fill in "Brand name" with "al"
    And I choose "Alpha" in the autocomplete list
    Then the "Brand name" field should contain "Alpha"
    And the "Brand" field should contain the "Alpha" brand id

  @javascript
  Scenario: Autocomplete for a sub class
    Given the following foreign brands exists:
      | name  |
      | Omega |
    Given I go to the new sub class page
    And I fill in "Brand name" with "om"
    And I choose "Omega" in the autocomplete list
    Then the "Brand name" field should contain "Omega"

  @javascript
  Scenario: Autocomplete
    Given I go to the new multiple selection page
    And I send al to "Brand name"
    And I choose "Alpha" in the autocomplete list
    And I send bet to "Brand name"
    And I choose "Beta" in the autocomplete list
    Then the "Brand name" field should contain "Alpha,Beta"

  @javascript
  Scenario: Autocomplete for Nested Models
    Given I go to the new nested model page
    When I send sh to "Feature Name"
    And I choose "Shiny" in the autocomplete list
    Then the "Feature Name" field should contain "Glowy,Shiny"
