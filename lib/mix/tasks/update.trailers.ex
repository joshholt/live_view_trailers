defmodule Mix.Tasks.Update.Trailers do
  use Mix.Task

  alias Fetcher.Apple
  alias IdiotBox.Trailers
  alias IdiotBox.Trailers.Trailer

  @shortdoc "Fetch the latest movie trailers availbe from Apple and store them in the db."

  @moduledoc """
    This mix task will leverage a client that fetch the current movie trailers from Apple in XML format
    parse them and then store them in the database.
  """

  def run(_args) do
    Mix.Task.run("app.start")
    trailers = Apple.fetch
    Enum.each(trailers, fn(t) ->
      case Trailers.create_trailer(t) do
        {:ok, %Trailer{} = trailer} ->
          IO.puts("Inserted #{trailer.title} with ID: #{trailer.id}")
        {:error, %Ecto.Changeset{} = cs} ->
          IO.puts("Insert failed for ChangeSet: #{cs}")
      end
    end)
  end
end
