require_relative 'cameleo'

cameleo = Cameleo.new("красный")
p cameleo.color_name
cameleo.change_color
p cameleo.color_name
p cameleo