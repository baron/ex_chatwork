defmodule ExChatwork.Environment do

  def api_token do
    Application.fetch_env!(:ex_chatwork, :api_token)
  end

end
