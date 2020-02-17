# weddy

`STATUS: NOT COMPLETED - WORKING IN PROGRESS`


This if my first real world app  I am developing using flutter.
It is a sort of social network for guests of an wedding.

### Tecnologies

*Flutter*

*API:* For the database I decided to use *GraphQL* so *Hasura* does all the heavy lifting;

*Authentication:* Hasura doesn't have authentication implemented (yet) but it allow us to acccess the api using JWT. So I use *Firebase* to authentication.
When the user is created I set a custom claim to the new user via *Cloud Functions* to set a signature that Hasura will understand
```
"https://hasura.io/jwt/claims": {
    "x-hasura-default-role": "user",
    "x-hasura-allowed-roles": ["user"],
    "x-hasura-user-id": user.uid
}
```


### The idea

People love to take and share pictures of their social life, specially in weddings.
The idea of the app is to make it simpler for the guests to get all the pictures the other guests are taking.
So no one needs to ask anybody to send the pictures over.


#### User journey
##### Creating the wedding
The couple download the app and register 
