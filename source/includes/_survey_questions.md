# Survey Questions

## Common
> A typical question

```json
{
    "id" : 12345,
    "question_type" : "single_choice|text|numeric",
    "text" : "What is the air-speed velocity of an unladen swallow?"
}

```

The attributes present in a survey question will vary depending on its type. However, all types will contain the following common attributes:

### Attributes


Name | Type | Description
--------- | ---- | -----------
id | number | a number uniquely identifying this survey question
question_type | enumerated string | identifies the type of question. Valid values are: `single_choice`, `numeric`, or `text`
text | string | the text of the survey question

## Question Type: Text

> A sample text question

```json
    {
      "id" : 0,
      "question_type" : "text",
      "question" : "What is your first name?"
    }
```

Text question types contain only the [common](#common) attributes. This question type indicates to the
client that it should accept textual input from the user as a response to this question.



## Question Type: Numeric

> A sample numeric question

```json
    {
      "id" : 0,
      "question_type" : "numeric",
      "question" : "What is your age?"
    }
```

Numeric question types contain only the [common](#common) attributes. This question type indicates to
the client that it should accept numeric input from the user as a response to this question.

## Choice

> A simple choice

```json
    {
      "id" : 45,
      "text" : "Abraham Lincoln"
    }
```

> A choice with a sub-question

```json
    {
      "id" : 100,
      "text" : "Massachusetts",
      "sub_question" : {
        "id" : 4,
        "question" : "What town do you live in?",
        "choices" : [
          {
            "id" : 101,
            "text" : "Boston"
          },
          {
            "id" : 102,
            "text" : "Cambridge"
          },
          {
            "id" : 103,
            "text" : "Somerville"
          },
          {
            "id" : 104,
            "text" : "Worcester"
          }
        ]
      }
    }
```

A choice represents a possible answer to a survey question. In its simplest form, it contains an id and text
describing the choice.

Choices may also contain a sub-question. A sub-question is only displayed to a user if he chooses this particular
choice.

### Attributes

Name | Type | Description
--------- | ---- | -----------
id | number | a number uniquely identifying this choice
text | string | the text describing this choice
sub_question | choice | An optional [survey question](#survey-questions) object that is only valid if a user selects the given choice

## Question Type: Single Choice

> A simple single_choice question

```json
    {
      "id" : 1,
      "question_type" : "single_punch",
      "question" : "What is your gender?",
      "choices" : [
        {
          "id" : 0,
          "text" : "Male"
        },
        {
          "id" : 1,
          "text" : "Female"
        }
      ]
    }
```

> With a sub-question

```json
{
      "id" : 3,
      "question_type" : "single_punch",
      "question" : "What is your ethnicity?",
      "choices" : [
        {
          "id" : 0,
          "text" : "White"
        },
        {
          "id" : 1,
          "text" : "Black or African American"
        },
        {
          "id" : 2,
          "text" : "American Indian or Alaska Native"
        },
        {
          "id" : 3,
          "text" : "Asian",
          "sub_question" : {
            "id" : 4,
            "question" : null,
            "choices" : [
              {
                "id" : 0,
                "text" : "Asian Indian"
              },
              {
                "id" : 1,
                "text" : "Chinese"
              },
              {
                "id" : 2,
                "text" : "Filipino"
              }
            ]
          }
        }
      ]
    }
```

Single choice questions provide a user with a list of choices, of which he is only allowed to select one.

In addition to the [common](#common) attributes, single choice questions add the following:

Name | Type | Description
--------- | ---- | -----------
choices | array | an array of [choice](#choice) objects

<aside class="warning">Single choice questions are the only question type for which it is valid to list sub-questions
in the possible choices. Sub-questions listed on other question types will result in undefined client-side behavior.
</aside>