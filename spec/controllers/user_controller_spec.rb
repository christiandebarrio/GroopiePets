require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe '#show' do
    before (:each) do
      sign_in FactoryGirl.create(:user)
    end
    it 'render the show template' do
      get :show, id: subject.current_user.id
      expect(response).to render_template(:show)
    end

    it 'respond with a 200 status code' do
      get :show, id: subject.current_user.id
      expect(response).to have_http_status(200)
    end
  end
end
