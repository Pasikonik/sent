class PushItemJob < ApplicationJob
  queue_as :default

  def perform(destination)
    return if !destination.fb_page? || destination.queue.count.zero?
    token = destination.page_token
    @graph = Koala::Facebook::API.new(token)
    response = @graph.put_picture(destination.get_last_from_queue.source.url)
    if response.has_key?('id')
      item = destination.get_last_from_queue
      item.update! status: 'sent'
    end
  end
end
