Feature: User

  Background: Pag clockify
    Given base url https://api.clockify.me/api
    And header X-Api-Key = YjczNzExOTktZWJlMi00YzA1LWIyZGItMGI4OWM0YzhkYjli
    And header Content-Type = application/json

  @CreatClient
  Scenario: Create a customer
   Given call Workspaces.feature@ConsultWorkspaces
    And endpoint /v1/workspaces/{{idWorkspaces}}/clients
    And body client.json
    When execute method POST
    Then the status code should be 201
    And response should be name  = luna

  @ConsultClient
  Scenario: consult customer
    Given call Workspaces.feature@ConsultWorkspaces
    And  endpoint /v1/workspaces/{{idWorkspaces}}/clients
    And header Accept = */*
    When execute method GET
    Then the status code should be 200
    * define idClient = $.[1].id
    * define idWorkspaces = $.[1].workspaceId


  @DeleteClient @Test
  Scenario: Delete customer
    Given call Client.feature@ConsultClient
    And endpoint /v1/workspaces/{{idWorkspaces}}/clients/{{idClient}}
    When execute method DELETE
    Then the status code should be 200

