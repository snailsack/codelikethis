# Truthiness

Computers have a very particular idea of when things are *true* and *false*.

# True or False?

Try the following in node:

* `1 < 2`
* `2 + 2 < 4`
* `2 + 2 <= 4`
* `"anonymous".endsWith("us")`
* `"every journey".startsWith("a step")`

# Comparisons

*Comparison operators* let you compare two values. JavaScript has all the usual suspects...

|Operator|Comparison|
|---|---|
| `<` | less than |
| `>` | greater than |
| `<=` | less than or equal to |
| `>=` | greater than or equal to |
| `==` | equal to |
| `!=` | not equal |
| `===` | *really* equal to |
| `!==` | *really* not equal to |

[MDN: comparison operators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Comparison_Operators)

These are also called "Boolean operators" after *[George Boole](https://en.wikipedia.org/wiki/George_Boole)*, 
a 19th-century mathematician who invented [Boolean algebra](https://en.wikipedia.org/wiki/Boolean_algebra).)

# Conditions

The magic word `if` is a CONDITIONAL.

The phrase immediately after `if` is a CONDITION.

    @@@ js
    if (age < 18) {
      console.log("Sorry, you can't vote yet.");
    }

|phrase|meaning|
|---|---|
| `if (` ... `)`      | **if** this condition's value is *truthy* |
| `{` ... `}`         | **then** run this block of code |

Wait a second. "Truthy?"

[MDN: if...else](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/if...else)

# What is truthiness?

![Truthiness](../images/truthiness.png)

All values are truthy unless they are defined as falsy.

[MDN: Truthy](https://developer.mozilla.org/en-US/docs/Glossary/Truthy)

# What is falsiness? 

`false`, `null`, `undefined`, `0`, `NaN`, and the empty string (`""`) are all falsy.

Fortunately, `true` is truthy and `false` is falsy.  

Unfortunately, the string `"false"` is truthy, and the string `"0"` is truthy, even though the number `0` is falsy.
    
[MDN: Falsy](https://developer.mozilla.org/en-US/docs/Glossary/Falsy)
    
# if... then... else...

The magic word `else` allows **BRANCHING**.

    @@@ js
    if (age >= 18) {
      console.log("allowed");
    } else {
      console.log("denied");
    }

Like a fork in the road, the program chooses one path or the other.

It takes the first path if the condition is truthy, and takes the second path if the condition is falsy.

# 2 + 2 = ?

Sadly, this mathematical expression:

    2 + 2 = 4
    
causes an error. You need to do

    2 + 2 == 4

instead. Why?

# The Tragedy of the Equal Sign

* a single equal sign means ASSIGNMENT
  * `name = "Alice"` -- "assign the value 'Alice' to the variable 'name'"
* two equal signs means COMPARISON
  * `name == "Alice"` -- "does the variable 'name' contain the string 'Alice'?"

> This is confusing, and you should feel confused.

# A Notorious Bad Idea

> "A **notorious example for a bad idea** was the choice of the equal sign to denote assignment. It goes back to Fortran in 1957 and **has blindly been copied by armies of language designers**. Why is it a bad idea? Because it overthrows a century old tradition to let "=" denote a comparison for equality, a predicate which is either true or false. But Fortran made it to mean assignment, the **enforcing** of equality... `x = y` does not mean the same thing as `y = x`."
>
> — [Niklaus Wirth](https://en.wikipedia.org/wiki/Niklaus_Wirth), Good Ideas, Through the Looking Glass (2005)

see also http://en.wikipedia.org/wiki/Assignment_%28computer_science%29#Assignment_versus_equality

# The Tragedy of the Threequal Sign

In addition to `=` and `==`, JavaScript also has `===`.

That's three equal signs in a row.

|Operator|Operation|Example|Meaning|
|---|---|---|---|
| `=`   | assignment         | `X = Y`  | let X equal Y |
| `==`  | comparison (fuzzy) | `X == Y` | does X *mostly* equal Y? |
| `===` | comparison (exact) | `X === Y`  | does X *really* equal Y? |

`==` means "does X equal Y, or if not, can Y be *converted* into something that equals X?"

Since the rules for type conversion are confusing, most JavaScript experts recommend the following:

> always use `===`, never use `==`

# Conjunction Junction

You can make more complicated logical expressions using conjunctions:

|Conjunction|Operator|Example|Meaning|
|---|---|---|---|
| AND | `&&` | `X && Y` | "are both X and Y true?" |
| OR | <code>&#124;&#124;</code> | <code>X &#124;&#124; Y</code> | "is either X or Y (or both) true?" |
| NOT | `!`  | `!X` | "is X false?" |

For example:

```js
@@@ js
if (age >= 18 || parent.gavePermissionSlip()) {
  console.log("allowed");
} else {
  console.log("denied");
}
```

[MDN: logical operators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Logical_Operators)

# LAB: Good Friend, Bad Friend

* Your `hello.js` program should currently look something like this:

        @@@ js
        console.log("What is your name?");
        process.stdin.on('data', (chunk) => {
            let name = chunk.toString(); 
            console.log("Hello, " + name + "!"); 
        });

* Now change `hello.js` so that it doesn't always say hello!
  * If the user's name is "Darth" then say "Noooooo! Go away, Darth!"

# Lab: Infinite Names

* Change `name.js` so it keeps asking for names forever...
  * ...unless and until someone says their name is "bye!"
  * then it stops and exits back to the terminal

# LAB: Enemies List

* Change `hello.js` so that it says "Go away!" if the user's name is any one of a number of evil names
* For instance, Voldemort, Satan, Lex Luthor...
* Bonus: don't let enemies sneak in even if they spell their names with capital letters, like `VolDeMort`

