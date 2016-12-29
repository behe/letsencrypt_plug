defmodule Letsencrypt.PlugTest do
  use ExUnit.Case
  use Plug.Test

  @opts Letsencrypt.Plug.init([token: "eHNPOAQx0qDGp1B0e2EsMbY_5ZpuYZyEAb3KfvOTFBQ"])

  test "acme response" do
    conn = conn(:get, "/.well-known/acme-challenge/79QCloifQVobokcwSW1gjIKT0tg_A1rWDt3lAPoOJHE")
    conn = Letsencrypt.Plug.call(conn, @opts)

    assert conn.resp_body == "79QCloifQVobokcwSW1gjIKT0tg_A1rWDt3lAPoOJHE.eHNPOAQx0qDGp1B0e2EsMbY_5ZpuYZyEAb3KfvOTFBQ"
  end
end
