class Customer
  attr_reader :age

  def initialize(age:)
    @age = age
  end

  def allowed_to_buy_alcohol?
    age >= 20
  end
end
