defmodule MixTasksManager.GithubAuth do
  @moduledoc """
  Retrieve the user information from an auth request
  """
  alias Ueberauth.Auth

  def create_user(%Auth{} = auth) do
    {:ok, %{id: auth.uid, name: name_from_auth(auth), avatar: auth.info.urls.avatar_url}}
  end

  defp name_from_auth(auth) do
    if auth.info.name do
      auth.info.name
    else
      name = [auth.info.first_name, auth.info.last_name]
      |> Enum.filter(&(&1 != nil and &1 != ""))

      cond do
        length(name) == 0 -> auth.info.nickname
        true -> Enum.join(name, " ")
      end
    end
  end
end
