class FoodsController < ApplicationController

  def index
    # binding.pry params[:q]
    render locals: {
      facade: FoodsFacade.new(params[:q])
    }
  end

end
