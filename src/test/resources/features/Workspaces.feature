Feature: Workspaces


  Background: Pag clockify
    Given base url https://api.clockify.me/api
    And header X-Api-Key = YjczNzExOTktZWJlMi00YzA1LWIyZGItMGI4OWM0YzhkYjli
    And header Content-Type = application/json

  @CreateWorkspaces
  Scenario: Create a workspaces
    Given endpoint /v1/workspaces
    And body workspaces.json
    When execute method POST
    Then the status code should be 201
    And response should be name  = Food Venezuela


  @ConsultWorkspaces
  Scenario: Consult
    Given endpoint /v1/workspaces
    When execute method GET
    And the status code should be 200
    * define idWorkspaces = $.[0].id



    












