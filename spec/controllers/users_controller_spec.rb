:require 'rails_helper'

describe UsersController, type: :controller do
  # let(:user) {User.create!(email: "john@email.com", password: "password123")}
  let(:user) {@user = FactoryGirl.create(:user)}
  describe 'GET #show' do
    context 'when user is logged in' do
      before do
        sign_in user
      end

      it 'loads current user details' do
        get :show, params: { id: user.id }
        expect(response).to be_ok
        expect(assigns(:user)).to eq user
      end
    end

    context 'when a user is not logged in' do
      it 'redirects to login' do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'user tries to access another users page' do
      # let(:user2) {User.create!(email: "matt@email.com", password: "password456")}
      let(:user2) {@user = FactoryGirl.create(:user)}
      before do
        sign_in user
      end

      it 'redirects to index' do
        get :show, params: {id: user2.id}
        expect(response).to have_http_status 302
        expect(response).to redirect_to(root_path)
      end
    end

  end
end
