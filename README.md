# ExChatwork
simple HTTP client for [Chatwork](http://developer.chatwork.com/ja/).

## Installation
```elixir
def deps do
  [
    {:ex_chatwork, "~> 0.1.0"}
  ]
end
```

## Configuration
```elixir
use Mix.Config

config :ex_chatwork,
  api_token: ""
  
```

```bash
export API_TOKEN="YOUR API_TOKEN"
```

## License
MIT