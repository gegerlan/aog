if $game_exists
  Thread.new {system('Game')}
  exit
end
$game_exists = true
