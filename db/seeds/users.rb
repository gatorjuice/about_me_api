# frozen_string_literal: true

users = [
  { username: 'demo_user@test.com', password: 'p@ssw@rd', age: 30 },
  { username: 'gatorjuice@gmail.com', password: 'p@ssw@rd', age: 40 },
  { username: 'funny_bot@about_me_api.com', password: 'p@ssw@rd', age: 1 }
]
User.create!(users)
User.last.favorites.create!(category: :beverage, description: 'Coke')
