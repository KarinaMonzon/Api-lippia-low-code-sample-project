Feature: Workspaces


  Background: Pag clockify
    Given base url https://api.clockify.me/api
    And header X-Api-Key = YjczNzExOTktZWJlMi00YzA1LWIyZGItMGI4OWM0YzhkYjli
    And header Content-Type = application/json

  @ConsultNotFound
  Scenario: consult project
    Given call Workspaces.feature@ConsultWorkspaces
    And  endpoint /v1/workspaces/{{id}}/projects/{{idProjects}}
    And header Accept = */*
    When execute method GET
    Then the status code should be 404
