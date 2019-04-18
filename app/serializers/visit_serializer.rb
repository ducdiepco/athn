class VisitSerializer < ActiveModel::Serializer
  attributes :id, :visit_date, :notes
  belongs_to :provider, serializer: ProviderSerializer
end
