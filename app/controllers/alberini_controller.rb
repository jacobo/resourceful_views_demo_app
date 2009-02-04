class AlberiniController < ApplicationController
  
  resources_controller_for :alberini
  
  def current_model
    resource_class
  end

  def current_object
    resource
  end

  def current_objects
    resources
  end
  
end
