defmodule TokenGenerator do

  import Joken

  @project_issuer_type "project";

  def generate(api_key, api_secret) do
    current_time = :os.system_time(:second)
    default_expire_time = current_time + 180
    %{iss: api_key, ist: @project_issuer_type, iat: current_time, exp: default_expire_time, jti: Nanoid.generate()}
    |> token
    |> with_signer(hs256(api_secret))
    |> sign
  end

end