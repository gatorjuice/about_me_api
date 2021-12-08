module Queries
  class FetchTodos < Queries::BaseQuery

    type [Types::TodoType], null: false

    def resolve
      Todo.all.order(created_at: :desc)
    end
  end
end
