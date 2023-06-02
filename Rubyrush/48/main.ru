require_relative 'body_builder'
bb = BodyBuilder.new("Александр")
bb1 = BodyBuilder.new("Владимир")
cls
p bb.show_muscles
bb.pump("triceps")
bb.pump("biceps")
p bb.show_muscles
puts
p bb1.show_muscles
bb1.pump("biceps")
p bb1.show_muscles


