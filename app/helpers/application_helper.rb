# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def current_model
    controller.current_model
  end
  
  def current_objects
    controller.current_objects
  end
  
  def current_object
    controller.current_object
  end
  
end
