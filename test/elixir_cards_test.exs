defmodule ElixirCardsTest do
  use ExUnit.Case
  doctest ElixirCards

  test "create_deck makes 20 cards" do
    deck = ElixirCards.create_deck()
    assert length(deck) == 20
  end

  test "shuffling a deck randomizes it" do
    deck = ElixirCards.create_deck()
    refute deck == ElixirCards.shuffle(deck)
  end
end
