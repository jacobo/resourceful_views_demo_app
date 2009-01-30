class BlogpfostenController < ApplicationController
  
  make_resourceful do
    actions :index, :show, :new, :edit, :create, :update, :destroy
  end
  
end
