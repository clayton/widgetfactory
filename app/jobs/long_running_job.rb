class LongRunningJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "performing long running job"
    sleep 15
  end
end
