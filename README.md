# Marsrover

## Instructions

Run these commands from root directory to get the project running.

```elixir
mix deps.get
mix test
mix docs # This generates documentation
```

Documentation is generated when running mix.docs, in case further explanation is needed.

**Notes:**

* Added collision detection and out of bounds detection, code will crash on encountering these errors,
the assignment didn't say how to handle these.
  
* Execution of instructions is done recursively. Could probably be done in a cleaner way, but that'd be no fun.

* Some of the mission file functions should probably be moved to a helper file.
