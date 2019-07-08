class FoodsController < ApplicationController

  def index
    render locals: {
      facade: FoodsFacade.new(params[:q], limit=10)
    }
  end

end
