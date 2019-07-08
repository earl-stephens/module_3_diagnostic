class Food
  attr_reader :ndb_number,
              :name,
              :food_group,
              :data_source,
              :manufacturer

  def initialize(food_parameters)
    @ndb_number = food_parameters[:ndbno]
    @name = food_parameters[:name]
    @food_group = food_parameters[:group]
    @data_source = food_parameters[:ds]
    @manufacturer = food_parameters[:manu]
  end

end
