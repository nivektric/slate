# Actions

## Action: Survey
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

## Action: Prize Wheel
```json
{
    "type" : "prize_wheel",
    "data" : {
        "version" : 7,
        "get_coins_enabled" : false,
        "no_spins_action" : "bonus",
        "done_action" : null,
        "more_action" : null,
        "number_of_positions" : 12,
        "get_coins_action" : "no-iap",
        "text_image" : "http://livetowin.net/img/xml/livetowin/spin/wheel_text7.png?v=2",
        "base_image" : "http://www.livetowin.net/img/xml/livetowin/spin/wheel_base.png?v=2",
        "background_image" : "http://www.livetowin.net/img/xml/livetowin/spin/wheel_background.png?v=2",
        "highlight_image" : "http://www.livetowin.net/img/xml/livetowin/spin/wheel_highlight.png?v=2",
        "bracket_image" : "http://www.livetowin.net/img/xml/livetowin/spin/wheel_bracket.png",
        "center_image" : "http://www.livetowin.net/img/xml/livetowin/spin/wheel_center.png?v=2",
        "center_glow_image" : "http://www.livetowin.net/img/xml/livetowin/spin/wheel_title_glow.png?v=3"
    }
}
```

Action type: `prize_wheel`

Display the prize wheel.

### Attributes

Name | Type |  Description
---- | ---- | -----------
version | number | numeric version number of the wheel. This will be updated any time material changes are made to the wheel settings and must be passed to the `spinWheel` API call to indicate which set of odds the server should use in determining the result.
get_coins_enabled | boolean | indicates whether or not to display the "Get Coins" button
no_spins_action | string | action to perform when a user runs out of spins. If this action is non-null, then done_action and more_action will be ignored.
done_action | string | action to direct a user to after they select "Done"
more_action | string | action to direct a user to after they select "Get More Spins"
number_of_positions | number | the number of segments on the current wheel. This is used by the client to determine how to rotate the wheel when it is spun
get_coins_action | string | action to direct a user to after they choose the "Get Coins" button
text_image | string | URL to the image containing the text labels for the wheel, must be 558x558
base_image | string | URL to the image used for the base of the wheel that does not spin, must be 634x634
background_image | string | URL to the image used for the background of the spinning component of the wheel, must be 558x558
highlight_image | string | URL to the image used to highlight the selected wheel segment when a spin completes, must be 558x558
bracket_image | string | URL to the image for the bracket highlighting the selected wheel segment, must be 558x558
center_image | string | URL to the image for the center of the wheel, must be 146x146
center_glow_image | string | URL to the image for the glowing center of the wheel, must be 146x146

## Action: Interstitial Interactive
> With a link URL

```json
{
    "type" : "interstitial_interactive",
    "data" : {
        "image_url" : "http://www.livetowin.com/img/xml/livetowin/tips/tip-polls.png",
        "hot_spots" : [
            {
                "x" : 112,
                "y" : 320,
                "width" : 97,
                "height" : 34,
                "image_url" : "http://www.livetowin.com/img/xml/livetowin/tips/btn-next.png",
                "link_url" : "livetowin://continue"
            }
        ]
    }
}
```

> With a target action

```json
{
    "type" : "interstitial_interactive",
    "data" : {
        "image_url" : "http://www.livetowin.com/img/xml/livetowin/tips/tip-polls.png",
        "hot_spots" : [
            {
                "x" : 112,
                "y" : 320,
                "width" : 97,
                "height" : 34,
                "image_url" : "http://www.livetowin.com/img/xml/livetowin/tips/btn-next.png",
                "target_action" : "video_fyber"
            }
        ]
    }
}
```

Action type: `interstitial_interactive`

A view that will display the associated image inline with other earn actions, instead of modally like the `ad_web` or
 `ad_native` types. This differs from interstitial_inline in that hot spots can be declared and placed dynamically.

### Attributes

Name | Type |  Description
---- | ---- | -----------
image_url | string | URL of an image to display with dimensions 640x734
hot_spots | array | an array of [hot spots](#hot-spots) to be displayed on the interstitial

## Action: Videos
```json
{
    "type" : "video_adcolony",
    "data" : {
        "entries" : 1000,
        "prompt_before" : false,
        "prompt_more" : true,
        "backup" : "video_brightroll",
        "requires_wifi" : false
    }
}
```

There are multiple different video actions, but all have the same options. The type simply defines which provider to source the videos from.

The valid video action types are:

* `video_fyber`
* `video_adcolony`
* `video_brightroll`
* `video_sessionm`
* `video_hyprmx`

### Attributes

Name | Type |  Description
---- | ---- | -----------
entries | number | the number of entries a user will get from watching a video
prompt_before | boolean | value indicating whether the user should be prompted before showing a video. This value is optional, and if it is not present, the behavior defaults to prompting if this action is in the context of the dynamic path, or not prompting if it is outside the dynamic path
prompt_more | boolean | value indicating whether the user should be prompted to watch more videos after finishing the first (optional, defaults to `false`)
backup | string | name of another video_* action that should be used if no videos are available from the given provider (optional)
requires_wifi | boolean |  value indicating whether the client should only play videos for this action if the user is on a wifi connection (optional, defaults to `false`)