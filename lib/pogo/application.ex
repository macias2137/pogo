defmodule Pogo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Pogo.Repo,
      # Start the Telemetry supervisor
      PogoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Pogo.PubSub},
      # Start the Endpoint (http/https)
      PogoWeb.Endpoint,
      # Start a worker by calling: Pogo.Worker.start_link(arg)
      # {Pogo.Worker, arg}
      Pogo.Scheduler
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Pogo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PogoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
