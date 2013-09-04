require '../../google_code_jam_helper.rb'

class P2013QRA
  include GoogleCodeJamHelper
  
  X_WON = 'X won'
  O_WON = 'O won'
  DRAW = 'Draw'
  NOT_COMPLETED = 'Game has not completed'
  
  def run(in_filenames)
    GoogleCodeJamHelper.process(in_filenames) do |fin|
      map = []
      
      4.times do
        map << fin.gets.strip.split(//)
      end
      fin.gets
      
      # X_WON
      is_game_win_c1 = true
      is_game_win_c2 = true
      (0..3).each do |i|
        is_game_win_x = true
        is_game_win_y = true
        (0..3).each do |j|
          if map[i][j] != 'X' && map[i][j] != 'T'
            is_game_win_x = false
          end
          if map[j][i] != 'X' && map[j][i] != 'T'
            is_game_win_x = false
          end
        end
        if is_game_win_x || is_game_win_y
          next X_WON
        end
        
        if map[i][i] != 'X' && map[i][i] != 'T' 
          is_game_win_c1 = false
        end
        if map[3-i][i] != 'X' && map[3-i][i] != 'T'
          is_game_win_c2 = false
        end
      end
      if is_game_win_c1 || is_game_win_c2
        next X_WON
      end
      
      # O_WON
      is_game_win_c1 = true
      is_game_win_c2 = true
      (0..3).each do |i|
        is_game_win_x = true
        is_game_win_y = true
        (0..3).each do |j|
          if map[i][j] != 'O' && map[i][j] != 'T'
            is_game_win_x = false
          end
          if map[j][i] != 'O' && map[j][i] != 'T'
            is_game_win_x = false
          end
        end
        if is_game_win_x || is_game_win_y
          next O_WON
        end
        
        if map[i][i] != 'O' && map[i][i] != 'T' 
          is_game_win_c1 = false
        end
        if map[3-i][i] != 'O' && map[3-i][i] != 'T'
          is_game_win_c2 = false
        end
      end
      if is_game_win_c1 || is_game_win_c2
        next O_WON
      end
      
      # NOT_COMPLETED
      (0..3).each do |i|
        (0..3).each do |j|
          next NOT_COMPLETED if map[i][j] == '.'
        end
      end
      
      # DRAW
      next DRAW
    end
  end
end

if $0 == __FILE__
  P2013QRA.new.run(%w(A-sample.in)) # A-small-practice.in A-large-practice.in
end