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
  Book.create!(books)

  FunnyBotMessage.create!(user_id: 1, body: 'hello, funnybot')

  GithubRepo.create!(
    [
      { organization: 'vuejs', project: 'vue', category: :javascript_framework },
      { organization: 'facebook', project: 'react', category: :javascript_framework },
      { organization: 'angular', project: 'angular.js', category: :javascript_framework },
      { organization: 'sveltejs', project: 'svelte', category: :javascript_framework },
      { organization: 'emberjs', project: 'ember.js', category: :javascript_framework },
      { organization: 'rails', project: 'rails', category: :fullstack_framework },
      { organization: 'phoenixframework', project: 'phoenix', category: :fullstack_framework },
      { organization: 'django', project: 'django', category: :fullstack_framework },
      { organization: 'nuxt', project: 'nuxt.js', category: :fullstack_framework }
    ]
  )
end
