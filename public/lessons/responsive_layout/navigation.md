# Page Navigation

  * Finding the way around a site can be challenging without guidance
  * There are tools which can help the end user locate parts of the site

# Anchors aweigh!

  * Navigation relies on [Anchors](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a) (aka `<a>` tags)

[Internal Navigation Example](/lessons/responsive_layout/navigation-anchors-internal.html)

[External Navigation Example](/lessons/responsive_layout/navigation-anchors-external-0.html)

# Navigation Bars

* Common component of web pages
* Shape the way users think about the site
* Several ways to build them
* Flexbox makes building these much easier

# Navigation Bars Example - Floats

<p data-height="450" data-theme-id="0" data-slug-hash="KGmPVZ" data-default-tab="css,result" data-user="Dangeranger" data-pen-title="topnav-example" class="codepen">See the Pen <a href="https://codepen.io/Dangeranger/pen/KGmPVZ/">topnav-example</a> by Joshua Burke (<a href="https://codepen.io/Dangeranger">@Dangeranger</a>) on <a href="https://codepen.io">CodePen</a>.</p>
<script async src="https://static.codepen.io/assets/embed/ei.js"></script>

# Navigation Bars Example - List

<iframe height="50" width="575" src="./navigation-bars-example-better.html" marginheight="0" marginwidth="0" scrolling="auto" width="100%" height="100%"></iframe>

[Better Nav Bar Example](./navigation-bars-example-better.html)

# Navigation Bars Example Complete

Follow the link to see a fairly complete navigation bar with internally linked content that includes:

  * Full-width nav bar
  * Fixed postion on scroll
  * Hover state style change
  * Borders around all items

## New CSS

```css
@@@css

#nav {
  position: fixed;
  width: 100%;
}

#nav li:first-child {
  border-left: 1px solid #ccc;
}

#nav li a:hover {
  color: #40f;
  background-color: #fff;
}

.section {
  margin-top: 3em;
}
```

<iframe height="300" width="575" src="./navigation-bars-example.html" marginheight="0" marginwidth="0" scrolling="auto" width="100%" height="100%"></iframe>

[Complete Example HTML](./navigation-bars-example.html)

# Navigation Bars Example Flexbox

* Flexbox can make laying out a responsive navigation bar much easier

<iframe height="300" width="575" src="./navigation-bars-flexbox.html" marginheight="0" marginwidth="0" scrolling="auto" width="100%" height="100%"></iframe>

[Example Flexbox Navigation](./navigation-bars-flexbox.html)
