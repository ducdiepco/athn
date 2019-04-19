class MedicationsQuery
  attr_reader :relation, :params

  def initialize(params = {}, relation = Medication)
    @relation = relation
    @params = params
  end

  def all
    relation.all
  end
end
