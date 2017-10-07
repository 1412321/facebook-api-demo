class Facebook
  class << self
    def fbgraph(token)
      Koala::Facebook::API.new(token)
    end
    
    def get_object(token, id, args = {}, options = {}, &block)
      fbgraph(token).get_object(id, args, options, &block)
    end

    def get_image(user, id)
      return fbgraph(user.token).get_object(id, fields: 'images')
    end

    def get_albums(user)
      return fbgraph(user.token).get_connections("#{user.uid}", "albums", fields: 'name,link,cover_photo')
    end
  end
end