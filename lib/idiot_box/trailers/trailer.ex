defmodule IdiotBox.Trailers.Trailer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trailers" do
    field :description, :string
    field :poster, :string
    field :preview, :string
    field :release_date, :date
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(trailer, attrs) do
    trailer
    |> cast(attrs, [:title, :description, :poster, :preview, :release_date])
    |> validate_required([:title, :description, :poster, :preview, :release_date])
  end
end
