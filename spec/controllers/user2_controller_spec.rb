require 'rails_helper'

describe UsersController, type: :controller do
  let(:user1) { User.create!(email: 'peter@example.com', password: '1234567890') }
  let(:user2) { User.create!(email: 'paul@example.com', password: '0987654321') }


  describe 'GET #show' do

     context 'when user1 is logged in' do
       before do
        sign_in user1
       end
        it "cannot load show page of user2" do
          get :show, params: { id: user2.id }
          expect(response).to redirect_to(root_path)
        end
     end


  end

end
