require 'rails_helper'

# RSpec.describe Product, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

RSpec.describe Product, type: :model do
  subject(:product) { Product.new(title: 'Product 1',
                                  description: 'A great product',
                                  image_url: 'http://somewhere.com/image.png',
                                  price: 123.45) }

  context "valid product" do
    it "is valid" do
      expect(product.valid?).to be true
    end
  end

  context "negative price" do
    before do
      product.price = -123.45
    end
    it "is invalid" do
      expect(product.valid?).to be false
    end
  end

end