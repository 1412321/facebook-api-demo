class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :omniauth_providers => [:facebook]

  def self.create_from_omniauth(params)
    user = find_or_create_by(email: params.info.email, uid: params.uid)
    me = Facebook.get_object(params.credentials.token, "me", fields:'link')
    user.update({
      token: params.credentials.token,
      name: params.info.name,
      avatar: params.info.image,
      link: me["link"]
    })
    user
  end
end
