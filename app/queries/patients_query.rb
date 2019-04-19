class PatientsQuery
  attr_reader :relation, :params

  def initialize(params = {}, relation = Patient)
    @relation = relation
    @params = params
  end

  def all
    relation.all
  end
end
