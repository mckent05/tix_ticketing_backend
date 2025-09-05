# frozen_string_literal: true

module Mutations
  class SignOut < BaseMutation
    type Types::AuthPayloadType


    def resolve
      authenticate!
      context[:sign_out].call
      { user: nil, errors: [] }
    end
  end
end
