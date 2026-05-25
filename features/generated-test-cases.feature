Feature: Generated test cases
  Generated from approved human-reviewed test cases.

  Background:
    Given test preconditions are satisfied

  @smoke @regression @positive @api
  Scenario: TC_001 Create User - Happy Path with Valid Mandatory Details
    When I execute test case "TC_001"
    Then the expected result should be "User is created, unique userId is returned, status defaults to ACTIVE, audit fields createdBy (admin) and createdDate are populated."

  @boundary @positive @api
  Scenario: TC_002 Create User - Boundary Test for FirstName and LastName Length (50 chars)
    When I execute test case "TC_002"
    Then the expected result should be "User created with provided max‑length names; no validation error is returned."

  @negative @api @validation @uniqueness
  Scenario: TC_003 Create User - Duplicate Email Should Fail
    When I execute test case "TC_003"
    Then the expected result should be "User is not created; system returns appropriate error indicating email uniqueness violation."

  @negative @api @validation
  Scenario: TC_004 Create User - Invalid Email Format
    When I execute test case "TC_004"
    Then the expected result should be "User is not created; validation error returned for email field."

  @negative @api @validation
  Scenario: TC_005 Create User - Missing Mandatory Fields
    When I execute test case "TC_005"
    Then the expected result should be "User creation fails; API reports all missing mandatory fields."

  @negative @api @validation
  Scenario: TC_006 Create User - Unsupported Role Value
    When I execute test case "TC_006"
    Then the expected result should be "User is not created; validation error returned for role field."

  @negative @api @validation
  Scenario: TC_007 Create User - Password Policy Violation (Less Than 8 Characters)
    When I execute test case "TC_007"
    Then the expected result should be "User creation fails; API returns password policy violation message."

  @integration @db @audit @positive
  Scenario: TC_008 Create User - Verify Audit Fields Persisted in Database
    When I execute test case "TC_008"
    Then the expected result should be "Audit fields are correctly persisted, confirming proper population of createdBy and createdDate."
