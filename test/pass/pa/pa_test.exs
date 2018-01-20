defmodule Pass.PATest do
  use Pass.DataCase

  alias Pass.PA

  describe "pdas" do
    alias Pass.PA.PDA

    @valid_attrs %{pda_id: 42, pda_type: "some pda_type"}
    @update_attrs %{pda_id: 43, pda_type: "some updated pda_type"}
    @invalid_attrs %{pda_id: nil, pda_type: nil}

    def pda_fixture(attrs \\ %{}) do
      {:ok, pda} =
        attrs
        |> Enum.into(@valid_attrs)
        |> PA.create_pda()

      pda
    end

    test "list_pdas/0 returns all pdas" do
      pda = pda_fixture()
      assert PA.list_pdas() == [pda]
    end

    test "get_pda!/1 returns the pda with given id" do
      pda = pda_fixture()
      assert PA.get_pda!(pda.id) == pda
    end

    test "create_pda/1 with valid data creates a pda" do
      assert {:ok, %PDA{} = pda} = PA.create_pda(@valid_attrs)
      assert pda.pda_id == 42
      assert pda.pda_type == "some pda_type"
    end

    test "create_pda/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PA.create_pda(@invalid_attrs)
    end

    test "update_pda/2 with valid data updates the pda" do
      pda = pda_fixture()
      assert {:ok, pda} = PA.update_pda(pda, @update_attrs)
      assert %PDA{} = pda
      assert pda.pda_id == 43
      assert pda.pda_type == "some updated pda_type"
    end

    test "update_pda/2 with invalid data returns error changeset" do
      pda = pda_fixture()
      assert {:error, %Ecto.Changeset{}} = PA.update_pda(pda, @invalid_attrs)
      assert pda == PA.get_pda!(pda.id)
    end

    test "delete_pda/1 deletes the pda" do
      pda = pda_fixture()
      assert {:ok, %PDA{}} = PA.delete_pda(pda)
      assert_raise Ecto.NoResultsError, fn -> PA.get_pda!(pda.id) end
    end

    test "change_pda/1 returns a pda changeset" do
      pda = pda_fixture()
      assert %Ecto.Changeset{} = PA.change_pda(pda)
    end
  end
end
