class Library
	attr_accessor :games

	def initialize(games)
		@games = games
	end

	def has_game?(search_game)
    	for game in games
      		return true if game == search_game
    	end
    false
  	end
end

class Game
  def initialize(name, options={})
    @name = name
    @year = options[:year]
    @system = options[:system]
  end

  def print
  	puts "Name: #{@name} Year: #{@year} System: #{@system}"
  end
end

new_game = Game.new("foo", :year=>1973, :system=>"iOS")
new_game.print

=begin
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
