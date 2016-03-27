class Destination < ApplicationRecord
  has_many :items
  belongs_to :user

  def queue
    items.where(status: 'wait').reverse
  end

  def sent_list
    items.where(status: 'sent')
  end

  def get_last_from_queue
    queue.last
  end

  def page_token
    data = user.get_page_token(fb_page)
  end
end
