require 'rails_helper'
require 'helpers/games_helper_spec'

feature 'game' do
  include GamesHelper
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
      create_game
      expect(page).to have_content 'Game 1'
      expect(current_path).to eq '/games'
    end
  end

end