@user_story#7 @cucumber_patch
Feature: Cucumber patch feature
  As a user,
  In order to patch my cucumber.json output file,
  I want to have a new Json formatter

  @test#22
  Scenario: Generate cucumber.json file without test evidences
    Given I copy the directory named "../../resources/qat_project_embed_test_evidences" to "project"
    And I cd to "project"
    And I set the environment variables to:
      | variable        | value                                                    |
      | CUCUMBER_FORMAT |                                                          |
      | CUCUMBER_OPTS   | --format QAT::Formatter::Json --out public/cucumber.json |
    When I run `rake test:run`
    Then the exit status should be 0
    And a file named "public/cucumber.json" should exist
    And a file named "public/cucumber.json" should not contain:
    """
      "embeddings": [
    """          