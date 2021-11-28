# frozen_string_literal: true

users = [
  { username: 'demo_user@test.com', password: 'p@ssw@rd', age: 30 },
  { username: 'gatorjuice@gmail.com', password: 'p@ssw@rd', age: 40 },
  { username: 'funny_bot@about_me_api.com', password: 'p@ssw@rd', age: 1 }
]

todos = [
  { title: 'get milk', details: 'grab milk from store' },
  { title: 'shower cat', details: 'cat smells, needs bath' }
]

User.create!(users)
User.last.favorites.create!(category: :beverage, description: 'Coke')

User.find_by!(username: 'demo_user@test.com').funny_bot_messages.create!(
  body: 'Hi, Funny Bot. What is the meaning of life?'
)

User.find_by!(username: 'funny_bot@about_me_api.com').funny_bot_messages.create!(
  body: 'I wish I knew!!!',
  created_by_funny_bot: true
)

User.find_by!(username: 'demo_user@test.com').todos.create!(todos)
