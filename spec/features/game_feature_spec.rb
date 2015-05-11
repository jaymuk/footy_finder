require 'rails_helper'
require 'helpers/games_helper_spec'

feature 'game' do
  include GamesHelper
  context 'no games have been added' do
    scenario 'should display a propmpt to add a game' do
      visit '/games'
      expect(page).to have_content 'No games yet'
      expect(page).to have_link 'Add a Game'
    end
  end

  context 'games have been added' do
    # before do
    #   Game.create(name: 'Game 1')
    # end

    scenario 'display games' do
      create_game 
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

  context 'user joining existing game' do
    scenario 'select game to join on home page' do
      create_game
      click_link 'Game 1'
      expect(current_path).to eq "/games/#{Game.last.id}"
      click_link 'Join Game'
      expect(page).to have_content 'You have joined Game 1'
      expect(current_path).to eq '/games'
    end
  end

  context 'leaving game' do
    scenario 'user leaves an existing game' do
      create_game
      click_link 'Game 1'
      expect(current_path).to eq "/games/#{Game.last.id}"
      click_link 'Leave Game'
      expect(page).to have_content('No games yet')
      expect(current_path).to eq '/games'
    end
  end

  context 'editing game' do
    scenario 'user can edit an existing game' do
      create_game
      click_link 'Game 1'
      expect(current_path).to eq "/games/#{Game.last.id}"
      click_link 'Edit Game'
      expect(page).to have_content('Game 2')
      expect(current_path).to eq '/games'
    end
  end

  context 'deleting game' do
    scenario 'user can delete game they created' do
      create_game
      click_link 'Game 1'
      expect(current_path).to eq "/games/#{Game.last.id}"
      click_link 'Delete Game'
      expect(page).not_to have_content('Game 1')
      expect(current_path).to eq '/games'
    end
  end

end