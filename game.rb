class Game

  @@board = [[nil,nil,nil],[nil,nil,nil],[nil,nil,nil]] # not the fanciest array, but it works
  #    level:row       [null],       [null],       [null]
  #    level:row       [null],       [null],       [null]
  #                    index:column  index:column  index:column
  @@debug = true



  def play_game

  end


  #BOARD_FULL METHOD///////////////////////////////////////////////////
  #RUNS THROUGH ENTIRE board[][] ARRAY AND CHECKS FOR SINGLE nil VALUE
  def board_full
    for level in 0..2
      for index in 0..2
        #debug
        if self.debug puts('board_full testing coordinate['+level.to_s+']['+index.to_s+']#value'+self.board[level][index].to_s)
        end
        if self.board[level][index] == nil
          return false
        end
      end
    end
    return true
  end #END BOARD_FULL METHOD///////////////////////////////////////////////////


  #TEST_COORDINATE METHOD(INT GRID_INDEX, CHAR PLAYER)///////////////////////////////////////////////////
  #TESTS THE SINGLE INT REPRESENTATION OF THE GRID INDEX TO TWO COORDINATE
  #VALUES (ROW,COLUMN) AND TESTS OCCUPATION @ COORDINATE POINT
  # @return [boolean]
  def test_coordinate(grid_index)

    #testing for valid coordinate
    if grid_index > 9
      #debug
      if self.debug puts('test_coordinate('+grid_index.to_s+')returned false #not valid coordinate')
      end
      return false
    end

    # finding row
    if grid_index <= 3
      level = 0
    elsif grid_index <= 6
      level = 1
    else
      level = 2
    end

    #finding column
    index = grid_index % 3
    if grid_index == 0
      index = 2
    else
      index = index - 1
    end

    #debug
    if self.debug puts('test_coordinate('+grid_index.to_s+')testing ['+level.to_s+']['+index.to_s+']')
    end
    if self.debug display
    end

    #return
    if self.board[level][index] == 'X' ||  self.board[level][index] == 'O'
      #debug
      if debug puts('test_coordinate('+grid_index.to_s+')returning true #coordinate is empty')
      end
      return false
    end
    #debug
    if self.debug puts('test_coordinate('+grid_index.to_s+')returning false #coordinate is full')
    end
    return true

  end #END TEST_COORDINATE METHOD///////////////////////////////////////////////////


  #PLACE_COORDINATE METHOD(INT GRID_INDEX, CHAR PLAYER)///////////////////////////////////////////////////
  #BREAKS DOWN A SINGLE INT REPRESENTATION OF THE GRID INDEX TO TWO COORDINATE
  #VALUES (ROW,COLUMN) AND PLACES PLAYER CHAR @ COORDINATE POINT
  #NEEDS TEST_COORDINATE(INT GRID_INDEX) @boolean BEFORE USE
  # @return [nil]
  def place_coordinate(grid_index, player)
    # finding row
    if grid_index <= 3
      level = 0
    elsif grid_index <= 6
      level = 1
    else
      level = 2
    end

    #finding column
    index = grid_index % 3
    if grid_index == 0
      index = 2
    else
      index = column - 1
    end

    #place character
    self.board[level][index] = player

    #debug
    if self.debug puts('place_coordinate('+grid_index.to_s+', '+player.to_s+')@ board['+level.to_s+']['+index.to_s+']')
    end
    if self.debug self.display
    end

  end #END PLACE_COORDINATE METHOD///////////////////////////////////////////////////



  #CHECK_WIN METHOD(CHAR PLAYER)///////////////////////////////////////////////////
  #CHECKS ALL POSSIBLE ROWS, COLUMNS, AND DIAGONALS FOR 3 CONSECUTIVE PLAYER CHAR
  # @return [boolean]
  def check_win(player)
    #testing rows
    for level in 0..2
      next if this.board[level][0] != player
      next if this.board[level][1] != player
      if this.board[level][2] == player
        puts('Player '+player.to_s+' won on row '+level.to_s)
        return true
      end
    end

    #testing columns
    for index in 0..2
      next if this.board[0][index] != player
      next if this.board[1][index] != player
      if this.board[2][index] == player
        puts('Player '+player.to_s+' won on column '+index.to_s)
        return true
      end
    end

    #testing diagonals
    if this.board[0][0] == player && this.board[1][1] == player && this.board[2][2] == player
      puts('Player '+player.to_s+' won on diagonal\\')
      return true
    elsif this.board[0][2] == player && this.board[1][1] == player && this.board[2][2] == player
      puts('Player '+player.to_s+' won on diagonal/')
      return true
    end
  end #END CHECK_WIN METHOD///////////////////////////////////////////////////



  #TEST_COLUMN METHOD(CHAR PLAYER)///////////////////////////////////////////////////
  #THIS METHOD TESTS FOR A SPECIFIC CASE FOR 2 PLAYER CHAR VALUES AND nil
  #VALUE ALONG ANY POSSIBLE COLUMN AND RETURN THE COLUMN INDEX THAT MEATS THE
  #CONDITION
  # @return [int]
  def test_column(player)
    op_player = nil
    if player == 'X'
      op_player = 'Y'
    else
      op_player = 'X'
    end

    op_player_counter = 0
    player_counter = 0

    for index in 0..2
      for level in 0..2
        player_counter++ if self.board[level][index] == player
                         end
        op_player_counter++ if self.board[level][index] == op_player
                            end
      end
      if player_counter == 2 && op_player_counter == 0
        return index
      end
      op_player_counter = 0
      player_counter = 0
    end

    return 20
  end #END TEST_COLUMN METHOD///////////////////////////////////////////////////


  #TEST_ROW METHOD(CHAR PLAYER)///////////////////////////////////////////////////
  #THIS METHOD TESTS FOR A SPECIFIC CASE FOR 2 PLAYER CHAR VALUES AND nil
  #VALUE ALONG ANY POSSIBLE ROW AND RETURN THE ROW INDEX THAT MEATS THE
  #CONDITION
  # @return [int]
  def test_row(player)
    op_player = nil
    if player == 'X'
      op_player = 'Y'
    else
      op_player = 'X'
    end

    op_player_counter = 0
    player_counter = 0

    for level in 0..2
      for index in 0..2
        player_counter++ if self.board[level][index] == player
                         end
        op_player_counter++ if self.board[level][index] == op_player
                            end
      end
      if player_counter == 2 && op_player_counter == 0
        return level
      end
      op_player_counter = 0
      player_counter = 0
    end

    return 20
  end #END TEST_ROW METHOD///////////////////////////////////////////////////



  #TEST_DIAGONAL METHOD(CHAR PLAYER)///////////////////////////////////////////////////
  #THIS METHOD TESTS FOR A SPECIFIC CASE FOR 2 PLAYER CHAR VALUES AND nil
  #VALUE ALONG ANY POSSIBLE DIAGONAL AND RETURN THE DIAGONAL INDEX THAT MEATS THE
  #CONDITION
  # @return [int]
  def test_diagonal(player)

    op_player = nil
    if player == 'X'
      op_player = 'Y'
    else
      op_player = 'X'
    end

    op_player_counter = 0
    player_counter = 0

    for i in 0..2
    player_counter++ if self.board[i][i] == player
                     end
    op_player_counter++ if self.board[i][i] == op_player
                        end
    end
    if player_counter == 2 && op_player_counter == 0
      return 0
    end

    op_player_counter = 0
    player_counter = 0

    for i in 0..2
      player_counter++ if self.board[2-i][i] == player
                       end
      op_player_counter++ if self.board[2-i][i] == op_player
                          end
    end
    if player_counter == 2 && op_player_counter == 0
      return 1
    end

    return 20
  end #END TEST_DIAGONAL METHOD///////////////////////////////////////////////////



  #PLACE_COLUMN METHOD(INT COLUMN, CHAR PLAYER)///////////////////////////////////////////////////
  #WILL WALK THROUGH A COLUMN (GIVEN AS PARAMETER 0..2) AND PLACE PLAYER CHAR @
  #FIRST nil VALUE
  # @return [nil]
  def place_column(column,player)
    index = 0
    for i in 0..2
      index = i
      break if self.board[index][column] == nil
    end
    self.board[index][column] = player
  end #END PLACE_COLUMN METHOD///////////////////////////////////////////////////



  #PLACE_ROW METHOD(INT ROW, CHAR PLAYER)///////////////////////////////////////////////////
  #WILL WALK THROUGH A ROW (GIVEN AS PARAMETER 0..2) AND PLACE PLAYER CHAR @
  #FIRST nil VALUE
  # @return [nil]
  def place_row(row,player)
    index = 0
    for i in 0..2
      index = i
      break if self.board[row][index] == nil
    end
    self.board[row][index] = player
  end #END PLACE_ROW METHOD///////////////////////////////////////////////////



  #PLACE_DIAGONAL METHOD(INT DIAGONAL, CHAR PLAYER)///////////////////////////////////////////////////
  #WILL WALK THROUGH A DIAGONAL (GIVEN AS PARAMETER 0..1) AND PLACE PLAYER CHAR @
  #FIRST nil VALUE
  # @return [nil]
  def place_diagonal(diagonal,player)
    if diagonal == 0
      for i in 0..2
        if self.board[i][i] == nil
          self.board[i][i] == player
        end
      end
    else
      for i in 0..2
        if self.board[2-i][i] == nil
          self.board[2-i][i] == player
        end
      end
    end
  end#END PLACE_DIAGONAL METHOD///////////////////////////////////////////////////



  #WIN_MOVE METHOD(CHAR PLAYER)///////////////////////////////////////////////////
  #TESTS EACH ROW,COLUMN,DIAGONAL TO PLACE A WIN CONDITION
  #-------------------------------------------------------------------
  #USES TEST_ROW/...(CHAR) METHOD: USED TO GET INT VALUE OF ROW,COLUMN,DIAGONAL
  #TEST_ROW RETURN, EXACT ROW,COLUMN,DIAGONAL VALUE OR INT 20 DROP CASE
  #-------------------------------------------------------------------
  #USES PLACE_ROW/...(INT,CHAR) METHOD: USED IN CONJUNCTION W/ TEST_ROW/...(CHAR) METHOD
  #TO GET PROPER GRID PLACEMENT TO FILL WITH PARAMETER CHAR
  # @return [boolean]
  def win_move (player)

    if self.test_row(player) < 3 #test rows 0..2
      self.place_row(self.test_row(player),player) #place @ tested row
      return true
    elsif self.test_column(player) < 3 #test columns 0..2
      self.place_column(self.test_column(player),player) #place @ tested column
      return true
    elsif self.test_diagonal(player) < 2 #test diagonal cases 0..1
      self.place_diagonal(self.test_column(player),player) #place @ diagonal case
      return true
    end

    return false
  end



  #BLOCK_MOVE METHOD(CHAR PLAYER)///////////////////////////////////////////////////
  #TESTS EACH ROW,COLUMN,DIAGONAL TO PLACE A LOSE CONDITION
  #-------------------------------------------------------------------
  #USES TEST_ROW/...(CHAR) METHOD: USED TO GET INT VALUE OF ROW,COLUMN,DIAGONAL
  #TEST_ROW RETURN, EXACT ROW,COLUMN,DIAGONAL VALUE OR INT 20 DROP CASE
  #-------------------------------------------------------------------
  #USES PLACE_ROW/...(INT,CHAR) METHOD: USED IN CONJUNCTION W/ TEST_ROW/...(CHAR) METHOD
  #TO GET PROPER GRID PLACEMENT TO FILL WITH PARAMETER CHAR
  # @return [boolean]
  def block_move(player)

    op_player = nil
    if player == 'X'
      op_player = 'Y'
    else
      op_player = 'X'
    end

    if self.test_row(op_player) < 3 #test rows 0..2
      self.place_row(self.test_row(op_player),player) #place @ tested row
      return true
    elsif self.test_column(op_player) < 3 #test columns 0..2
      self.place_column(self.test_column(op_player),player) #place @ tested column
      return true
    elsif self.test_diagonal(op_player) < 2 #test diagonal cases 0..1
      self.place_diagonal(self.test_column(op_player),player) #place @ diagonal case
      return true
    end

    return false
  end #END BLOCK_MOVE METHOD///////////////////////////////////////////////////



  #CENTER_MOVE METHOD(CHAR PLAYER)///////////////////////////////////////////////////
  #TESTS CENTER
  # @return [boolean]
  def center_move(player)
    if self.board[1][1] == nil
      self.board[1][1] == player
      return true
    end
    return false
  end #END CENTER_MOVE METHOD///////////////////////////////////////////////////



  #CORNER_MOVE METHOD(CHAR PLAYER)///////////////////////////////////////////////////
  #TESTS CORNERS
  # @return [boolean]
  def corner_move(player)
    #test corner moves
    if self.board[0][0] == nil
      self.board[0][0] == player
      return true
    elsif self.board[0][2] == nil
      self.board[0][2] == player
      return true
    elsif self.board[2][0] == nil
      self.board[2][0] == player
      return true
    elsif self.board[2][2] == nil
      self.board[2][2] == player
      return true
    end
    # no corner moves
    return false
  end #END CORNER_MOVE METHOD///////////////////////////////////////////////////



  #EDGE_MOVE METHOD(CHAR PLAYER)///////////////////////////////////////////////////
  #TESTS EDGES
  # @return [boolean]
  def edge_move(player)
    #test edge moves
    if self.board[1][0] == nil
      self.board[1][0] == player
      return true
    elsif self.board[0][1] == nil
      self.board[0][1] == player
      return true
    elsif self.board[2][1] == nil
      self.board[2][1] == player
      return true
    elsif self.board[1][2] == nil
      self.board[1][2] == player
      return true
    end
    # no edge moves
    return false
  end #END EDGE_MOVE METHOD///////////////////////////////////////////////////



  #COMPUTER_MOVE METHOD(CHAR PLAYER)///////////////////////////////////////////////////
  #RUNS TURN FOR COMPUTER PLAYER, ELSE IF LOGIC USED TO DROP THROUGH
  #MULTIPLE COMPUTER MOVES, MOVES PRIORITISED FOR WIN OR DRAW
  # @return [nil]
  def computer_move(player)
    #game completion check, avoid unnecessary coordinate test
    #else if logic used to not have multiple computer moves
    if !self.board_full
      #Test for move to win game
      if win_move (player)
      #Test for move to block win
      elsif block_move(player)
      #center first priority
      elsif center_move(player)
      #corner second priority
      elsif corner_move(player)
      #edge last priority
      elsif edge_move(player)
      end
    end
    #update board
    self.display
  end #END COMPUTER_MOVE METHOD///////////////////////////////////////////////////



  #HUMAN_MOVE METHOD(CHAR PLAYER)///////////////////////////////////////////////////
  #RUNS A TURN FOR A HUMAN PLAYER, WHILE LOOP GETS A VALID COORDINATE
  #AND PLACES HUMAN PLAYER CHAR @ COORDINATE POINT IN DOUBLE ARRAY
  # @return [nil]
  def human_move(player)
    #game completion check, avoid infinite loop coordinate test
    if !self.board_full

      input = nil
      check = true

      #loop for testing valid
      while check
        puts('Player '+ player.to_s+' please enter your coordinate: ')
        input = gets
        input = input.to_i
        #check input range
        if input > 9
          puts('Coordinate: '+input.to_s+' isn\'t listed')
        #check coordinate occupation, return true
        elsif self.test_coordinate(input)
          check = false #break
        #
        else
          puts('Coordinate: '+input.to_s+' is already taken')
        end
      end

      self.place_coordinate(input,player)

    end
  end #END HUMAN_MOVE METHOD///////////////////////////////////////////////////



  #DISPLAY METHOD///////////////////////////////////////////////////
  #PRINTS BY ROW WITH GRID FORMAT, EVERY GRID SPACE IS FILLED WITH A
  #GRID NUMBER THAT IS REPLACED WHEN A CHARACTER VALUE, OCCUPIES SAME
  #SPACE
  # @return [nil]
  def display
    #first row print
    puts  ('-------------------------')
    puts  ('|       |       |       |')
    print ('|   ')
      if self.board[0][0] == nil
        print ('1')
      elsif
        print (self.board[0][0].to_s)
      end
    print ('   |   ')
      if self.board[0][1] == nil
        print ('2')
      elsif
        print (self.board[0][1].to_s)
      end
    print ('   |   ')
      if self.board[0][2] == nil
        print ('3')
      elsif
        print (self.board[0][2].to_s)
      end
    puts  ('   |')
    puts  ('|       |       |       |')
    puts  ('-------------------------')

    #second row print
    puts  ('|       |       |       |')
    print ('|   ')
      if self.board[1][0] == nil
        print ('4')
      elsif
        print (self.board[1][0].to_s)
      end
    print ('   |   ')
      if self.board[1][1] == nil
          print ('5')
      elsif
        print (self.board[1][1].to_s)
      end
    print ('   |   ')
      if self.board[1][2] == nil
          print ('6')
      elsif
        print (self.board[1][2].to_s)
      end
    puts  ('   |')
    puts  ('|       |       |       |')
    puts  ('-------------------------')

    #third row print
    puts  ('|       |       |       |')
    print ('|   ')
      if self.board[2][0] == nil
        print ('7')
      elsif
        print (self.board[2][0].to_s)
      end
    print ('   |   ')
      if self.board[2][1] == nil
       print ('8')
      elsif
        print (self.board[2][1].to_s)
      end
    print ('   |   ')
      if self.board[2][2] == nil
        print ('9')
      elsif
        print (self.board[2][2].to_s)
      end
    puts  ('   |')
    puts  ('|       |       |       |')
    puts  ('-------------------------')
  end #DISPLAY METHOD END///////////////////////////////////////////////////

end