class Clearance
    def initialize
        @items = []
    end
    
    def <<(product)
        @items.push(product)
    end

    def best_deal
        return nil if @items.empty?
        highest_discount_item = @items[0]
        @items.each do |product|
            if (product.discount.fdiv(product.price)) > (highest_discount_item.discount.fdiv(highest_discount_item.price))
                highest_discount_item = product 
            end 
        end
        highest_discount_item.name
    end
end
