class Facebook
  class << self
    def fbgraph(token)
      Koala::Facebook::API.new(token)
    end
    
    def get_object(token, id, args = {}, options = {}, &block)
      fbgraph(token).get_object(id, args, options, &block)
    end

    def get_friends(user, token)
      return fbgraph(token).get_connections("#{user.uid}", "friends")
    end
  end
end