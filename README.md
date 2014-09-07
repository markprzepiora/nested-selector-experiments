# Nested selector performance experiments

## What is this?

Everyone tells you that nesting selectors kills CSS performance, but I've never
seen any experiments establishing whether this is actually true, and what kind
of gap there is.


## Details

These experiments generate two sets of HTML + CSS files. Each renders exactly
the same content with the same look, namely 5000 `<divs>`s containing a `<ul>`
with 10 `<li>`s. The `<ul>`s are nested inside of a number of other `<div>`s.

Each of the 5000 parent `<div>`s gets one of 100 classes called `container-1`
through `container-100`. The difference between the two generated pages is how
their descendants are styled.

1. The first, unnested, page defines a unique class name for every styled
   element.  For example, the `<li>` inside a container is styled with a class
   called `container-x-ul-li`.

2. The second, nested, page defines class names for the container `<div>`s, but
   its descendants are styled using nested selectors. For example, the `<li>`
   inside a container does not itself have a class name, but is styled using a
   selector like `.container-x ul li`.

Many on the blagosphere argue that the first style (perhaps with more
descriptive class names) offers better performance. The reason being that when
a browser sees a `<li>` in the second page, it must traverse its parents to see
which container it belongs to.

Based on a very unscientific reading of render times in the Chrome console,
there seems to be a negligible difference between the two styles, with the
nested style actually performing better in some cases. (Perhaps because the
first style increases the size of the HTML dramatically.)


## Todos

- Allow parameters to be definable from the command line:
    - Number of container classes
    - Number of rendered containers
    - Depth from the container to the leaves
- Add the rendering time straight into the page
    - This is harder than it sounds... some browsers (like Safari) seem to cheat
      and say the page is ready before it really is. Need to research a
      consistent way to report the rendering time.
