defmodule UploadWithElixir do
  def video_insert do
    # get the token
    {:ok, token} = Goth.fetch(UploadWithElixir.Goth)

    # set the token
    conn = GoogleApi.YouTube.V3.Connection.new(token.token)

    # upload
    video_path = Path.expand("./sample.webm", __DIR__)

    GoogleApi.YouTube.V3.Api.Videos.youtube_videos_insert_simple(
      conn,
      ["snippet", "status"],
      "multipart",
      %GoogleApi.YouTube.V3.Model.Video{
        snippet: %GoogleApi.YouTube.V3.Model.VideoSnippet{
          title: "Test Video upload from elixir",
          description: "Description of the uploaded video"
        },
        status: %GoogleApi.YouTube.V3.Model.VideoStatus{
          privacyStatus: "private"
        }
      },
      video_path
    )
  end
end
