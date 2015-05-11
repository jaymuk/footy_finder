require 'rails_helper'

feature 'game' do
  context 'no games have been added' do
    scenario 'should display a propmpt to add a game' do
      visit '/games'
      expect(page).to have_content 'No games yet'
      expect(page).to have_link 'Add a game'
    end
  end

  context 'games have been added' do
    before do
      Game.create(name: 'Game 1')
    end

    scenario 'display games' do
      visit '/games' 
      expect(page).to have_content('Game 1')
      expect(page).not_to have_content('No games yet')
    end
  end

  context 'user creating games' do
    scenario 'prompts user to fill out a form, then display game' do
      visit '/games'
      click_link 'Add a game'
      fill_in 'Name', with: 'Game 1'
      fill_in 'Location', with: 'London'
      fill_in 'DateTime', with: 'Monday 12:00'
      click_button 'Create a game'
      expect(page).to have_content 'Game 1'
      expect(current_path).to eq '/games'
    end
  end
end