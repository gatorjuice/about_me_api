# frozen_string_literal: true

# Creates Users
class CreateUser
  include Interactor

  def call
    user = User.new(context.user_params)

    if user.save
      context.user = user
    else
      context.fail!(message: user.errors.full_messages)
    end
  rescue ActiveRecord::RecordInvalid => e
    context.fail!(message: [e.message])
  end
end
