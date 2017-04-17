require 'rails_helper'

RSpec.describe Link, type: :model do
  context 'associations' do
    it { should belong_to :user }
  end

  context 'validations' do
    it "is invalid without a title" do
      link = Link.new(url: 'http://twitch.tv')
      expect(link).to be_invalid
    end

    it "is invalid without a url" do
      link = Link.new(title: 'coolwebsite')
      expect(link).to be_invalid
    end

    it "is invalid without a valid url" do
      link = Link.new(title: 'coolwebsite', url: 'coolwebsite.com')
      expect(link).to be_invalid
    end

    it "is valid with title and valid url" do
      link = Link.new(title: 'Youtube', url: 'http://youtube.com')
      expect(link).to be_valid
    end
  end
end
