require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  render_views

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index content" do
    before do
      Product.create!(title: 'Product ----------1',
                      description: 'A great product',
                      image_url: 'http://somewhere.com/image.png',
                      price: 123.45)
    end
    it "returns http success" do
      get :index
      # puts response.body
      expect(response.body.include? 'Product ----------1').to be true
    end
  end
end
