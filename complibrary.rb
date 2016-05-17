require 'components'
require 'active_support/all'
require 'i18n'

def pluralize (number, str_plur)
	if number == 0
		"no" + str_plur.pluralize
	elsif number > 1
		number.to_s + " " + str_plur.pluralize 
	else
		number.to_s + " " + str_plur
	end
end

puts COMPONENTS.sort_by { |part| part[:name]}
puts "Which component are you looking for?"
comp = gets.strip

matching_parts =  COMPONENTS.select { |part| part[:name].include? comp }

print "We have "
print pluralize(matching_parts.length, "part")
puts " meeting your description."

matching_parts.each do |part|
	puts "We have #{part[:quantity]} #{part[:name]} component"
end




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
