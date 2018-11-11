require 'rails_helper'

describe ProductsController, type: :controller do
  let(:product) { FactoryBot.create(:product) }

  context 'POST #create' do



        it "create a new product " do
          params = {
            name: "aa", description: "aa", image_url: "http://www.remadays.com/wp-content/uploads/2016/11/Picture_online-2015.jpg", colour: "dd", price: 3.33
          }
           post :create, params: {product: params}
           expect(response).to redirect_to product_path(product.id)
        end
     end





end
