class Post < ActiveRecord::Base
  
  def object_name
    title
  end
  
end
