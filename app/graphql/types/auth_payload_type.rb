# frozen_string_literal: true

module Types
  class AuthPayloadType < Types::BaseObject
    field :user, Types::UserType, null: true
    field :errors, [String], null: false
    field :token, String, null: false
  end
end
