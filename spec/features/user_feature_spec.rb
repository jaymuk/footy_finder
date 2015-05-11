require 'rails_helper'

feature 'user' do
  context 'User not signed in and on the home page' do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit '/games'
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end
  end

  it "should not see 'sign out' link" do
    visit '/games'
    expect(page).not_to have_link('Sign out')
  end
end
