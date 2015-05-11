require 'rails_helper'

module GamesHelper 
  def create_game
    visit '/games'
    click_link 'Add a game'
    fill_in 'Name', with: 'Game 1'
    fill_in 'Location', with: 'London'
    fill_in 'DateTime', with: 'Monday 12:00'
    click_button 'Create a game'
  end
end