# ./grubhub_order.rb
require './lib/online_order'

class GrubhubOrder
  include OnlineOrder

  attr_reader :type, :time

  def initialize
    @type = 'food'
    @time = '45-60 minutes'
  end
end
