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

  context "zero price" do
    before do
      product.price = 0
    end
    it "is invalid" do
      expect(product.valid?).to be false
    end
  end

  context "small price" do
    before do
      product.price = 0.0001
    end
    it "is invalid" do
      expect(product.valid?).to be false
    end
  end

  context "Presence of Title and Description" do
    it "is valid" do
      expect(product.title.blank?).to be false
    end

    it "is valid" do
      expect(product.description.blank?).to be false
    end
  end

  context "Format of Image URL" do
    it "is invalid" do
      expect(%r{\.(gif|jpg|png)\Z}i.match? product.image_url).to be true
    end
  end

  context "Unique titles" do
    before do
      Product.create(title: 'Product 1',
                  description: 'A great product',
                  image_url: 'http://somewhere.com/image.png',
                  price: 123.45)
    end
    it "is invalid" do
      expect(Product.count).to be 1
      expect(product.save).to be false
    end
  end

  context "Save to DB" do
    before do
      product.save!
    end
    it "is valid" do
      expect(Product.count).to be 1
    end
  end

  context "Title length" do
    it "is invalid" do
      expect(product.valid?).to be false
    end
  end

end