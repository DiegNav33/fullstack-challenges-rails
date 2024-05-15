## Background & Objectives

This is our second AJAX exercise. We will build an input with autocomplete capability. What's that? Head out to [Google](https://www.google.com/) for an example: as soon as you type **one** character in the input field, you get autocomplete suggestions underneath.

We want to build an autocomplete input with **Dictionary words**.

## Specs

Launch your local webserver with:

```bash
serve
```

There are three files you need to update:

- `index.html` - the input is already in place but there are some dummy elements in the autocomplete `ul` that you can remove
- `style.css` - add some style
- `lib/index.js` - you'll start here from scratch!

To get suggestions, you can use the following API:

```bash
GET https://dictionary.lewagon.com/autocomplete/:stem
```

Here, you will replace `:stem` with the characters typed by the user. As soon as the user enters a new character (`keyup` maybe?), you will trigger a new AJAX call. If you look at your "Network" tab in Chrome Inspector you should see something like this:

```bash
https://dictionary.lewagon.com/autocomplete/u
https://dictionary.lewagon.com/autocomplete/un
https://dictionary.lewagon.com/autocomplete/und
https://dictionary.lewagon.com/autocomplete/unde
https://dictionary.lewagon.com/autocomplete/under
etc.
```

When you receive the JSON from the API, your job is to update the `ul#results` list with suggestions!

Once you have the basic behavior, don't hesitate to try and make the `ul#results` look 🎨 really good 🎨 😋

![Animated gif of final goal, showing a list of auto sugesstions that pop up while typing.](https://raw.githubusercontent.com/lewagon/fullstack-images/3a1b80803f1fa3fc59b79530101847d852d21170/frontend/autocomplete.gif)
