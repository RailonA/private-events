require 'rails_helper'
require 'capybara/rails'

feature 'The signup process:' do
  scenario 'has a new user page' do
    visit(new_user_url)
    expect(page).to have_content('New User')
  end

  feature 'sign up a user' do
    before(:each) do
      visit new_user_url
      fill_in 'Name', with: 'Railon'
      fill_in 'Email', with: 'railonacosta@gmail.com'
      click_on 'Submit'
    end

    scenario 'redirects to home page after signup' do
      expect(root_path).to have_content('Upcoming Events')
    end

    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content 'Railon'
    end
  end
end

feature 'The signin process:' do
  scenario 'has a login user page' do
    visit(login_url)
    expect(page).to have_content('Email')
  end
  feature 'signing in a user' do
    before(:each) do
      visit new_user_url
      fill_in 'Name', with: 'railon'
      fill_in 'Email', with: 'railonacosta@gmail.com'
      click_on 'Submit'
      visit login_url
      fill_in 'Email', with: 'railonacosta@gmail.com'
      click_button 'Log In'
    end

    scenario 'redirects to home page after signin' do
      expect(page).to have_content 'railon'
    end

    scenario 'shows username on the homepage after signing in' do
      expect(page).to have_content 'railon'
    end
  end
end