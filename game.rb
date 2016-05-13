module GameUtils
	module ClassMethods
		def self.lend_to_friend(game, friend_email)

		end
	end
	
	module InstanceMethods
		
	end
	
	def self.included(receiver)
		receiver.extend         ClassMethods
		receiver.send :include, InstanceMethods
	end
end

class Game
	def initialize(name)
		@name = name
	end
end



game = Game.new("Contra")

Game.lend_to_friend(game, "gregg@codeschool.com")

class Library
	attr_accessor :games

	def initialize(games = [])
		self.games = games
	end

	def list
		games.each { |game| puts game.name }
	end

end
