require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  let(:incomplete_user) { User.new(username: '', session_token: 'session_token', password_digest: "password_digest") }
  subject(:user) { User.create(
    username: 'toby', 
    session_token: 'session_token', 
    password_digest: 'password_digest',
    )
  }
  
   describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should validate_uniqueness_of(:username) }
   end

   describe 'associations' do 
    it { should have_many(:goals).class_name(:Goal)}
   end

   describe 'User::find_by_credentials' do 
    let(:user_1) { User.new(username: "Fred", session_token: "Session_token1", password_digest: "Password_token1")}
    # it { should validate_presence_of(:email) }
    it 'return the user when given valid credentials' do
      expect(User.find_by_credentials(user_1.username, 'Password_1')).to eq(user_1) 

    end
    # it 'returns nil when given invalid credentials' do

    # end


  end
end
