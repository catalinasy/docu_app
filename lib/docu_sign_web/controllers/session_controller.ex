defmodule DocuSignWeb.SessionController do
  use DocuSignWeb, :controller

  alias DocuSign.Accounts.Auth
  alias DocuSign.Repo

  def new(conn, _params) do
    render(conn, "new.html")
  end

  @spec create(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def create(conn, %{"session" => auth_params}) do
    case Auth.login(auth_params, Repo) do
      {:ok, user} ->
        conn
        |> put_session(:current_user_id, user.id)
        |> put_flash(:info, "Signed in successfully.")
        |> redirect(to: Routes.page_path(conn, :show))
      :error ->
        conn
        |> put_flash(:error, "There was a problem with your username/password")
        |> render("new.html")
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:current_user_id)
    |> put_flash(:info, "signed out successfully.")
    |> redirect(to: Routes.session_path(conn, :new))
  end
end
