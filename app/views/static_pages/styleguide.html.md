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

Collections of links use the classic "list of links" mark-up, with a twist:

```html
<ol>
	<li><a href="foo">Link 1</a></li>
	<li><a href="foo">Link 2</a></li>
	<li><a href="foo">Link 3</a></li>
<ol>
```

<p>Arguably, the ordering of links is defined, and as such the list should be an "ordered list", rather than an "unordered list".</p>

<p>Some link lists are presented horizontally, such as the princple navigation.</p>

```HTML
<header>
	<nav>
		<ol><!-- and the list items... --></ol>
	</nav>
</header>
```

```sass
```

[clagnut]: https://24ways.org/2006/compose-to-a-vertical-rhythm