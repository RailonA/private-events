# rubocop:disable Lint/RedundantCopDisableDirective
# rubocop:disable  Metrics/BlockLength

require 'rails_helper'
require 'capybara/rails'
require 'spec_helper'

RSpec.describe 'Managing events:', type: :feature do
  before(:each) do
    visit new_user_url
    fill_in 'Name', with: 'railon'
    fill_in 'Email', with: 'railonacosta@gmail.com'
    click_button 'Submit'
    visit login_url
    fill_in 'Email', with: 'railonacosta@gmail.com'
    click_button 'Log In'
    visit new_event_url
  end

  scenario 'create an event --> invalid inputs' do
    fill_in 'Title', with: ''
    click_button 'Submit'
    expect(page).to have_content("Title can't be blank")
  end

  scenario 'edit an event --> valid inputs' do
    event = Event.create!(title: 'Title', description: 'Mama are mere, Tata are pere', creator_id: 1)
    visit edit_event_path(id: event.id)
    fill_in 'Title', with: 'Title'
    click_button 'Submit'
    visit events_path
    expect(page).to have_content('Title')
    expect(page).to have_content('Mama are mere, Tata are pere')
  end

  scenario 'delete an event' do
    fill_in 'Title', with: 'Title'
    fill_in 'Description', with: 'Mama are mere, Tata are pere'
    click_button 'Submit'
    visit root_path
    expect(page).to have_content('Title')
    expect(page).to have_content('Mama are mere, Tata are pere')
    expect { click_on('Delete') }.to change(Event, :count).by(-1)
  end

  scenario 'show an event' do
    fill_in 'Title', with: 'Minneapolis'
    fill_in 'Description', with: 'Mama are mere, Tata are pere'
    click_button 'Submit'
    visit root_path
    click_on('Minneapolis')
    expect(page).to have_content('Minneapolis')
    expect(page).to have_content('Mama are mere, Tata are pere')
  end
end
# rubocop:enable Lint/RedundantCopDisableDirective
# rubocop:enable  Metrics/BlockLength
