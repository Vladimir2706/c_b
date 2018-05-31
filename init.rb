APP_ROOT = File.dirname(__FILE__)

require_relative 'game'
include Codebreaker


interface = Interface.new
interface.launch!
