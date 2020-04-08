class Creature
  const_set(:'Base', Class.new do |klass|
    def eat(food)
      p "#{food} mgmg..."
    end
  end)
end

Creature::Base.new.eat 'food'
