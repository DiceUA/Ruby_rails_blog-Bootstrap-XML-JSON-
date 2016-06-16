require 'rails_helper'
require 'bcrypt'

RSpec.describe User, type: :model do
  it 'should get nyaka username' do
    expect(User.find(1).username).to eq('nyaka')
  end

  it 'should have encrypted password' do
    password = 'fishy'
    user = User.find_by_username('nyaka')
    user_password = user.password_digest
    expect(user_password).not_to eq(password)
  end

  it 'should authenticate with correct password' do
    username = 'nyaka'
    user = User.find_by_username(username)
    password = 'fishy'
    auth_user = user.authenticate(password)
    expect(auth_user.username).to eq(username)
  end

  it 'should have at least one record in db' do
    expect(User.first).not_to eq(nil)
  end

  it 'should validate presence of all fields' do
    user = User.new
    expect(user.save).not_to eq(true)
    user2 = User.new
    user2.email = 'holly.jenkins@example.com'
    user2.username = 'holly'
    user2.password = '123'
    expect(user2.save!).to eq(true)
  end

  it 'should have correct email' do
    user = User.first
    VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    expect(user.email).to match(VALID_EMAIL_REGEX)
  end
end
