# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    object_class Types::BaseObject

    private

    def current_user
      p context
      context[:current_user]
    end

    def authenticate!
      raise GraphQL::ExecutionError, 'Unauthorized' unless current_user
    end
  end
end
