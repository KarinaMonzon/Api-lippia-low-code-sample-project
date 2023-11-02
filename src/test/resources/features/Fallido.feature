Feature: Workspaces


  Background: Pag clockify
    Given base url https://api.clockify.me/api
    And header X-Api-Key =
    And header Content-Type = application/json

  @FalloApi
  Scenario: Create a workspaces
    Given endpoint /v1/workspaces
    And body workspaces.json
    When execute method POST
    Then the status code should be 401
