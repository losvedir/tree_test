defmodule TreeTest.Sup2 do
  use Supervisor
  require Logger

  def start_link(_) do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    Logger.info("#{__MODULE__} init")

    Supervisor.init(
      [
        {TreeTest.Worker, id: 1},
        {TreeTest.Worker, id: 2}
      ],
      strategy: :one_for_one
    )
  end
end
