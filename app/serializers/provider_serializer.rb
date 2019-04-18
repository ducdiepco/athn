class ProviderSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name,
             :office_address, :office_city,
             :office_city, :office_state
end
