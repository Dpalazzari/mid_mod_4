require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { should have_many :links }
  end

  context 'validaitons' do
    it 'is invalid without a name' do
      user = User.new(password: 'blah')
      expect(user).to be_invalid
    end

    it 'is invalid without a password' do
      user = User.new(name: 'Babooshka')
      expect(user).to be_invalid
    end

    it 'is valid with name and password' do
      user = User.new(name: 'Babooshka', password: 'password')
      expect(user).to be_valid
    end
  end
end
