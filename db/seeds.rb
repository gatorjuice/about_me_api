# frozen_string_literal: true

if Rails.env.development?
  user = User.create!(username: 'jgates', password: 'password', age: 40)
  user.favorites.create!(category: :beverage, description: 'Coke')

  books = [
    {
      title: 'The Splurge',
      author: 'Hank Hankerson',
      page_count: 342,
      img_url: 'https://edit.org/photos/img/blog/m68-book-cover-templates.jpg-840.jpg'
    },
    {
      title: 'Monsters of Fruit',
      author: 'Cheryl Moose',
      page_count: 1_322,
      img_url: 'https://edit.org/photos/img/blog/m68-book-cover-templates.jpg-840.jpg'
    }
  ]
  Book.create(books)
end
