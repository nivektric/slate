# Authentication

For most requests authentication will not be necessary. To register, the user (app) will be required to provide:

* a name (either a full name or just a first name and last initial)
* an email address
* a password
* a unique user identifier (uuid)

Alternatively, the the user can also register through a Facbook authentication process.  In this case, the app will
provide:

* a facebook authentication token
* a unique user identifier (uuid)
And then the server will look up:
* the user’s name
* their facebook id
* and their email address


Both the email address and the unique user identifier (uuid) will be mapped to the account record on the server.  If a
user has the app installed on multiple devices each installation of the app will use the same uuid, and email address
(so they will all be mapped to the same account).  If the user has enabled iCloud services on his mobile devices prior
to registration the app will attempt to check for an existing the LiveToWin uuid value. In the case a LiveToWin uuid
has been stored there, it will not be necessary for the LiveToWin Mobile app to register.  (It can just go fetch all
the data using the uuid value.)

When the user has not enabled iCloud services on his mobile devices registration on the second device will proceed like
it did on the initial device (the user will see a new user registration page).  In this case the user can fill out
the registration form and submit the registration or they can go to a login screen (where they only have to specify
email address and password; or login via FaceBook).  If it turns out the user has already registered, the server will
detect this then the uuid passed in with the registration will be ignored, and the uuid associated with the first
device will be passed back as data in the registration response.  Note:  If the user registers via FaceBook on the
first device, in order to unify their account, they will need to register/login on subsequent device(s) via FaceBook.

Similarly if the user registers via “Email Address/Password” on the first device, in order to unify their account,
they will need to register/login on subsequent device(s) via “Email Address/Password”.

After registration, email address and password (or facebook id and facebook authentication token) will only be be
required to authenticate requests to: change settings (note the user can’t change email address or
password with facebook auth token) and requests to claim a prize.

All other user specific requests will require only the uuid to identify the user.