require 'rails_helper'

describe 'Link Request', type: :request do
  describe 'Get /api/v1/links' do
    it 'returns json of all links' do
      user  = create(:user)
      link1 = create(:link)
      link2 = create(:link)
      link3 = create(:link)
      user.links << link1
      user.links << link2
      user.links << link3
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      get '/api/v1/links'

      expect(response).to be_success

      raw_links = JSON.parse(response.body)
      expect(raw_links.count).to eq(3)
      link = raw_links.first
      expect(link['title']).to eq(link1.title)
      expect(link['url']).to eq(link1.url)
    end
  end

  describe 'Post /api/v1/links' do
    it 'returns JSON of the newly created link' do
      user  = create(:user)
      link1 = create(:link)
      link2 = create(:link)
      link3 = create(:link)
      user.links << link1
      user.links << link2
      user.links << link3
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      expect(Link.all.count).to eq(3)

      new_link = {'title': 'Turing', 'url': 'https://turing.io'}

      post '/api/v1/links', new_link.to_json

      raw_link = JSON.parse(response.body)
      expect(raw_link).to have_key('title')
      expect(raw_link).to have_key('url')
      expect(Link.all.count).to eq(4)
    end
  end
end
