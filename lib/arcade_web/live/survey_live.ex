defmodule ArcadeWeb.SurveyLive do
  use ArcadeWeb, :live_view
  alias Arcade.Accounts

  def mount(_params, %{"user_token" => user_token}, socket) do
    {:ok, socket |> assign(:current_user, Accounts.get_user_by_session_token(user_token))}
  end
end
