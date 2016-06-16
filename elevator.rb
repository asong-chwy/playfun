require 'active_support/all'
require 'i18n'

class Elevator
	def intialize (foobar)
		@floors = floors
	end

	def up
		floors = gets.strip.split(",").map { |s| s.to_i }
		floors.sort.uniq
		puts floors
	end

	def down
	end
end

elevator = Elevator.new(20)
elevator.up