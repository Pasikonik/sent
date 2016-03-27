class MassJob < ApplicationJob
  queue_as :default

  def perform()
    Destination.all.each do |destination|
      PushItemJob.perform_later(destination)
    end
  end
end
