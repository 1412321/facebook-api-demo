require 'mimemagic'
module ApplicationHelper
  def file_type(file)
    if file.respond_to?(:read)
      MimeMagic.by_magic(file.read).type
    elsif file_data.respond_to?(:path)
      MimeMagic.by_magic(File.open(file.path)).type
    end
  end
end
