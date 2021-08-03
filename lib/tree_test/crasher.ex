defmodule TreeTest.Crasher do
  use GenServer
  require Logger

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    Logger.info("#{__MODULE__} init")
    Process.send_after(self(), :crash, 10_000)
    {:ok, []}
  end

  def handle_info(:crash, state) do
    Logger.info("#{__MODULE__} crashing...")
    1 / 0
    {:noreply, state}
  end
end
