module Types
  class TodoType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :title, String, null: false
    field :details, String, null: true
    field :due_at, GraphQL::Types::ISO8601DateTime, null: true
    field :completed_at, GraphQL::Types::ISO8601DateTime, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
