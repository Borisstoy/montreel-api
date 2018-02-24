class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes(*Place.attribute_names.map(&:to_sym))
end