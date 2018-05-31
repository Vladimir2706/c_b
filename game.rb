require_relative 'interface'

module Codebreaker
  class Game
    attr_reader :secret_code
    attr_accessor :attempts, :hints

    def initialize
      @secret_code = ''
      @attempts = 0
      @hints = 0
    end

    def start!
      gen_code
      set_code
      set_attempts
      set_hints
    end

    private

    def gen_code
      @pre_code = []
      4.times do
        item = rand(1..5)
        @pre_code << item
      end
      set_code
    end

    def set_code
      @secret_code = @pre_code.map { |i| "#{i}" }.join('')
    end

    def set_attempts
      puts 'How many attempts?'
      @attempts = gets.chomp.to_i
    end

    def set_hints
      puts 'How many hints?'
      @hints = gets.chomp.to_i
    end
  end
end
