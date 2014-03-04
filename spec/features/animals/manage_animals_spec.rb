require 'spec_helper'

feature 'Manage animals' do

  background do
    create :animal, name: 'Dumbo'
  end

  scenario 'A user destroys an animal' do
    visit '/'
    click_link 'Dumbo'
    click_link 'Destroy'
    expect(page).to have_content "'Dumbo' has been removed"
    expect(page).not_to have_link 'Dumbo'
  end

end
