# wedday

```
STATUS: working in progress
```



This if my first real world app  I am developing using flutter.
It is a sort of social network for guests of an wedding.


### The idea

People love to take and share pictures of their social life, specially in weddings.
The idea of the app is to make it simpler for the guests to get all the pictures the other guests are taking.
So no one needs to ask anybody to send the pictures over.


### Screenshots

<img src="https://firebasestorage.googleapis.com/v0/b/weddy-app-1.appspot.com/o/screens%2FSimulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202020-02-19%20at%2000.26.48.png?alt=media&token=6d50188d-f371-45c1-8b87-06e8447bee71" alt="" width="250"/><img src="https://firebasestorage.googleapis.com/v0/b/weddy-app-1.appspot.com/o/screens%2FSimulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202020-02-19%20at%2000.34.21.png?alt=media&token=73aa9005-f6d2-4245-866e-0db8e67592a7" alt="" width="250"/>

### Tecnologies

**Flutter**

**Flutter Modular** for the project structure and dependency incection

**MobX** for state management 

**API:** For the database I decided to use **GraphQL** so *Hasura* does all the heavy lifting;

**Authentication:** Hasura doesn't have authentication implemented (yet) but it allow us to acccess the api using JWT. So I use **Firebase** for authentication.
When the user is created I set a custom claim to the new user via **Cloud Functions** to set a signature that Hasura will understand
```
"https://hasura.io/jwt/claims": {
    "x-hasura-default-role": "user",
    "x-hasura-allowed-roles": ["user"],
    "x-hasura-user-id": user.uid
}
```
Whe the user is logged in I get the token generated by firebase and send it with the requests to Hasura.


### User journey
#### (TODO) : Creating the wedding
The marrying people download the app, register and create the wedding.
The app will generate a wedding passcode and attach it to the wedding ID.

The passcode will be needed for gue guests to access the wedding. 
So the merrying couple need to provide the code to all guests. 
THey can do it manually or by giving the app the email address of the guests, so the app send it to everybody.

#### Guest journey
The guest download the app and register to it.
The app will ask the guest to provide a 6 number code for the wedding.
On the home screen the user will be able to view all the pictures the other guests are posting and will be able to download them.

They can also see the list of  all guests.


<!-- ##### User registration details -->
<!-- The guest download the app and register to it.
After providing email and password the user is created on Firebase. 
Then on the next screen the user provides name and surname. 
On clicking `finish registration` button I create the user on Hasura as well

The id of the user will be the same id firebase created  -->

