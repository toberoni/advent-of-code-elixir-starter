use Mix.Config
# config :advent_of_code, AdventOfCode.Input,
#   advent_of_code_session_cookie: "session=..."

try do
  import_config "secrets.exs"
rescue
  _ -> :ok
end
