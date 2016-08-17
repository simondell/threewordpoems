<% provide :page_title, 'Styleguide' %>

## visual rhythm and grid

I'm aiming for a 20px vertical rhythm, against a grid of 4x4. I'm making most of this up as I go rather than formally drawing it all against a grid (because I lack the skills to do this efficiently and I'm looking at a deadline). Some of my thinking is based on [this article by Richard Rutter][clagnut].

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


## Headers

Hopefully the above appears as a header.

## Links

Links and buttons appear as text with no underline.

<p><a href="#">link</a></p>
<p><button type="button">button</button></p>

```html
<p><a href="#">link</a></p>
<p><button type="button">button</button></p>
```

Collections of links use the classic "list of links" mark-up, with a twist:

```html
<ol>
	<li><a href="foo">Link 1</a></li>
	<li><a href="foo">Link 2</a></li>
	<li><a href="foo">Link 3</a></li>
<ol>
```

<p>Arguably, the ordering of links is defined, by the site creators, and as such the list should be an "ordered list", rather than an "unordered list".</p>

[clagnut]: https://24ways.org/2006/compose-to-a-vertical-rhythm