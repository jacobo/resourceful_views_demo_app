class PostsController < GenericController
  
  resourceful_views_theme :treeview
  
  def current_model
    Post
  end
  
end
