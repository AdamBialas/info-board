class ImageWorker
  include Sidekiq::Worker

  def perform(name,count)
    count.times do p name end
    # Do something
  end
end
