# API Calls

## Survey Question Response

> Sample request

```shell
curl http://xml.livetowin.com/mobile/surveyQuestionResponse \
    -H "Accept: application/json" -X POST \
    -F "uuid=kevin@nivektric.com&questionID=1&choiceID=2&subQuestionID=3&subQuestionResonse=foo"
```

> Sample response

```json
{
  "user_status" : {

  },
  "results" : {
    "entries_awarded" : 0,
    "current_survey_question" : 5,
    "total_survey_questions" : 10,
    "next_question" : {
      "id" : 4,
      "question_type" : "single_punch",
      "question" : "What is your household income?",
      "choices" : [
        {
          "id" : 0,
          "text" : "Less than $5,000"
        },
        {
          "id" : 1,
          "text" : "$250,000 and above"
        },
        {
          "id" : 2,
          "text" : "Prefer not to answer"
        }
      ]
    }
  }
}
```

This API records a user's response to a survey question, and returns the next question, if there is one available.

### HTTP Request

`POST /mobile/surveyQuestionResponse`

### Arguments

Name | Type | Required | Description
---- | ---- | -------- | -----------
uuid | string | required | the uuid of the user answering the question
questionID | number | required | the id of the question being responded to
choiceID | number | optional | for single-choice questions, the id of the selected choice. This argument is *REQUIRED* for questions of type `single_choice`, and will be ignored for all other types.
response | string | optional | for text and numeric questions, the response provided by the user. This argument is *REQUIRED* for questions of type `text` and `numeric` and will be ignored for all other types.
subQuestionID | number | optional | if the user selected a choice with a sub-question, this is the id of the sub-question
subQuestionChoiceID | number | optional | same as choiceID, but for the applicable sub-question
subQuestionResponse | string | optional | same as response, but for the applicable sub-question

### Response

Name | Type |  Description
---- | ---- | -----------
entries_awarded | number | the number of entries the user was awarded for responding to this question
current_survey_question | number | the question number (out of the total number of questions) that the next_question element represents, used to dipslay progress information to the user
total_survey_questions | number | the total number of survey questions in this survey, used to display progress information to the user
next_question | survey_question | the next question in the survey. This will be `null` if the user is finished with the survey.