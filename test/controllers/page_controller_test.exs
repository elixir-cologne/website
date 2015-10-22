defmodule Website.PageControllerTest do
  use Website.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "elixir.cologne"
  end
end
