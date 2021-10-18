class Concerts::CreateWorker
  include Sidekiq::Worker

  def perform(*args)
    Concert.create!
  end
end
