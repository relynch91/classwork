require 'rails_helper'

RSpec.describe Goal, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:author_id) }
  end

  describe 'associations' do
    it { belong_to(:author).class_name(:User) }
  end
end
