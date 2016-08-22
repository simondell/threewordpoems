<% provide :page_title, 'Styleguide' %>

## Visual rhythm and grid

Using a 20px vertical rhythm, against a 4x4 grid. I'm making most of this up as I go rather than formally drawing it all against a grid (because I lack the skills to do this efficiently and I'm looking at a deadline). Some of my thinking is based on [this article by Richard Rutter][clagnut].

```sass
$grid: 4px;
$vertical-rhythm: $grid * 5;

html {
  font-size: $grid * 4;
}

body {
  font-size: 1rem;
  line-height: $vertical-rhythm;
}
```


## Colours

"Things" get colour-coded:

- <span class="yellow-on-red">Links and content for <i class="red-on-yellow">poems</i> use yellow on red</span>
- <span class="yellow-on-green">Links and content for <i class="green-on-yellow">poets</i> use yellow on green</span>
- <span class="green-on-blue">Links and content for <i class="blue-on-green">sessions</i> use green on blue</span>

Highlights, `:active` and `:hover` states use the inverse colours.


## Classes

As far as I can manage, elements are not grouped or defined by class names. Data types are identified by their mark-up, and the mark-up is chosen to best reflect the meaning or intent. For example, all "poems" use `<article>`s, poets **probably** use `<dl>`s. There are classes in the SASS, but used as source material for `@extend` directives.

The styleguide makes use of exceptions to this rule. Because.


## Mobile First & Layout

Information and relevant links should be as close to the top of the page as possible, with secondary information on separate pages reached by menus or links in the footer. Smaller screens need a little padding to stop content pressing on the screen edges. Larger screens which can accomodate a 960px wide `<body>` will drop the padding. I should probably express "mobile first" by not even having a mixin for setting properties for mobile screens, instead writing them as defaults... but I don't.

```sass
// use this mixin to set properties for different breakpoints
@mixin respond-to($media) {
  @if $media == handhelds {
    @media only screen and (max-width: 479px) { @content; }
  }
  @else if $media == wide-handhelds {
    @media only screen and (min-width: 480px) and (max-width: 767px) { @content; }
  }
  @else if $media == others {
    @media only screen and (min-width: 768px) { @content; }
  }
}

// use this to add gutters
@mixin gutters {
	@include respond-to(handhelds) { padding: 0 $grid * 2; }
	@include respond-to(wide-handhelds) { padding: 0 $grid * 3; }
}
```

The "gutter" padding described above is added to `h1..h6`, `p` and other content elements. Sectioning elements (`main`, `header` &amp;tc) do not have gutters.


## Headers

You can see an example of an `h1` at the top of the page.

```sass
header > p:first-child,
h1 {
	font-size: 32px;
	line-height: 40px;
	margin: 20px 0;
}
```

Sections of this styleguide are marked by `h2`s. They have more space at the top than beneath, and the line-height and margin-bottom together make two vertical rhythm "beats".

## Links

Links and buttons appear as text with no underline, emboldened and in a deeper colour than their surrounding body text. Links in the footer are not emboldened.

<p><a href="#">link</a></p>
<p><button type="button">button</button></p>

```html
<p><a href="#">link</a></p>
<p><button type="button">button</button></p>
```

```sass
body  { color: #555; }

a, button {
	color: #000;
	text-decoration: none;
	font-weight: 700;
}

```

Collections of links use the classic "list of links" mark-up:

```html
<ol>
	<li><a href="foo">Link 1</a></li>
	<li><a href="foo">Link 2</a></li>
	<li><a href="foo">Link 3</a></li>
<ol>
```

<p>Some link lists are presented horizontally, such as the princple navigation.</p>

```HTML
<header>
	<nav>
		<ol><!-- and the list items... --></ol>
	</nav>
</header>
```

```sass
@mixin controls {
  ol {
    display: flex;
    flex-flow: row nowrap;
    justify-content: flex-start;
  }

  li {
    margin-right: $grid * 4;
  }
}

nav {
  @include controls;
}
```


# Poems

Poems are represented by `article`s. Poems have images, text, attribution meta-data and controls (edit, delete &amp;tc). I've aimed for rich semantics.

```html
<%= render partial: 'poems/poem', locals: { poem: @example_poet.poems.first } %>
```
<div role="example">
  <%#= render partial: 'poems/poem', locals: { poem: @example_poet.poems.first } %>
</div>

<div role="example">
  <article>
    <img alt="" src="assets/images/oil_1920w.jpg" />
<!--     <img alt="" src="assets/images/oil_800w.jpg"
      srcset="assets/images/oil_640w.jpg 640w,
              assets/images/oil_800w.jpg 800w,
              assets/images/oil_1200w.jpg 1200w,
              assets/images/oil_1920w.jpg 1920w"
      sizes="100%, (min-width=960) 960px" />
 -->
    <div>
      <h1>Poems can have really long titles that fall into the margin-top of the poem they title.</h1>
      <p>Paragraphs for content</p>
      <footer>
        <ol>
          <li><a href="#edit">Edit</a></li>
          <li><a href="#delete">Delete</a></li>
        </ol>
      </footer>
    </div>
  </article>
</div>

[clagnut]: https://24ways.org/2006/compose-to-a-vertical-rhythm