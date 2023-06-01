require_relative '../trim_name'
require_relative '../nameable'
require_relative '../base'

RSpec.describe TrimmerDecorator do
  let(:nameable) { instance_double('Nameable', correct_name: 'John Doe') }
  let(:decorator) { described_class.new(nameable) }

  describe '#correct_name' do
    it 'returns the original name when length is <= 10' do
      expect(decorator.correct_name).to eq('John Doe')
    end

    it 'trims the name to a maximum of 10 characters when length > 10' do
      long_nameable = instance_double('Nameable', correct_name: 'John Doe Smith')
      long_decorator = described_class.new(long_nameable)
      expect(long_decorator.correct_name).to eq('John Doe S')
    end
  end
end
