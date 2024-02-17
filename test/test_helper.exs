Application.ensure_started(:ecto)
Application.ensure_started(:ielixir)
Code.ensure_loaded(Ecto.Adapter)
Application.start(:ielixir)
ExUnit.start(exclude: [:skip])

