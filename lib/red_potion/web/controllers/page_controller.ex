defmodule RedPotion.Web.PageController do
  use RedPotion.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
