# Errors

Standard HTTP response codes should be used to communicate the status of a request, where a 2xx is successful, and a
4xx or 5xx represents an error. If the result is an error, instead of the standard JSON for the given call, an error
will be returned.

### Error Attributes

Attribute | Description
--------- | -----------
http_error_code | the HTTP error code returned from this request. Also included in this JSON response for debugging purposes
app_error_code |  a string representing the specific problem
log_message | a string defining the type of failure

```json
{
      "http_error_code" : 401,
      "app_code" : "Missing Registration Parameters",
      "log_message" : "Invalid Registration Request",
      "version_status" : {
              "latest_version" : "1.0.1",
              "min_version" : "0.1.0",
              "upgrade_required" : true,
              "upgrade_url" : "http://not.yet.specified/"
       }
}
```