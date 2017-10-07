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

    def create_image(user, id, file)
      fbgraph(user.token).put_picture(file, {}, id)
    end

    def get_albums(user)
      return fbgraph(user.token).get_connections("#{user.uid}", "albums", fields: 'name,link,cover_photo')
    end
    def create_albums(user, tittle)
      return fbgraph(user.token).put_connections("#{user.uid}", "albums", name: tittle)
    end
  end
end