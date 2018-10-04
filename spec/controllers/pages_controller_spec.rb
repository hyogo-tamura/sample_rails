require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  describe 'GET #index with Login' do
    render_views
    before do
      login_user user
      get :index
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'renders the :index template' do
      expect(response.body).to include('ログアウト')
    end
  end

  describe 'GET #index without Login' do
    render_views

    before do
      get :index
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'renders the :index template' do
      expect(response.body).to include('ログイン')
    end
  end
end
