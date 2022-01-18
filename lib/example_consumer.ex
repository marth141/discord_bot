defmodule ExampleConsumer do
  use Nostrum.Consumer

  alias Nostrum.Api

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    cond do
      String.match?(msg.content, ~r/69/) == true ->
        Api.create_message(msg.channel_id, "nice")

      true ->
        :ignore
    end

    case msg.content do
      "!ping" ->
        Api.create_message(msg.channel_id, "I copy and pasted this code")

      _ ->
        :ignore
    end
  end

  # Default event handler, if you don't include this, your consumer WILL crash if
  # you don't have a method definition for each event type.
  def handle_event(_event) do
    :noop
  end
end
