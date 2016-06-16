require 'components'
require 'active_support/all'
require 'i18n'

class ComponentLib
	def initialize (new_components)
		@components = new_components
	end

	def pluralize (number, str_plur)
		if number == 0
			"no " + str_plur.pluralize
		elsif number > 1
			number.to_s + " " + str_plur.pluralize 
		else
			number.to_s + " " + str_plur
		end
	end


	def more_info(part_name)
		case 
		when part_name.include?('neopixel')
			puts "Our neopixels are the BEST!"
		when part_name.include?("display")
			puts "Our displays are the BEST!"
		when part_name.include?("sensor")
			puts "Our sensors are the BEST!"
		else
			puts "We are the best"
		end
	end

	def find_component
		puts @components.sort_by { |part| part[:name] }
		puts "Which component are you looking for?"
		comp = gets.strip

		matching_parts = @components.select { |part| part[:name].include? comp }

		puts "We have " + pluralize(matching_parts.length, "part") + " meeting your description."

		matching_parts.each do |part|
			puts "We have #{part[:quantity]} #{part[:name]} component"
			more_info(part[:name])
		end
	end
end

new_componentlib = ComponentLib.new(COMPONENTS)
new_componentlib.find_component

=begin
COMPONENTS.each do |part|
	puts "component: #{comp}"
	puts "part in library:  #{part[:name]}"
	if part[:name].eql? comp
		puts "Yes we have that component #{part[:name]}"
		break
	else
		puts "Nope, we don't have it"
	end
end
=end
