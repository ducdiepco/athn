class DiagnosesQuery
  attr_reader :relation, :params

  def initialize(params = {}, relation = Diagnosis)
    @relation = relation
    @params = params
  end

  def all
    relation.all
  end
end
