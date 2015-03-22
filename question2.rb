def doesCircleExits(command)
  command_hash = {"x"=>{"L"=>"y", "R"=>"-y"}, "-x"=>{"L"=>"-y", "R"=>"y"}, "y"=>{"L"=>"x","R"=>"-x"}, "-y"=>{"L"=>"-x", "R"=>"x"}}
  add_quard_hash = {"x"=>[1, 0], "-x"=>[-1, 0], "y"=>[0, 1], "-y"=>[0, -1]}
  quard_hash = {0=>{0=>0}}
  position = "x"
  x_quard = 0
  y_quard = 0
  count= 0
  x=[0]
  y=[1]
  command.each_char do |action|
    if action == "G"
      x_quard += add_quard_hash[position][0]
      y_quard += add_quard_hash[position][1]
      x << x_quard
      y << y_quard
      count += 1 
      if quard_hash[x_quard]
        if quard_hash[x_quard][y_quard]
          for i in quard_hash[x_quard][y_quard]..count
            if x_quard[i] < 0 || x_quard[i] < 0
              break
            end 
          end
          if i == count
            return "YES"
          end
        else
          quard_hash[x_quard][y_quard] = count
        end
      else
        quard_hash[x_quard] = {y_quard=>count}
      end
    elsif action == "R" || action == "L"
      position = command_hash[position][action]
    else
      puts "command is not correct, contains #{action} which is not an action"
      return "NO"
    end
  end
  return x_quard == 0 && y_quard == 0 ? "YES" : "NO"
end

3,9 ,11 
def maxProfit(cost_per_cut, metal_price, lengths)
  rod = lengths.max
  hash = {}
  max_profit = 0
  for i in 2..rod
    profit = 0
    lengths.each do |length|
      x += length/i
    end
    profit = x*metal_price*i - x*cost_per_cut
    if profit > max_profit
      max_profit = profit
    end
  end
  return max_profit
end


