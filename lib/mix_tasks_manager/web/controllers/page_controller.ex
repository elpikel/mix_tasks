defmodule MixTasksManager.Web.PageController do
  use MixTasksManager.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
