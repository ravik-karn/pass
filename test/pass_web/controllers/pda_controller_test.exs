defmodule PassWeb.PDAControllerTest do
  use PassWeb.ConnCase

  alias Pass.PA

  @create_attrs %{pda_id: 42, pda_type: "some pda_type"}
  @update_attrs %{pda_id: 43, pda_type: "some updated pda_type"}
  @invalid_attrs %{pda_id: nil, pda_type: nil}

  def fixture(:pda) do
    {:ok, pda} = PA.create_pda(@create_attrs)
    pda
  end

  describe "index" do
    test "lists all pdas", %{conn: conn} do
      conn = get conn, pda_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Pdas"
    end
  end

  describe "new pda" do
    test "renders form", %{conn: conn} do
      conn = get conn, pda_path(conn, :new)
      assert html_response(conn, 200) =~ "New Pda"
    end
  end

  describe "create pda" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, pda_path(conn, :create), pda: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == pda_path(conn, :show, id)

      conn = get conn, pda_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Pda"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, pda_path(conn, :create), pda: @invalid_attrs
      assert html_response(conn, 200) =~ "New Pda"
    end
  end

  describe "edit pda" do
    setup [:create_pda]

    test "renders form for editing chosen pda", %{conn: conn, pda: pda} do
      conn = get conn, pda_path(conn, :edit, pda)
      assert html_response(conn, 200) =~ "Edit Pda"
    end
  end

  describe "update pda" do
    setup [:create_pda]

    test "redirects when data is valid", %{conn: conn, pda: pda} do
      conn = put conn, pda_path(conn, :update, pda), pda: @update_attrs
      assert redirected_to(conn) == pda_path(conn, :show, pda)

      conn = get conn, pda_path(conn, :show, pda)
      assert html_response(conn, 200) =~ "some updated pda_type"
    end

    test "renders errors when data is invalid", %{conn: conn, pda: pda} do
      conn = put conn, pda_path(conn, :update, pda), pda: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Pda"
    end
  end

  describe "delete pda" do
    setup [:create_pda]

    test "deletes chosen pda", %{conn: conn, pda: pda} do
      conn = delete conn, pda_path(conn, :delete, pda)
      assert redirected_to(conn) == pda_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, pda_path(conn, :show, pda)
      end
    end
  end

  defp create_pda(_) do
    pda = fixture(:pda)
    {:ok, pda: pda}
  end
end
