# Actions

## Survey
```json
{
  "type" : "survey",
  "data" : {
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

Action type: `survey`

This action type represents a demographic survey that a user can complete in exchange for entries. Some questions are
dependent on the response to a previous question, and the logic for this will be server-side. Because of this, only
the next question will be present in the action. When responding to a particular question via the
`surveyQuestionResponse` API call, the next question, if any, will be returned in the response.

### Attributes

Name | Type |  Description
---- | ---- | -----------
current_survey_question | number | the question number (out of the total number of questions) that the next_question element represents, used to dipslay progress information to the user
total_survey_questions | number | the total number of survey questions in this survey, used to display progress information to the user
next_question | survey_question | the next question in the survey. See [survey questions](#survey-questions) for details on this structure. This value will be `null` if the user is finished with the survey.