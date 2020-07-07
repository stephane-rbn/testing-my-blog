require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:article) { FactoryBot.create(:article, user: user) }

  context 'on success' do
    describe 'GET /articles' do
      it 'should render index template' do
        get '/articles'
        expect(response).to render_template(:index)
      end
    end

    describe 'GET /articles/new' do
      it 'should render new template' do
        sign_in user
        get '/articles/new'
        expect(response).to render_template(:new)
      end
    end

    describe 'POST /articles' do
      it 'returns http success' do
        skip
        get '/articles/create'
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET /articles/:id' do
      it 'should render show template' do
        sign_in user
        get "/articles/#{article.id}"
        expect(response).to render_template(:show)
      end
    end

    describe 'PUT /articles/:id' do
      it 'returns http success' do
        skip
        get '/articles/update'
        expect(response).to have_http_status(:success)
      end
    end

    describe 'DELETE /articles/:id' do
      it 'should render show template' do
        skip
        sign_in user
        delete "/articles/#{article.id}"
        expect(response).to render_template(:index)
      end
    end
  end

  context 'on failure' do
    describe 'GET /articles/new' do
      it 'should render new session template' do
        skip
        get '/articles/new'
        expect(response).to render_template(:new)
      end
    end
  end
end
