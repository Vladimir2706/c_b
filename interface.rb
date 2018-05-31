require_relative 'game'
require 'pry'
module Codebreaker
  class Config
    @@actions = ['game', 'score', 'quit']
    def self.actions; @@actions; end
  end

  class Interface
    def initialize
      @answer = ''
    end

    def launch!
      introduction
      result = nil
      until result == :quit
        action = get_action
        result = do_action(action)
      end
      conclusion
    end

    def get_action
      action = nil
      # Keep asking for user input until we get a valid action
      until Codebreaker::Interface::Config.actions.include?(action)
        puts 'Choice action: ' + Codebreaker::Config.actions.join(', ')
        print '> '
        action = gets.chomp.downcase.strip
      end
      action
    end

    def do_action(action)
      case action
      when 'game'
        create_game
        start_game
        puts 'Lets go fuck'
      when 'score'
        puts 'Score list'
      when 'quit'
        :quit
      else
        puts "\nI don't understand that command.\n"
      end
    end

    def start_game
      puts "write your code"
      @answer = gets.chomp.strip
      binding pry
      @compared_answer = @anser.each_char { |char| b << char.to_i }
      puts game.instance_variable_get(:@secret_code)
      puts interface.instance_variable_get(:@answer)
    end

    def introduction
      puts "\nWelcome to the game"
      puts "\nWhat do U want, my friend?\n\n"
    end

    def conclusion
      puts "\n<<< Goodbye! >>>\n\n\n"
    end

    private

    def create_game
      game = Game.new
      game.start!
      puts "\nGame info\n"
      q = game.instance_variable_get(:@secret_code)
      r = game.instance_variable_get(:@attempts)
      s = game.instance_variable_get(:@hints)
      puts q, r, s
      start_game
    end


  end
end
