class Dog
  LEGS = 4
end

class Cat
  def legs
    Dog::LEGS
  end
end

kitty = Cat.new
puts kitty.legs


class Team
  attr_accessor :name, :members
  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    return if person.not_yet_18?
    members.push person
  end

  def +(other_team)
    temp_team = Team.new('Temporary Team')
    temp_team.members = members + other_team.members
    temp_team
  end

  def [](idx)
    members[idx]
  end

  def []=(idx, obj)
    members[idx] = obj
  end
end

class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def not_yet_18?
    age < 18
  end
end

cowboys = Team.new('Dallas Cowboys')
cowboys << Person.new('Troy Aikman', 46)
cowboys << Person.new('Troy Aikman', 48)
cowboys << Person.new('Michael Irvin', 49)

niners = Team.new('San Francisco 49ers')
niners << Person.new('Joe Montana', 59)
niners << Person.new('Jerry Rice', 52)
niners << Person.new('Deion Sanders', 47)

cowboys.members

cowboys[1]
cowboys[3] = Person.new('JJ', 72)
cowboys[3]

dream_team = cowboys + niners # => #<Team:0x007fb8d28d4068 @name="Temporary Team", @members=[#<Person:0x007fb8d28d4428 @name="Troy Aikman", @age=46>, #<Person:0x007fb8d28d4388 @name="Troy Aikman", @age=48>, #<Person:0x007fb8d28d4338 @name="Michael Irvin", @age=49>, #<Person:0x007fb8d28d4130 @name="JJ", @age=72>, #<Person:0x007fb8d28d4270 @name="Joe Montana", @age=59>, #<Person:0x007fb8d28d41d0 @name="Jerry Rice", @age=52>, #<Person:0x007fb8d28d4180 @name="Deion Sanders", @age=47>]>
dream_team.name = 'Dream Team' # => "Dream Team"

dream_team[4] # => #<Person:0x007fb8d28d4270 @name="Joe Montana", @age=59>
dream_team[5] = Person.new('JJ', 72) # => #<Person:0x007fb8d2046b08 @name="JJ", @age=72>

# >> 4
