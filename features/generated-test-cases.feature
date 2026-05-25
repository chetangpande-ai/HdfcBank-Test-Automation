Feature: Generated test cases
  Generated from approved human-reviewed test cases.

  Background:
    Given test preconditions are satisfied

  @smoke @regression @positive @api
  Scenario: TC_001 Create User - Happy Path with Valid Mandatory Details
    When I execute test case "TC_001"
    Then the expected result should be "User is created successfully, HTTP 201 returned, audit fields populated and persisted in DB"

  @negative @api @validation @duplicate
  Scenario: TC_002 Create User - Duplicate Email Failure
    When I execute test case "TC_002"
    Then the expected result should be "User creation is blocked, appropriate error code/message returned, no new record created"

  @negative @validation @api @email
  Scenario: TC_003 Create User - Invalid Email Format
    When I execute test case "TC_003"
    Then the expected result should be "Request is rejected with clear validation error for email format"
