# Rendering Components Conditionally

* Components can be rendered using If/Else or a Ternary
* State within the Class or Function can be used in the conditions

```javascript
@@@javascript
UserGreeting = (props) => {
  return <h1>Welcome back!</h1>;
}

GuestGreeting = (props) => {
  return <h1>Please sign up.</h1>;
}

Greeting = (props) =>  {
  const isLoggedIn = props.isLoggedIn;
  if (isLoggedIn) {
    return <UserGreeting />;
  }
  return <GuestGreeting />;
}

ReactDOM.render(
  // Try changing to isLoggedIn={true}:
  <Greeting isLoggedIn={false} />,
  document.getElementById('root')
);

```

# React Elements as Variables - Components

```javascript
@@@javascript
function LoginButton(props) {
  return (
    <button onClick={props.onClick}>
      Login
    </button>
  );
}

function LogoutButton(props) {
  return (
    <button onClick={props.onClick}>
      Logout
    </button>
  );
}
```

# React Elements as Variables - Usage

```javascript
@@@javascript
class LoginControl extends React.Component {
  constructor (props) {
    super (props);
    this.handleLoginClick = this.handleLoginClick.bind(this);
    this.handleLogoutClick = this.handleLogoutClick.bind(this);
    this.state = { isLoggedIn: false };
  }

  handleLoginClick () {
    this.setState({ isLoggedIn: true });
  }

  handleLogoutClick () {
    this.setState({ isLoggedIn: false });
  }

  render () {
    const isLoggedIn = this.state.isLoggedIn;
    let button;

    if (isLoggedIn) {
      button = <LogoutButton onClick={ this.handleLogoutClick } />;
    } else {
      button = <LoginButton onClick={ this.handleLoginClick } />
    }

    return (
      <div>
        <Greeting isLoggedIn={ isLoggedIn } />
        { button }
      </div>
    );
  }
}
```

# Short Hand Logic Rendering

* The Locical And `Truthy/Falsy && someExpression`
* `truth && expression` is always true and evaluates `expression`
* `false && expression` is always false and evaluates `false`

```javascript
@@@javascript
function Mailbox(props) {
  const unreadMessages = props.unreadMessages;
  return (
    <div>
      <h1>Hello!</h1>
      {unreadMessages.length > 0 &&
        <h2>
          You have {unreadMessages.length} unread messages.
        </h2>
      }
    </div>
  );
}

const messages = ['React', 'Re: React', 'Re:Re: React'];
ReactDOM.render(
  <Mailbox unreadMessages={messages} />,
  document.getElementById('root')
);
```

[Example CodePen](https://codepen.io/Dangeranger/pen/ajPxBd)


# Inline Conditionals using Ternary

* One line Ternarys are fine
* Do not use nested Ternarys if possible
* Keep it simple

### Simple

```javascript
@@@javascript
class Greeting extends React.Component {
  constructor (props) {
    super (props)
    this.state = {
      isLoggedIn: false
    }
  }

  render() {
    const isLoggedIn = this.state.isLoggedIn;

    return (
      <div>
        The user is <b>{isLoggedIn ? 'currently' : 'not'}</b> logged in.
      </div>
    );
  }
}
```

### Complex

```javascript
@@@javascript
render() {
  const isLoggedIn = this.state.isLoggedIn;
  return (
    <div>
      {isLoggedIn ? (
        <LogoutButton onClick={this.handleLogoutClick} />
      ) : (
        <LoginButton onClick={this.handleLoginClick} />
      )}
    </div>
  );
}
```

# Preventing Component Rendering

```javascript
@@@javascript
function WarningBanner(props) {
  if (!props.warn) {
    return null;
  }

  return (
    <div className="warning">
      Warning!
    </div>
  );
}

class Page extends React.Component {
  constructor(props) {
    super(props);
    this.state = {showWarning: true};
    this.handleToggleClick = this.handleToggleClick.bind(this);
  }

  handleToggleClick() {
    this.setState(prevState => ({
      showWarning: !prevState.showWarning
    }));
  }

  render() {
    return (
      <div>
        <WarningBanner warn={this.state.showWarning} />
        <button onClick={this.handleToggleClick}>
          {this.state.showWarning ? 'Hide' : 'Show'}
        </button>
      </div>
    );
  }
}
```

[Example CodePen](https://codepen.io/Dangeranger/pen/BPvEqv?editors=0010)
