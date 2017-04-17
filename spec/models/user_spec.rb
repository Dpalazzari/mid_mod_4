require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { should have_many :links }
  end

  context 'validations' do
    it 'is invalid without a name' do
      user = User.new(password: 'blah', password_confirmation: 'password',)
      expect(user).to be_invalid
    end

    it 'is invalid without a password' do
      user = User.new(name: 'Babooshka')
      expect(user).to be_invalid
    end

    it 'is valid with name and password' do
      user = User.new(name: 'Babooshka', password: 'password', password_confirmation: 'password', email: 'bab@ooshka.com')
      expect(user).to be_valid
    end

    it 'is invlaid without a unique email' do
      user  = User.create(name: 'Bilbo', password: 'password', password_confirmation: 'password', email: 'bab@ooshka.com')
      user2 = User.create(name: 'Babooshka', password: 'password', password_confirmation: 'password', email: 'bab@ooshka.com')

      expect(user2).to be_invalid
    end
  end
end
