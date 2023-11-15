Feature: TimeEntry

  Background: Pag clockify
    Given base url https://api.clockify.me/api
    And header X-Api-Key = YjczNzExOTktZWJlMi00YzA1LWIyZGItMGI4OWM0YzhkYjli
    And header Content-Type = application/json

  @ConsultTimeEntry
  Scenario: consult registered hours
    Given call Workspaces.feature@ConsultWorkspaces
    And call TimeEntry.feature@AddTimeEntry
    And endpoint /v1/workspaces/{{idWorkspaces}}/time-entries/{{idTime}}
    And header Accept = */*
    When execute method GET
    Then the status code should be 200
    And response should be $.description = Crowdar Academy 2023


  @AddTimeEntry
  Scenario: Add hours
    Given call Workspaces.feature@ConsultWorkspaces
    And endpoint /v1/workspaces/{{idWorkspaces}}/time-entries
    And body timeEntry.json
    When execute method POST
    Then the status code should be 201
    * define idTime = $.id


  @ModifiedTimeEntry
  Scenario Outline: Modify hours
    Given call Workspaces.feature@ConsultWorkspaces
    And call TimeEntry.feature@AddTimeEntry
    And endpoint /v1/workspaces/{{idWorkspaces}}/time-entries/{{idTime}}
    And set value <Description> of key description in body timeEntry.json
    And set value <End> of key  end  in body timeEntry.json
    When execute method PUT
    Then the status code should be 200
    And response should be $.description = Prueba exitosa

    Examples:
      | Description      | End                    |
      | "Prueba exitosa" | "2023-08-24T14:35:22Z" |


  @DeleteTimeEntry
  Scenario: Delete hours
    Given call Workspaces.feature@ConsultWorkspaces
    And call TimeEntry.feature@AddTimeEntry
    And endpoint /v1/workspaces/{{idWorkspaces}}/time-entries/{{idTime}}
    When execute method DELETE
    Then the status code should be 204


