### A simulation for the Monty Hall Problem
# Marco Smolla, 2017
# For more information see: https://en.wikipedia.org/wiki/Monty_Hall_problem and
# Vazsonyi, Andrew. "Which door has the Cadillac." Decision Line 30.1 (1999): 17-19. https://sites.oxy.edu/lengyel/M372/Vazsonyi2003/vazs30_1.pdf

# Libraries
using Distributions

# Initiate counters
rounds = 10^6
stayWins = switchWins = 0

# Loop
for i in 1:rounds
  # Hide Cadillac
  car = sample(1:3, 1)[1]
  # Player chooses a door
  player = sample(1:3, 1)[1]
  # Remaining options of doors to be opened without opening the door with the Cadillac
  doorsLeft = setdiff(1:3, (car[1],player[1]))
  # Host opens a door with goat
  host = sample(doorsLeft, 1)[1]
  # Player decides to switch or to stay
  stay = sample([true, false],1)[1]
  if stay
    playerFinal = player
  else
    playerFinal = setdiff(1:3, (player, host))[1]
  end
  # Cadillac found?
  if playerFinal == car && stay
    stayWins = stayWins + 1
  elseif playerFinal == car && !stay
    switchWins = switchWins + 1
  end
end

println("Switch wins: ",round(Int, 100*(switchWins/sum([switchWins,stayWins]))), "% of won rounds.")
println("Stay wins: ",round(Int, 100*(stayWins/sum([switchWins,stayWins]))), "% of won rounds.")
