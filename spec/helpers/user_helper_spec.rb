require 'rails_helper'

module UsersHelper
  def create_user(email, password)
    fill_in('Email', with: email)
    fill_in('Password', with: password)
    fill_in('Password confirmation', with: password)
    click_link('Sign Up')
  end
end
