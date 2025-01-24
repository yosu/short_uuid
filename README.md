# Short UUID

A simple short-uuid generator.

Based on:

- UUID v4
- base58 encoding
- Fixed length (22 characters)


```elixir
ShortUUID.generate() # "oNLNNGPqHR4Go5AAxtzAQc"
```

## Installation

```elixir
def deps do
  [
    {:short_uuid, "~> 1.0.0", github: "yosu/short_uuid", tags: "1.0.0"}
  ]
end
```
