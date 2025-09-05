# frozen_string_literal: true

module Types
  class UserType < BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :username, String, null: false
    field :role, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
