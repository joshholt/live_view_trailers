defmodule IdiotBox.TrailersTest do
  use IdiotBox.DataCase

  alias IdiotBox.Trailers

  describe "trailers" do
    alias IdiotBox.Trailers.Trailer

    @valid_attrs %{description: "some description", poster: "some poster", preview: "some preview", release_date: Date.utc_today(), title: "some title"}
    @update_attrs %{description: "some updated description", poster: "some updated poster", preview: "some updated preview", release_date: Date.utc_today(), title: "some updated title"}
    @invalid_attrs %{description: nil, poster: nil, preview: nil, release_date: nil, title: nil}

    def trailer_fixture(attrs \\ %{}) do
      {:ok, trailer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Trailers.create_trailer()

      trailer
    end

    test "list_trailers/0 returns all trailers" do
      trailer = trailer_fixture()
      assert Trailers.list_trailers() == [trailer]
    end

    test "get_trailer!/1 returns the trailer with given id" do
      trailer = trailer_fixture()
      assert Trailers.get_trailer!(trailer.id) == trailer
    end

    test "create_trailer/1 with valid data creates a trailer" do
      assert {:ok, %Trailer{} = trailer} = Trailers.create_trailer(@valid_attrs)
      assert trailer.description == "some description"
      assert trailer.poster == "some poster"
      assert trailer.preview == "some preview"
      assert trailer.release_date == Date.utc_today()
      assert trailer.title == "some title"
    end

    test "create_trailer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Trailers.create_trailer(@invalid_attrs)
    end

    test "update_trailer/2 with valid data updates the trailer" do
      trailer = trailer_fixture()
      assert {:ok, %Trailer{} = trailer} = Trailers.update_trailer(trailer, @update_attrs)
      assert trailer.description == "some updated description"
      assert trailer.poster == "some updated poster"
      assert trailer.preview == "some updated preview"
      assert trailer.release_date == Date.utc_today()
      assert trailer.title == "some updated title"
    end

    test "update_trailer/2 with invalid data returns error changeset" do
      trailer = trailer_fixture()
      assert {:error, %Ecto.Changeset{}} = Trailers.update_trailer(trailer, @invalid_attrs)
      assert trailer == Trailers.get_trailer!(trailer.id)
    end

    test "delete_trailer/1 deletes the trailer" do
      trailer = trailer_fixture()
      assert {:ok, %Trailer{}} = Trailers.delete_trailer(trailer)
      assert_raise Ecto.NoResultsError, fn -> Trailers.get_trailer!(trailer.id) end
    end

    test "change_trailer/1 returns a trailer changeset" do
      trailer = trailer_fixture()
      assert %Ecto.Changeset{} = Trailers.change_trailer(trailer)
    end
  end
end
