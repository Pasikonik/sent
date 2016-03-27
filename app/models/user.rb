class User < ApplicationRecord
  has_many :destinations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.image = auth.info.image
      user.token = auth.credentials.token
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def page_list
    get_pages_data.map { |page| page['name'] }
  end

  def get_page_token(page_name)
    page = get_pages_data.find { |page| page['name'] == page_name }
    page['access_token']
  end

  private

  def get_pages_data
    @graph = Koala::Facebook::API.new(token)
    @graph.get_connections('me', 'accounts')
  end
end
