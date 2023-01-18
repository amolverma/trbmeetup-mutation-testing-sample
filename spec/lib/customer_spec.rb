require 'customer'

describe Customer do
  let(:customer) { Customer.new(age: age) }

  describe '#allowed_to_buy_alcohol?' do
    subject { customer.allowed_to_buy_alcohol? }

    context 'for adults' do
      let(:age) { 25 }
      it { is_expected.to be true }
    end

    context 'for teenagers' do
      let(:age) { 19 }
      it { is_expected.to be false }
    end

    context 'for new adults' do
      let(:age) { 20 }
      it { is_expected.to be true }
    end
  end
end
