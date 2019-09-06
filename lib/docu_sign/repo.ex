defmodule DocuSign.Repo do
  use Ecto.Repo,
    otp_app: :docu_sign,
    adapter: Ecto.Adapters.Postgres
end
