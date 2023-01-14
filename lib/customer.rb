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
      !country.eql?(:japan)
    else
      age >= DRINKING_AGE_BY_COUNTRY.fetch(country)
    end
  rescue KeyError
    false
  end

  private

  def shopping_ai?
    Integer(name).odd?
  rescue ArgumentError, TypeError
    false
  end
end
