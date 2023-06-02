require_relative 'person'

person = Person.new("Александр", "Юрьевич")
person1 = Person.new("Александра", "Александровна")

person.full_name
person1.full_name