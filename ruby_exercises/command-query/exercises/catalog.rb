class Catalog
    def initialize
        @products = []
    end

    def cheapest
        return nil if @products.empty?

        cheapest = @products[0]
        @products.each do |product|
            cheapest = product if product.price < cheapest.price
        end
        cheapest.name
    end

    def <<(product)
        @products << product
    end
end
