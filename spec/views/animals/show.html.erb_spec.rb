require 'spec_helper'

describe 'animals/show' do
  before { assign :animal, animal }
  before { render }

  let(:animal) { stub_model Animal, notes: "First line\nSecond line", weight: 5432 }

  it 'should show the use simple format for the notes field' do
    expect(rendered).to include <<-HTML.strip_heredoc
    <p>
      <strong>Notes:</strong>
      <p>First line
    <br />Second line</p>
    </p>
    HTML
  end

  it 'should format the weight' do
    expect(rendered).to have_content '5,432 kg'
  end


end
