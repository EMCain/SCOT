#encoding: utf-8

Feature: looking at the broadcast/items page
  In order to properly track broadcast items
  As a user
  I should see the appropriate output when I view the broadcast/items page

  Scenario: user not logged in
    Given a user who is not logged in
    When she visits the /broadcast/items page
    Then she should see a message that says "You aren't logged in!"
    # And she should see a link to "/users/sign_in"
    # And she should not see any broadcast items

  Scenario: user does not have adequate permissions
    Given a user who is logged in as a regular user
    When he visits the /broadcast/items page
    Then he should see a message that says "Wait a sec!"
    # And he should not see any broadcast items
