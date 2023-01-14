require 'customer'

describe Customer do
  let(:customer) { Customer.new(age: age, country: country) }

  describe '#allowed_to_buy_alcohol?' do
    subject { customer.allowed_to_buy_alcohol? }

    context 'in Japan' do
      let(:country) { :japan }

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

    context 'in France' do
      let(:country) { :france }

      context 'for adults' do
        let(:age) { 25 }
        it { is_expected.to be true }
      end

      context 'for teenagers' do
        let(:age) { 16 }
        it { is_expected.to be false }
      end

      context 'for new adults' do
        let(:age) { 18 }
        it { is_expected.to be true }
      end
    end

    context 'in the US' do
      let(:country) { :usa }

      context 'for adults' do
        let(:age) { 25 }
        it { is_expected.to be true }
      end

      context 'for teenagers' do
        let(:age) { 15 }
        it { is_expected.to be false }
      end

      context 'for new adults' do
        let(:age) { 21 }
        it { is_expected.to be true }
      end
    end
  end
end
