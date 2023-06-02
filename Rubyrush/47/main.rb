require_relative 'person'

person = Person.new(6, "Александр", "Юрьевич")
person1 = Person.new(65, "Александра", "Александровна")

person.full_name
person1.full_name
puts
if person.old? == true
  puts "#{person.first_name} #{person.middle_name}!Он пожилой"
else
  puts "#{person.full_name}Он молодой"
end

if person1.old? == true
  puts "#{person1.first_name} #{person1.middle_name}!Он пожилой"
else
  puts "#{person1.full_name}Он молодой"
end
puts
p person.v2_old?
p person.old?
p person1.v2_old?