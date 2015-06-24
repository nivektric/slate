# Hot Spots

Hot spots are used in various actions throughout the API to represent a tappable area of the screen, and the resulting
action that should be taken when a button is tapped.

> An sample hot spot with a URL

```json
{
    "x" : 177,
    "y" : 276,
    "width" : 132,
    "height" : 61,
    "image_url" : "http://www.livetowin.com/img/livetowin/assets/btn-250k.png",
    "link_url" : "http://www.livetowin.com/redirect/personalcreations/?uuid=undefined&sid==undefined"
}
```

> An sample hot spot with a link URL and secondary link URL

```json
{
    "x" : 177,
    "y" : 276,
    "width" : 132,
    "height" : 61,
    "image_url" : "http://www.livetowin.com/img/livetowin/assets/btn-250k.png",
    "link_url" : "fb://profile?id=498362580186733",
    "secondary_link_url" : "https://www.facebook.com/LiveToWinDailyGiveaway"
}
```

> A sample hot spot with a target action

```json
{
    "x" : 282,
    "y" : 27,
    "width" : 23,
    "height" : 23,
    "image_url" : "http://www.livetowin.com/img/livetowin/assets/inline_x.png",
    "target_action" : "app_nativex_nonincentivized"
}
```

### Attributes

Name | Type | Description
--------- | ---- | -----------
x | number | the horizontal starting point of this hot spot, in points from the left side of its container
y | number | the vertical starting point of this hot spot, in points from the left side of its container
width | number | the width, in points, of this hot spot
height | number | the height, in points, of this hot spot
image_url | string | the URL to load for the image for this hot spot
target_action | string | the name of an action to perform when a user taps this hot spot - must be omitted or `null` if link_url is specified
link_url | string | the URL to load when a user taps this hot spot - must be omitted or `null` if target_action is specified
secondary_link_url | string | optional parameter that specifies a backup URL if the device cannot handle link_url. This can be used to specify a native app link first, with a fallback to a web link if the user doesn't have the appropriate app installed

<aside class="warning">Only one of target_action or link_url may be specified. If both are specified,
 the behavior is undefined.
</aside>