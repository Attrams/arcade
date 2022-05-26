defmodule ArcadeWeb.RatingLive.Index do
  use Phoenix.Component
  use Phoenix.HTML
  alias ArcadeWeb.RatingLive

  def games(assigns) do
    ~H"""
    <div class="survey-component-container">
      <.heading games={@games} />
      <.list games={@games} current_user={@current_user} />
    </div>
    """
  end

  def heading(assigns) do
    ~H"""
    <h2>
      Ratings
      <%= if ratings_complete?(@games), do: raw "&#x2713;" %>
    </h2>
    """
  end

  def list(assigns) do
    ~H"""
    <%= for {game, index} <- Enum.with_index(@games) do %>
      <%= if rating = List.first(game.ratings) do %>
        <h3>Show rating coming soon!</h3>
      <% else %>
        <h3>Rating form coming soon!</h3>
      <% end %>
    <% end %>
    """
  end

  defp ratings_complete?(games) do
    Enum.all?(games, fn game -> length(game.ratings) == 1 end)
  end
end
