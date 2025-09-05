# frozen_string_literal: true

module Mutations
  class SignUp < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true
    argument :first_name, String, required: false
    argument :last_name, String, required: false
    argument :username, String, required: false
    argument :role, Integer, required: false

    type Types::AuthPayloadType

    def resolve(email:, password:, first_name:, last_name:, role:, username: nil)
      user = User.new(email:, password:, first_name:, last_name:, username:, role:)
      if user.save
        # trigger jwt dispatch via devise-jwt
        context[:sign_in].call(user)
        { user:, errors: [] }
      else
        { user: nil, errors: user.errors.full_messages }
      end
    end
  end
end
