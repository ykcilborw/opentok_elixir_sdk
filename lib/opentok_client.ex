defmodule OpentokClient do

  @base_url "http://localhost:9999"

  def create_session(my_token) do
    endpoint = @base_url <> "/session/create"
    HTTPotion.post endpoint, [body: "", headers: ["X-TB-PARTNER-AUTH": ""]]
  end

  def get_health() do
    endpoint = @base_url <> "/server/health"
    HTTPotion.get endpoint
  end

  def validate_token(my_token) do
    endpoint = @base_url <> "/token/validate"
    HTTPotion.get endpoint, [body: "", headers: ["X-OPENTOK-AUTH": my_token, "Accept": "application/json"]]
  end
end