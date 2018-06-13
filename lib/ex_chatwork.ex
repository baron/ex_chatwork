defmodule ExChatwork do
  alias ExChatwork.Environment

  @doc """
  me
  """
  def me do
    "https://api.chatwork.com/v2/me"
    |> HTTPoison.get(headers())
    |> decode()
  end

  @doc """
  rooms
  """
  def rooms do
    "https://api.chatwork.com/v2/rooms"
    |> HTTPoison.get(headers())
    |> decode()
  end

  @doc """
  room
  """
  def room(room_id) do
    "https://api.chatwork.com/v2/rooms/#{room_id}"
    |> HTTPoison.get(headers())
    |> decode()
  end

  @doc """
  create message
  """
  def create_message(room_id, body) do
    "https://api.chatwork.com/v2/rooms/#{room_id}/messages"
    |> HTTPoison.post({:form, [body: body]}, headers())
    |> decode()
  end

  defp headers do
    [
      {"X-ChatWorkToken", Environment.api_token()}
    ]
  end

  defp decode(response) do
    case response do
      {:error, %HTTPoison.Error{reason: reason}} -> {:error, reason}
      {:ok, %HTTPoison.Response{body: body}} -> {:ok, Poison.decode!(body)}
    end
  end

end
