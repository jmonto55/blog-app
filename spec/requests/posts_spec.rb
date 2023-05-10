require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users/:user_id/posts' }

    it 'should return success' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return a 200 response status code' do
      expect(response).to have_http_status 200
    end

    it 'should render index template' do
      expect(response).to render_template('index')
    end

    it 'include the correct text' do
      expect(response.body).to include('All posts')
    end
  end
end
