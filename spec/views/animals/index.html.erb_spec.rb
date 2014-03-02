require 'spec_helper'

describe 'animals/index' do
  before { assign :animals, [elephant, lion] }
  before { render }
  subject { rendered }

  let(:elephant) { stub_model Animal, name: 'Dumbo', species: 'Elephant', weight: 5432, notes: "Flies" }
  let(:lion)     { stub_model Animal, name: 'Simba', species: 'Lion', weight: 181, notes: "Doesn't fly" }

  it 'should render a table of animals' do
    expect(rendered).to have_content <<-TABLE
      Found 2 animals.

      Name    Species   Weight      Notes
      Dumbo   Elephant  5,432 kg    Flies
      Simba   Lion        181 kg    Doesn't fly
    TABLE
  end

  it 'should link to the animal from the name' do
    expect(rendered).to have_link "Dumbo", href: url_for(elephant)
  end

  it { should have_link "New Animal", href: new_animal_path }

  context 'with a long note' do
    before { elephant.notes = "Lorem ipsum " * 30 }
    before { render }

    it 'should truncate the note' do
      expect(rendered).to have_content "Lorem ipsum Lorem ipsum Lor..."
    end
  end

  it 'should show how many animals there are' do
    expect(rendered).to have_content "Found 2 animals."
    assign :animals, [stub_model(Animal)]
    render
    expect(rendered).to have_content "Found 1 animal."
  end

end
