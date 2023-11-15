Feature: Workspaces

    Background: Pag clockify
      Given base url https://api.clockify.me/api
      And header X-Api-Key = YjczNzExOTktZWJlMi00YzA1LWIyZGItMGI4OWM0YzhkYjli
      And header Content-Type = application/json

    @ConsultWorkspaces
    Scenario: Consult
      Given endpoint /v1/workspaces
      When execute method GET
      And  the status code should be 200
      * define idWorkspaces = $.[0].id
