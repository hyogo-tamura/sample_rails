require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }
  it 'is valid with email' do
    pass = Faker::Internet.password(8)
    user = User.new(email: Faker::Internet.email, password: pass, password_confirmation: pass)
    expect(user).to be_valid
  end

  it 'is valid with email and username' do
    pass = Faker::Internet.password(8)
    user = User.new(email: Faker::Internet.email, username: Faker::Internet.username, password: pass, password_confirmation: pass)
    expect(user).to be_valid
  end

  it 'is NOT valid when username is too long' do
    pass = Faker::Internet.password(8)
    user = User.new(email: Faker::Internet.email, username: 'the very verrrrrrrrrry long usename, maybe he want to fill my storage', password: pass, password_confirmation: pass)
    expect(user).to_not be_valid
  end

  it 'is invalid when password confirmation is different' do
    pass = 'password'
    pass_c = 'different_password'
    user = User.new(email: Faker::Internet.email, password: pass, password_confirmation: pass_c)
    expect(user).to_not be_valid
  end
end
