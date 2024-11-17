# Motion

**LiveView commands for the motion library**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `motion` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:motion, "~> 0.1.0"}
  ]
end
```

For now you must vendor motion and add the event listener:

Download motions.js from the CDN: https://motion.dev/docs/quick-start#cdn
into your `assets/vendor` directory

and import it in your app.js

```js
import { animate } from "../vendor/motion"
```

then add an event listener for `"motion:animate"`:

```js
window.animate = animate;

window.addEventListener("motion:animate", e => {
  window.animate(e.target, e.detail.animations, e.detail.settings);
})
```

Then you can use `Motion.animate` similar to other `Phoenix.LiveView.JS` commands.

See the `Motion` module for documentation on calling that function.

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/motion>.
