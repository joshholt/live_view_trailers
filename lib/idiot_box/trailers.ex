defmodule IdiotBox.Trailers do
  @moduledoc """
  The Trailers context.
  """

  import Ecto.Query, warn: false
  alias IdiotBox.Repo

  alias IdiotBox.Trailers.Trailer

  @doc """
  Returns the list of trailers.

  ## Examples

      iex> list_trailers()
      [%Trailer{}, ...]

  """
  def list_trailers do
    Repo.all(Trailer)
  end

  @doc """
  Gets a single trailer.

  Raises `Ecto.NoResultsError` if the Trailer does not exist.

  ## Examples

      iex> get_trailer!(123)
      %Trailer{}

      iex> get_trailer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_trailer!(id), do: Repo.get!(Trailer, id)

  @doc """
  Creates a trailer.

  ## Examples

      iex> create_trailer(%{field: value})
      {:ok, %Trailer{}}

      iex> create_trailer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_trailer(attrs \\ %{}) do
    %Trailer{}
    |> Trailer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a trailer.

  ## Examples

      iex> update_trailer(trailer, %{field: new_value})
      {:ok, %Trailer{}}

      iex> update_trailer(trailer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_trailer(%Trailer{} = trailer, attrs) do
    trailer
    |> Trailer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a trailer.

  ## Examples

      iex> delete_trailer(trailer)
      {:ok, %Trailer{}}

      iex> delete_trailer(trailer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_trailer(%Trailer{} = trailer) do
    Repo.delete(trailer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking trailer changes.

  ## Examples

      iex> change_trailer(trailer)
      %Ecto.Changeset{data: %Trailer{}}

  """
  def change_trailer(%Trailer{} = trailer, attrs \\ %{}) do
    Trailer.changeset(trailer, attrs)
  end
end
