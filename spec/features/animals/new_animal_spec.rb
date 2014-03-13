require 'spec_helper'

feature 'Create a new animal' do

  scenario 'A user creates a valid animal' do
    visit '/'
    click_link 'New Animal'
    fill_in 'Name', with: 'Dumbo'
    fill_in 'Species', with: 'Elephant'
    fill_in 'Weight', with: '5123'
    fill_in 'Notes', with: 'Big ears!'
    click_button 'Create Animal'
    expect(page).to have_content 'Name: Dumbo'
    expect(page).to have_content 'Species: Elephant'
    expect(page).to have_content 'Weight: 5,123 kg'
    expect(page).to have_content 'Notes: Big ears!'
  end

  scenario 'A user submits a invalid animal' do
    visit '/'
    click_link 'New Animal'
    click_button 'Create Animal'
    expect(page).to have_content "Name can't be blank"
  end

end
