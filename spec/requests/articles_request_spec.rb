require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:article) { FactoryBot.create(:article, user: user) }

  describe 'POST #create' do
    context 'invalid params' do
      it 'should return an error' do
        skip
        sign_in user
        post articles_path, params: { article: attributes_for(:article_empty) }
        expect(response).to render_template(:new)
      end
    end
  end
end
