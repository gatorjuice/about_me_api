# frozen_string_literal: true

if Rails.env.development?
  user = User.create!(username: 'jgates', password: 'password', age: 40)
  user.favorites.create!(category: :drink, description: 'Coke')
end
