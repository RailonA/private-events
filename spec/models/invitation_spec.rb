require 'rails_helper'
require 'capybara/rails'
require 'spec_helper'

RSpec.describe Invitation, type: :model do
  describe 'associations' do
    it { should belong_to(:attendee).with_foreign_key(:attendee_id).class_name('User') }
    it { should belong_to(:attended_event).with_foreign_key(:attended_event_id).class_name('Event') }
  end

  # rubocop:disable Layout/LineLength
  describe 'validations' do
    it { should validate_uniqueness_of(:attended_event_id).case_insensitive.scoped_to(:attendee_id).with_message('You can only atend once (Matrix! Perhaps!?)') }
  end
  # rubocop:enable Layout/LineLength
end
