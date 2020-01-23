require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'As an unlogged user' do
    context 'GET #index' do
      it 'redirect to login' do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'GET #show' do
      it 'redirect to login' do
        @article = FactoryBot.create(:article)
        get :show, params: {id: @article.id}
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'POST #create' do
      it 'redirect to login' do
        article = FactoryBot.attributes_for(:article)
        post :create, params: {article: { title: article[:title], text: article[:text] }}
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'PATCH #update' do
      it 'redirect to login' do
        @article = FactoryBot.create(:article)
        article_updated = FactoryBot.attributes_for(:article)
        put :update, params: {id: @article.id, article: article_updated}
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'DELETE #destroy' do
      it 'redirect to login' do
        @article = FactoryBot.create(:article)
        delete :destroy, params: {id: @article.id}
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'As an logged user' do
    before(:each) do
      request.env["devise.mapping"] = Devise.mappings[:user]
      @current_user = FactoryBot.create(:user)
      sign_in @current_user
    end

    context 'GET #index' do
      it 'accesses articles page' do
        get :index
        expect(response).to have_http_status :ok
      end
      it 'List all articles' do
        @articles = FactoryBot.create_list(:article, 3)
        get :index
        expect(Article.count).to eq 3
      end
    end

    context 'GET #show' do
      it 'shows the the article by id' do
        article = FactoryBot.create(:article)
        get :show, params: { id: article.id}
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:show)
      end
    end

    context 'POST #create' do
      it 'redirects to the articles page' do
        article = FactoryBot.attributes_for(:article)
        post :create, params: {article: { title: article[:title], text: article[:text] }}
        expect(response).to redirect_to(Article.last)
      end

      it 'creates a new article' do
        article = FactoryBot.attributes_for(:article)
        expect{
          post :create, params: {article: { title: article[:title], text: article[:text] }}
        }.to change(Article, :count).by 1
      end
    end

    context 'PATCH #update' do
      it 'redirects to article page' do
        @article = FactoryBot.create(:article)
        article_updated = FactoryBot.attributes_for(:article)
        put :update, params: {id: @article.id, article: article_updated}
        expect(response).to redirect_to(@article)
      end

      it 'updates the values of the article' do
        @article = FactoryBot.create(:article)
        article_updated = FactoryBot.attributes_for(:article)
        put :update, params: {id: @article.id, article: article_updated}
        expect(Article.last.title).to eq article_updated[:title]
        expect(Article.last.text).to eq article_updated[:text]
      end
    end

    context 'DELETE #destroy' do
      it 'redirects to articles page' do
        @article = FactoryBot.create(:article)
        delete :destroy, params: {id: @article.id}
        expect(response).to redirect_to(articles_path)
      end
      it 'destroys the article' do
        @article = FactoryBot.create(:article)
        expect{
          delete :destroy, params: {id: @article.id}
        }.to change(Article, :count).by(-1)
      end
    end
  end

end
