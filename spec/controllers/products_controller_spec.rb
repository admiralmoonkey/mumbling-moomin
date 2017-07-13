require 'rails_helper'

describe ProductsController, type: :controller do
  let(:user) {@user = FactoryGirl.create(:user)}
  let(:product) {@product = FactoryGirl.create(:product)}

  context 'GET #index' do
    before do
      get :index
    end

    it 'renders the product index page' do
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  context 'GET #show' do
    it 'renders the show page' do
      get :show, params: {id: product}
      expect(response).to be_ok
      expect(response).to render_template('show')
    end
  end

  context 'GET #new' do
    before do
      sign_in user
    end

    it 'creates a new product' do
      @product = Product.new()
      expect(@product).to be_a_new(Product)
    end

    #redirects to index
    context 'admin not logged in' do
      it 'does not render the new product page' do
        get :new
        expect(response).to redirect_to(root_path)
      end
    end

    #renders new page if admin
    context 'admin logged in' do
      before do
        user.admin = true
        user.save
      end

      it 'renders to new product page' do
        get :new
        expect(response).to render_template('new')
      end
    end
  end

  context 'GET #edit' do
    context 'not admin' do
      it 'redirects to index if not admin' do
        get :edit, params: {id: product}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'admin logged in' do
      before do
        user.admin = true
        user.save
        sign_in user
      end
      it 'renders edit page if signed in and admin' do
        get :edit, params: {id: product}
        expect(response).to render_template('edit')
      end
    end
  end

  context 'GET #update' do
    before do
      sign_in user
    end

    context 'admin not logged in' do
      it 'redirects to index page' do
        get :update, params: {id: product}
        expect(response).to redirect_to(root_path)
      end
    end

    context 'admin logged in' do
      before do
        user.admin = true
        user.save
      end

      it 'updates product name' do
        attr = { :name => "new name", :image_url => product.image_url, :id => product.id, :price => product.price }
        put :update, params: { :id => product.id, :product => attr }
        product.reload
        expect(product.name).to eq "new name"
      end
    end
  end

  context 'POST #create' do
    context 'attributes are valid' do
      it 'saves product in database' do
        product2 = FactoryGirl.build(:product)
        expect(product2).to be_valid
      end
    end

    context 'attributes are invalid' do
      it 'is invalid product' do
        product2 = FactoryGirl.build(:product, image_url: nil)
        expect(product2).to_not be_valid
      end
    end
  end

  context 'DELETE #destroy' do
    before do
      user.admin = true
      user.save
      sign_in user
    end

    it 'deletes product' do
      expect(delete :destroy, params: {:id => product} ).to redirect_to(products_url)
    end
  end
end
