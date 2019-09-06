defmodule DocuSignWeb.PageController do
  use DocuSignWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, _params) do
    render(conn, "index.html")
  end
end
