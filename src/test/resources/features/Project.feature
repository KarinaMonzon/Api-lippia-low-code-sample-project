Feature: Projects

  Background: Pag clockify
    Given base url https://api.clockify.me/api
    And header X-Api-Key = YjczNzExOTktZWJlMi00YzA1LWIyZGItMGI4OWM0YzhkYjli
    And header Content-Type = application/json

  @CreatProject
  Scenario: Create a project
    Given call Workspaces.feature@ConsultWorkspaces
    And endpoint /v1/workspaces/{{id}}/projects
    And body project.json
    When execute method POST
    Then the status code should be 201
    And response should be name  = DemoFoodVenezuela


  @ConsultProject
  Scenario: consult project
    Given call Workspaces.feature@ConsultWorkspaces
    And  endpoint /v1/workspaces/{{id}}/projects
    And header Accept = */*
    When execute method GET
    Then the status code should be 200
    * define idProjects = $.[16].id









