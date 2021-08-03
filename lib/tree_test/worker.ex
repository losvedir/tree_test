defmodule TreeTest.Worker do
  use GenServer
  require Logger

  def child_spec(opts) do
    id = Keyword.fetch!(opts, :id)

    %{
      id: id,
      start: {__MODULE__, :start_link, [:ok]}
    }
  end

  def start_link(:ok) do
    GenServer.start_link(__MODULE__, [])
  end

  def init(_) do
    Logger.info("#{__MODULE__} init")
    {:ok, []}
  end
end
