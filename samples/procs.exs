defmodule Procs do
  
  def hello(count) do
    receive do
      { :crash, reason } ->
        exit(reason)

      { :quit } -> 
        IO.puts "I'm outta here"

      { :add, n } -> 
        hello(count + n)

      msg -> 
        IO.puts("#{count} Hello #{inspect msg}")
        hello(count)
    end
  end

  # def hello(count) do
  #   receive do
  #     msg -> IO.puts("#{count} Hello #{inspect msg}")
  #   end
  #   hello(count + 1)
  # end

  # def hello() do
  #   receive do
  #     msg -> IO.puts("Hello #{inspect msg}")
  #   end
  #   hello()
  # end

  # def hello() do
  #   receive do
  #     msg -> IO.puts("Hello #{inspect msg}")
  #   end
  # end

  # def hello(name) do
  #   IO.puts("Hello #{name}")
  # end
end