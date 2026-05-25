Feature: Generated test cases
  Generated from approved human-reviewed test cases.

  Background:
    Given test preconditions are satisfied

  @smoke @regression @positive @api
  Scenario: TC_001 Create User - Happy Path with Valid Mandatory Details
    When I execute test case "TC_001"
    Then the expected result should be "User is created successfully, HTTP 201 returned, all response fields populated correctly, and audit information recorded."

  @negative @validation @api @duplicate
  Scenario: TC_002 Create User - Duplicate Email Failure
    When I execute test case "TC_002"
    Then the expected result should be "User creation is blocked, appropriate error response returned, no new user record is created."
