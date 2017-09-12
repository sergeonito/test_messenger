# README

Simple messaging application

### Using
```
ruby-2.4.1
rails 5.1.3 - mvc web framework
postgresql - db storage
actioncable - integration of WebSockets with the rest of the Rails application
```

### Setup

Install all libraries:
```
gem install bundler --no-rdoc --no-ri
bundle
```

DB creation/seeding:

```
rails db:create db:migrate db:seed
```
 Can use seeded users
   
    login/password
    wood@mygmail.com/foo12345
    bloom@mygmail.com/foo12345
    tyler@mygmail.com/foo12345
    
 or go through sign up process 
 
### Running application

    rails s
    Navigate localhost:3000 in your browser
    
### Advantages

* Sign In/Sign Up
* Real time messaging
* If specific conversation is hidden, application shows popup message with counting unread messages

### Security

    ToDo:
    * Websockets connections are not isolated from outside 
    * Separate sending data for different conversations 
