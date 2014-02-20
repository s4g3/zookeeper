require 'spec_helper'

describe 'animals/show' do
  before { assign :animal, animal }
  before { render }
  subject { rendered }

  let(:animal) { stub_model Animal, name: 'Dumbo', species: 'Elephant', notes: 'Flies', weight: 5432 }

  it 'should render the animal' do
    should have_content <<-PAGE
      Name:     Dumbo
      Species:  Elephant
      Weight:   5,432 kg
      Notes:    Flies

      Back | Edit | Destroy
    PAGE
  end

  it { should have_link "Back", animals_path }
  it { should have_link "Edit", edit_animal_path(animal) }
  it 'should have link "Destroy"' do
    path = url_for animal
    should include %Q{
      <a data-confirm="Are you sure you want to delete Dumbo?" data-method="delete" href="#{path}" rel="nofollow">Destroy</a>
    }.strip
  end

  context 'with multiline notes' do
    before { animal.notes = "First line\nSecond line" }
    before { render }

    it 'should format the new lines' do
      expect(rendered).to include "First line\n<br />Second line"
    end

  end
end
