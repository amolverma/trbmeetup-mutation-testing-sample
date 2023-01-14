class Customer
  attr_reader :age, :country

  DRINKING_AGE_BY_COUNTRY = {
    japan: 20,
    france: 18,
    usa: 21
  }

  def initialize(age:, country:)
    @age = age
    @country = country
  end

  def allowed_to_buy_alcohol?
    age >= DRINKING_AGE_BY_COUNTRY.fetch(country)
  rescue KeyError
    false
  end
end
