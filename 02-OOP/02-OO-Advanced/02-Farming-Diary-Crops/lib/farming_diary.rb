# rubocop:disable Lint/LiteralInInterpolation
# DO NOT remove the two lines below, needed for display purposes
require_relative "../spec/helper/board"

require_relative "corn"
require_relative "rice"


puts "\n\n📝 Day One: Corn"
# 1. Instantiate a corn crop
corn_crop = Corn.new

# 2. Water the corn crop

corn_crop.water!

# 3. Replace 'TODO' with the value of `grains` for your crop
puts "The corn crop produced #{corn_crop.grains} grains"
# 4. Replace 'TODO' with the state of the crop ('ripe' or 'not ripe')
puts "The corn crop is #{corn_crop.ripe?}"



puts "\n\n📝 Day Two: Rice"
# 1. Instantiate a rice crop
rice_crop = Rice.new

# 2. Water the rice crop
rice_crop.water!
# 3. Transplant the rice crop
rice_crop.transplant!

# 4. Replace 'TODO' with the value of `grains` for your crop
puts "The rice crop produced #{rice_crop.grains} grains"
# 5. Replace 'TODO' with the state of the crop ('ripe' or 'not ripe')
puts "The rice crop is #{rice_crop.ripe?}"


# DO NOT remove the two lines below, needed for display purposes
Board.new.display

# rubocop:enable Lint/LiteralInInterpolation
