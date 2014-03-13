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

  # TODO: update factory
  context 'with minimal attributes' do
    before { animal.name = 'Dumbo' }
    it { should be_valid }
  end

  describe 'natural language weight input' do
    VALID_WEIGHTS = {
      '1,234 kgs'       => 1234,
      '1234'            => 1234,
      '1,234'           => 1234,
      '1,234.56'        => 1234,
      1234              => 1234,
      1234.00           => 1234,
      'about 1234 kgs'  => 1234,
      'abcd'            => 'abcd',
      '12,34'           => '12,34',
    }

    VALID_WEIGHTS.each do |input, expected|
      context "when weight is #{input.inspect}" do
        before { animal.weight = input }
        its(:weight) { should eq expected }
      end
    end

  end

end
