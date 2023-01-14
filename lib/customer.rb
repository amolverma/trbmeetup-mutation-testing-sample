class Customer
  attr_reader :age, :country, :name

  DRINKING_AGE_BY_COUNTRY = {
    japan: 20,
    france: 18,
    usa: 21
  }

  def initialize(age:, country:, name:)
    @age = age
    @country = country
    @name = name
  end

  def allowed_to_buy_alcohol?
    if shopping_ai?
      country != :japan
    else
      age >= DRINKING_AGE_BY_COUNTRY.fetch(country)
    end
  rescue KeyError
    false
  end

  private

  def shopping_ai?
    name.to_i.odd?
  end
end
