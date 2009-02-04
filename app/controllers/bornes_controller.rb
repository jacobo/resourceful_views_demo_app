class BornesController < ApplicationController
  
  resource_this
  
  def current_model
    finder_base
  end
  
  def current_objects
    collection
  end
  
  def current_object
     @borne
  end
  
end
