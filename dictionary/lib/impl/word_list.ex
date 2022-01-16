defmodule Dictionary.Impl.WordList do

  @type t :: list(String)

  # @word_list "assets/words.txt" # at compile time
  #   |> File.read!()
  #   |> String.split(~r/\n/, trim: true)

  @spec word_list :: t
  def word_list do # at run time
    "../../assets/words.txt"
      |> Path.expand(__DIR__) 
      |> File.read!()
      |> String.split(~r/\n/, trim: true)
  end

  @spec random_word(t) :: String.t
  def random_word(word_list) do
    word_list
    |> Enum.random()
  end
end
