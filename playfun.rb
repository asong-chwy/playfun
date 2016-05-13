require 'active_support/all'

class Library
	attr_accessor :games

  def initialize(games = [])
    self.games = games
  end

  def list
    games.each do |game|
      puts yield game
    end
  end

  def each
    games.each do |game|
      yield game
    end
  end

  def has_game?(search_game)
      for game in self.games
          return true if game == search_game
      end
    false
  end

  def each_on_system(system)
    games.each do |game|
      yield game if game.system == system
    end
  end
  include Enumerable
end

class Game
  attr_accessor :name, :year, :system
  attr_reader :created_at

  def initialize(name, options={})
    self.name = name
    self.year = DateTime.new(1987, 2, 20, 0, 0, 0)
    self.system = options[:system]
    @created_at = Time.now
  end

  def last_games(games, index)
  	games.from(index)
  end

  def first_games(games, index)
  	games.to(index)
  end

  def print
  	puts "Name: #{@name} Year: #{@release} System: #{@system}"
  end

  def anniversary(years)
    anniversary = @release.advance(years: years)
  end

  def emulate (game)
    emulator = Emulator.new(game.system)
    yield game
    rescue Exception => e
      puts "Emulator failed: #{e}"
    end
end


GAMES = [
Game.new('Contra', year: 1987, system: 'NES'),
Game.new('Civilization', year: 1991, system: 'PC'),
Game.new('The Legend of Zelda', year: 1986, system: 'NES'),
Game.new('Mega Man X2', year: 1995, system: 'SNES'),
Game.new('Super Metroid', year: 1994, system: 'SNES'),
Game.new('Sim City 2000', year: 1993, system: 'PC'),
Game.new('Starcraft', year: 1998, system: 'PC')
]

library = Library.new(GAMES)
library.each_on_system("SNES") { |game| puts game.name }
library.list { |game| "#{game.name} (#{game.system}) - #{game.year}" }
puts library.select { |game| game.year == 1986 }
puts library.collect { |game| game.system }



=begin
def anniversary_fu(game, years)
  game[:release].advance(years: years)
end

def difference_between(player1, player2)
  player1.dup.delete_if { |k, v| player2[k] == v }.merge(player2.dup.delete_if { |k, v| player1.has_key?(k)})
end

def exclude_character(games, character)
  games.except(character)
end

games = {
  mario: ["Super Mario World", "Super Smash Bros. Melee"],
  luigi: ["Luigi's Mansion"],
  yoshi: ["Yoshi's Island", "Yoshi's Story"]
}

puts exclude_character(games, :yoshi)

mario_favorite = {
  sports: "Mario Sports Mix",
  action: "Super Mario World"
}

luigi_favorite = {
  sports: "Golf",
  action: "Super Mario World"
}

puts difference_between(mario_favorite, luigi_favorite)

game = {
  name: 'Contra',
  release: DateTime.new(1987, 2, 20, 0, 0, 0)
}
puts anniversary_fu(game, 20)



games = ["Supper Mario Bros.", "Contra", "Metroid", "Mega Man 2"]

new_game = Game.new("PacMan", :system=>"iOS")
puts "anniversary"
puts new_game.anniversary(20)

puts "last games"
puts new_game.last_games(games, 2)
puts "first games"
puts new_game.first_games(games, 2)
new_game.print

releaseDate = DateTime.new(1987, 2, 20, 0, 0, 0)
puts releaseDate


def new_game(name, options={})
	if name.empty?
  		puts "error"
  	else
  		{name: name,
	    year: options[:year],
	    system: options[:system]}
	end
end

game = new_game("foo", :year=>1973, :system=>"iOS")
puts "#{game}"



	@i = 1
		while @i < 250
			puts "foo" + @i.to_s + "@bar.com"
			@i += 1
		end

class SomeClass
	def initialize(value1)
		@value1 = value1
	end

	def value_printer(value2)
		lambda {puts "Value1: #{@value1}, Value2: #{value2}"}
	end
end

def caller(some_closure)
	some_closure.call
end

some_class = SomeClass.new(5)
printer = some_class.value_printer("some value")

caller(printer)
=end
