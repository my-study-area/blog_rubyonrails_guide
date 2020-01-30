require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'As an unlogged user' do
    context 'GET #index' do
      it 'redirect to login' do
        article = FactoryBot.create(:article)
        comment = FactoryBot.create(:comment, article: article)
        get :index, params: { article_id: article.id }
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'POST #create' do
      it 'redirect to login' do
        article = FactoryBot.create(:article)
        comment = FactoryBot.attributes_for(:comment)
        post :create, params: { article_id: article.id, comment: { commenter: comment[:commenter], body: comment[:body] } }
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

    context 'POST #create' do
      it 'redirect to the article page' do
        article = FactoryBot.create(:article)
        comment = FactoryBot.attributes_for(:comment)
        post :create, params: { article_id: article.id, comment: { commenter: comment[:commenter], body: comment[:body] } }
        expect(response).to redirect_to article
      end

      it 'creates a new comment' do
        article = FactoryBot.create(:article)
        comment = FactoryBot.attributes_for(:comment)

        expect{
          post :create, params: { article_id: article.id, comment: { commenter: comment[:commenter], body: comment[:body] } }
        }.to change(Comment, :count).by 1
      end
    end

    context 'DELETE #destroy' do
      it 'redirects to articles page' do
        article = FactoryBot.create(:article)
        comment = FactoryBot.create(:comment, article_id: article.id)
        delete :destroy, params: {article_id: article.id, id: comment.id}
        expect(response).to redirect_to(article)
      end

      it 'destroys the article' do
        article = FactoryBot.create(:article)
        comment = FactoryBot.create(:comment, article_id: article.id)
        expect{
          delete :destroy, params: {article_id: article.id, id: comment.id}
        }.to change(Comment, :count).by(-1)
      end
    end
  end
end
