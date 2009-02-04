class PoteauxController < ResourceController::Base
  
  def current_model
    model
  end
  
  def current_object
    object
  end
  
  def current_objects
    collection
  end
  
end
