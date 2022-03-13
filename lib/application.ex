defmodule UploadWithElixir.Application do
  use Application

  def start(_type, _args) do
    # I just put creds here in a real project you should use config
    credentials = %{
      # Fill it with your client id
      "client_id" => "...",
      # Fill it with your client secret
      "client_secret" => "...",
      # the token we got from the oauthplayground
      "refresh_token" => "..."
    }

    source = {:refresh_token, credentials, []}

    children = [
      {Goth, name: UploadWithElixir.Goth, source: source}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
