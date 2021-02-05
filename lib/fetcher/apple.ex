defmodule Fetcher.Apple do
  import SweetXml

  @api_url "https://trailers.apple.com/trailers/home/xml/current.xml"

  def fetch() do
    @api_url
    |> fetch_xml()
    |> format_response()

  end

  defp format_response({:ok, resp}) do
    resp
    |> xpath(~x"//movieinfo"l, title: ~x"./info/title/text()"s, description: ~x"./info/description/text()"s, release_date: ~x"./info/releasedate/text()"s, poster: ~x"./poster/xlarge/text()"s, preview: ~x"./preview/large/text()"s)
    |> Enum.map(fn(t) ->
      t = %{t | title: if(t.title in [" ", "", nil], do: "Not Available", else: t.title)}
      t = %{t | release_date: if(t.release_date in [" ", "", nil], do: Date.utc_today(), else: Date.from_iso8601!(t.release_date))}
      t
    end)
  end

  defp fetch_xml(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{body: body, status_code: 200}} ->
        {:ok, body |> SweetXml.parse }
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, :not_found}
      {:ok, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end
end
