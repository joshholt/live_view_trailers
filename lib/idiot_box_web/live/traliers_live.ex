defmodule IdiotBoxWeb.TrailersLive do
  use IdiotBoxWeb, :live_view
  alias IdiotBox.Trailers

  def mount(_params, _session, socket) do
    trailers = Trailers.list_trailers()

    socket = assign(socket,
      trailers: trailers,
      current_preview: nil,
      current_preview_title: nil,
      current_preview_id: nil
    )
    {:ok, socket}
  end

  def handle_event("show-preview", %{"id" => id}, socket) do
    t = Trailers.get_trailer!(id)
    socket = assign(socket,
      trailers: socket.assigns.trailers,
      current_preview: t.preview,
      current_preview_title: t.title,
      current_preview_id: t.id
    )
    {:noreply, socket}
  end

  def handle_event("close-preview", _, socket) do
    socket = assign(socket,
      trailers: socket.assigns.trailers,
      current_preview: nil,
      current_preview_title: nil,
      current_preview_id: nil
    )
    {:noreply, socket}
  end
end
