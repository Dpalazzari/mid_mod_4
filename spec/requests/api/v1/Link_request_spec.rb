require 'rails_helper'

describe 'Link Request', type: :request do
  describe 'Get /api/v1/links' do
    it 'returns json of all links' do
      link1 = Link.create(url: "https://www.google.com", title: "Google")
      Link.create(url: "https://www.nerd-bay.herokuapp.com", title: "Nerd Bay")
      Link.create(url: "https://www.espn.com", title: "ESPN")
      Link.create(url: "https://www.reddit.com", title: "Reddit")

      get '/api/v1/links'

      expect(response).to be_success

      raw_links = JSON.parse(response.body)
      expect(raw_links.count).to eq(4)
      link = raw_links.first
      expect(link['title']).to eq(link1.title)
      expect(link['url']).to eq(link1.url)
    end
  end

  describe 'Post /api/v1/links' do
    it 'returns JSON of the newly created link' do
      Link.create(url: "https://www.espn.com", title: "ESPN")
      Link.create(url: "https://www.reddit.com", title: "Reddit")
      expect(Link.all.count).to eq(2)

      new_link = {'title': 'Turing', 'url': 'https://turing.io'}
      
      post '/api/v1/links', new_link.to_json

      raw_link = JSON.parse(response.body)
      expect(raw_link).to have_key('title')
      expect(raw_link).to have_key('url')
      expect(Link.all.count).to eq(3)
    end
  end
end