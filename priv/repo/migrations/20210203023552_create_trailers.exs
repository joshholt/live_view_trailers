defmodule IdiotBox.Repo.Migrations.CreateTrailers do
  use Ecto.Migration

  def change do
    create table(:trailers) do
      add :title, :string
      add :description, :text
      add :poster, :string
      add :preview, :string
      add :release_date, :date

      timestamps()
    end

  end
end
