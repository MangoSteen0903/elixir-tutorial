defmodule ElixirCards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards.
  """

  @doc """
    Returns of list of string representing a deck of playing cards.
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clovers", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{suit} - #{value}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @spec contains?(any, any) :: boolean
  @doc """
    Determines whether a deck contains a given card.
    ## Examples

        iex> deck = ElixirCards.create_deck()
        iex> ElixirCards.contains?(deck,"Spades - Ace")
        true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Divides a deck into a hand and the remainder of the deck.
  The `hand_size` arguments indicates how many cards should
  be in the hand.

  ## Examples
      iex> deck = ElixirCards.create_deck()
      iex> hand = ElixirCards.deal(deck,1)
      iex> hand
      ["Spades - Ace"]
  """
  def deal(deck, hand_size) do
    {hand, _} = Enum.split(deck, hand_size)
    hand
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _} -> "That File does not exists."
    end
  end

  def create_hand(hand_size) do
    ElixirCards.create_deck()
    |> ElixirCards.shuffle()
    |> ElixirCards.deal(hand_size)
  end
end
