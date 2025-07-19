class FailingJob < ApplicationJob
  queue_as :default

  def perform(*args)
    sleep 5
    raise "failing job"
  end
end
