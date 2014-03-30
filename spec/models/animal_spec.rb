require 'spec_helper'

# This is a UNIT TEST (for our purposes anyway)
# which means it only describes the code in a
# single corresponding source file.
#
# i.e. You only need to modify one file to make all
#      these pass.

describe Animal do
  subject(:animal) { described_class.new }

  it { should validate_presence_of :name }
  it { should validate_numericality_of(:weight).is_greater_than(0) }

  context 'with minimal attributes' do
    before { animal.name = 'Dumbo' }
    it { should be_valid }
  end

  WEIGHTS = {
    '1,234 kgs'       => '1234 kgs',
    '1234'            => '1234',
    '1,234'           => '1234',
    '1,234.56'        => '1234.56',
    1234              => 1234,
    1234.00           => 1234.00,
    'about 1234 kgs'  => 'about 1234 kgs',
    'abcd'            => 'abcd',
    '12,34'           => '1234',
  }

  it 'should remove commas from weight input' do
    WEIGHTS.each do |input, expected|
      animal.weight = input
      expect(animal.weight).to eq expected
    end
  end

end
