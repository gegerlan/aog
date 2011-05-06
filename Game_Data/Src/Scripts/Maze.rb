class Maze
  def initialize(width, height)
    @maze = Array.new(width) { Array.new(height) {0} }
  end
  def set_target(target)
    @target = [target]
  end
  def plot(start=[0,0], stop=[0,0])
    y,x = start
    endy, endx = stop
    history = [] #the steps of the path taken
    blacklist = [] #locations that may not be traveled

    while(true)
      @maze[y][x] = 1
      if y == endy and x == endx
        break #we found our target
      end
      directions = get_valid_dir(y,x,blacklist)
      if directions != nil and directions.length != 0
        #blacklist = [] #memory is imporant
        history.push([y,x])
        y,x = directions[rand(directions.length)]
      else
        #If we can't move further, blacklist the current location and
        #take one step back
        @maze[y][x] = 0
        blacklist << [y,x]
        if history.length > 0
          y,x = history.pop
          blacklist << [y,x] #check if this is needed
        else
          break #we're back where we started, we can't solve this
        end
      end
    end
    return (y == endy and x == endx)
  end
  def paint(callback)
    #gs = $game_self_switches
    #mi = $game_map.map_id
    #s = "A"
    @maze.each_with_index do |line, y|
      line.each_with_index do |val, x|
        callback.call(y,x,val==1)
        #e = 6+x+(5*y)
        #gs[[mi,e,s]] = (val==1)
      end
    end
  end

  def in_range?(y,x) #check if values are within the maze
    if y >= 0 and x >= 0 and y < @maze.length and x < @maze[y].length
      return true
    end
    return false
  end
  def get_valid_dir(y,x,blacklist) #get the (valid) locations of the 4 directions
    ret = []
    [[y+1,x],[y-1,x],[y,x+1],[y,x-1]].each { |ny,nx|
      if in_range?(ny,nx) and @maze[ny][nx] == 0 and !blacklist.include?([ny,nx]) and !next_to?(ny,nx,y,x)
        ret.push([ny,nx])
      end
    }
    return ret.compact
  end
  def next_to?(y,x,oldy,oldx) #make sure we don't make a path into an existing one
    [[y+1,x],[y-1,x],[y,x+1],[y,x-1]].each { |ny,nx|
      if ny == oldy and nx == oldx
        next #ignore old x and y positions
      end
      if in_range?(ny,nx) and @maze[ny][nx] != 0
        return true
      end
    }
    return false
  end
end