# Short UUID

A simple short-uuid generator.

Based on:

- UUID v4
- base58 encoding
- Fixed length (22 characters)


```elixir
ShortUUID.generate() # "oNLNNGPqHR4Go5AAxtzAQc"
```

## Ecto support

ShortUUID implements Ecto.ParameterizedType behaviour with autogenerate UUIDs with prefix option.

```elixir
demodule MyApp.Post do
  use Ecto.Schema

  # generates: "pst_oNLNNGPqHR4Go5AAxtzAQc"
  @primary_key {:id, ShortUUID, autogenerate: true, prefix: "pst_"}
  schema "posts" do
    field :title, :string
  end
end
```


## Installation

```elixir
def deps do
  [
    {:short_uuid, "~> 1.1", github: "yosu/short_uuid", tags: "1.1.0"}
  ]
end
```
