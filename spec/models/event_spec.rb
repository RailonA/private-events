require 'rails_helper'
require 'capybara/rails'
require 'spec_helper'

RSpec.describe Event, type: :model do
  describe 'associations' do
    it { should belong_to(:creator).class_name('User') }
    it { should have_many(:invitations).with_foreign_key(:attended_event_id) }
    it { should have_many(:attendees).through(:invitations).source(:attendee) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end
end
