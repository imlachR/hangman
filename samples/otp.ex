# spawn runs a function in a separate process. it takes either an anonymous function or an MFA

MFA # is short for Module, Function, Arguments
    # The module part is simply its name, 
    # The function is the function name as an atom, and 
    # The arguments are represented as a list. 
    # The number of elements in the argument list must match the arity of the function beign called.

spawn fn -> IO.puts("Hello") end
spawn fn -> Process.sleep(1000); IO.puts("Hello") end

#PID<0.109.0>  <- Process Identifier
Hello

r Procs # recompile

c "procs.exs" <- compile this file

iex(4)> Procs.hello("World")

#     Module name, Function name, A list of parameters we want to pass 
spawn Procs, :hello, ["World"]


1..10 |> Enum.each(fn _ -> spawn fn -> nil end end)

1..10 |> Enum.each(fn _ -> spawn fn -> nil; IO.puts "Hello!" end end)


1..100 |> Enum.each(fn _ -> spawn fn -> nil end end)
1..1000 |> Enum.each(fn _ -> spawn fn -> nil end end)
1..10000 |> Enum.each(fn _ -> spawn fn -> nil end end)
1..100000 |> Enum.each(fn _ -> spawn fn -> nil end end)

# How do we know it even started them?
# create a new observer window
iex> :observer.start()

spawn Procs, :hello, []
#PID<0.150.0>
pid = v(-1) 
send pid, "Hello"

Process.alive? pid   #  check if process is alive

pid = spawn Procs, :hello, []

send pid, [1, 2, 3]

pid = spawn Procs, :hello, [ 0 ]

send pid, "world"

receive do
  pattern_1 ->
    code_1

  pattern_2 ->
    code_2

    : :

  pattern_n ->
    code_n
end

pid = spawn_link Procs, :hello, [0]

send pid, { :crash, :kaboom }

send pid, { :crash, :normal }

##########

{:ok, counter} = Agent.start_link(fn -> 0 end)

Agent.get(counter, fn state -> state end)

Agent.update(counter, fn state -> state + 1 end)

Agent.get_and_update(counter, fn state -> { state, state + 1 } end)

Supervisors are nannies