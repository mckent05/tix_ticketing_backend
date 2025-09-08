# frozen_string_literal: true

module Mutations
  class SignIn < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    type Types::AuthPayloadType


    def resolve(email:, password:)
      user = User.find_for_authentication(email:)
      raise GraphQL::ExecutionError, 'Invalid email or password' unless user&.valid_password?(password)

      context[:sign_in].call(user)

      token = context[:controller].request.env['warden-jwt_auth.token']
      { user:, errors: [], token: token }
    end
  end
end
