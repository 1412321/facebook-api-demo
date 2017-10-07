module AlbumsHelper
  def strtodate(str)
    date = Date.parse str
  end

  def content_preview(content)
    if content
      if(content.length > 100)
        content[0..99] + " ..."
      else
        content
      end
    end
  end
end
