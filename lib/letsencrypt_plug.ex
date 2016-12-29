defmodule Letsencrypt.Plug do
  import Plug.Conn
  require Logger

  def init(options), do: options

  def call(conn = %{path_info: [".well-known", "acme-challenge", challenge]}, [token: token]) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "#{challenge}.#{token}")
  end
  def call(conn, _opts), do: conn
end
