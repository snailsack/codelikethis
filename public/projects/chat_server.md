# Chat Server

You've built the client; now rewrite the server using classes

Previous: write a [chat_client](chat) using plain objects

## Message Schema

Can be represented as a JSON object in a POST body or as a query string on GET requests

* when - a string in ISO8601 format
* body - a string
* author - a string

e.g.
```
{
    "when": "2018-07-15T20:00:47.696Z",
    "author": "alex",
    "body": "my dog has fleas"
}
```

## Step 1: Clone the repo & run the tests

```
git clone https://github.com/BurlingtonCodeAcademy/simple-server.git
cd simple-server
npm install
npx jasmine-node --verbose chat.spec.js
```

## Step 2: Make the tests pass

First, create three files:

`lib/message.js`:

```javascript
module.exports = class Message {
  
}
```

`lib/room.js`:

```javascript
module.exports = class Room {
  
}
```

`lib/house.js`:

```javascript
module.exports = class House {
  
}
```

Then run the tests and write code inside those files until all the tests pass.

> This step will take a while! 

If you don't understand the tests, ask a teacher to explain how to read tests in general, and what these tests are saying in particular.

## Step 3: Use your Message and Room objects from the server

Something like this:

before:

```
  function sendChatMessages(roomId, since) {
    let messages = rooms[roomId].messages;
    messages = messages.filter((message) => {
        return (message.when > since);
    });
    let data = JSON.stringify(messages);
    assistant.finishResponse('text/json', data);
  }
```

after:

```
  function sendChatMessages(roomId, since) {
    let room = house.roomWithId(roomId);
    let messages = room.messagesSince(since);
    let data = JSON.stringify(messages);
    assistant.finishResponse('text/json', data);
  }
```

