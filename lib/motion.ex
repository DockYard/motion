defmodule Motion do
  @moduledoc """
  Commands for the Motion library
  """
  alias Phoenix.LiveView.JS

  @doc """
  Animates elements using motion.dev

      * `animations` - a map of animation types. See motion.dev for details
      * `settings` - a map of animation settings. See motion.dev for details

    ## Options

      * `:to` - An optional DOM selector to apply transitions to.
        Defaults to the interacted element.

    ## Examples

        <div id="box" phx-click={Motion.animate(%{x: 200, rotate: 180}, %{ease: "easeIn", duration: 2})}></div>
  """
  def animate(animations) when is_map(animations),
    do: animate(animations, [])

  def animate(animations, opts) when is_map(animations) and is_list(opts),
    do: animate(animations, %{}, opts)

  def animate(animations, settings) when is_map(animations) and is_map(settings),
    do: animate(animations, settings, [])

  def animate(animations, settings, opts) when is_map(animations) and is_map(settings) and is_list(opts),
    do: animate(%JS{}, animations, settings, opts)

  def animate(%JS{} = js, animations, settings \\ %{}, opts \\ []) do
    opts = Keyword.put(opts, :detail, %{animations: animations, settings: settings})
    JS.dispatch(js, "motion:animate", opts)
  end
end
