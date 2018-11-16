class ChangeDecimalToInteger < ActiveRecord::Migration[5.2]

    def up
      Product.all.each do |product|
        product.price = product.price * 100
      end

      change_column :products, :price, :integer

    end

    def down
      change_column :products, :price, :decimal
    end

end
