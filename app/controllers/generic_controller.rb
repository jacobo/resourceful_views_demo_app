class GenericController < ApplicationController  
  
  def current_object
    instance_variable_get("@#{current_model.name.underscore}")
  end
  
  def current_object=(arg)
    instance_variable_set("@#{current_model.name.underscore}", arg)
  end
  
  def current_objects
    instance_variable_get("@#{current_model.name.pluralize.underscore}")
  end
  
  def current_objects=(arg)
    instance_variable_set("@#{current_model.name.pluralize.underscore}", arg)
  end
  
  # GET /posts
  # GET /posts.xml
  def index
    self.current_objects = current_model.find(:all)

    respond_to do |format|
      format.html { render_resource :index }# index.html.erb
      format.xml  { render :xml => self.current_objects }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    self.current_object = current_model.find(params[:id])

    respond_to do |format|
      format.html { render_resource :show }# show.html.erb
      format.xml  { render :xml => self.current_object }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    self.current_object = current_model.new

    respond_to do |format|
      format.html { render_resource :new }# new.html.erb
      format.xml  { render :xml => self.current_object }
    end
  end

  # GET /posts/1/edit
  def edit
    self.current_object = current_model.find(params[:id])
    render_resource :edit
  end

  # POST /posts
  # POST /posts.xml
  def create
    self.current_object = current_model.new(params["#{current_model.name.singularize.underscore}"])

    respond_to do |format|
      if self.current_object.save
        flash[:notice] = "#{current_model.name} was successfully created."
        format.html { redirect_to(self.current_object) }
        format.xml  { render :xml => self.current_object, :status => :created, :location => self.current_object }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => self.current_object.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    self.current_object = current_model.find(params[:id])

    respond_to do |format|
      if self.current_object.update_attributes(params["#{current_model.name.singularize.underscore}"])
        flash[:notice] = "#{current_model.name} was successfully updated."
        format.html { redirect_to(self.current_object) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => self.current_object.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    self.current_object = current_model.find(params[:id])
    self.current_object.destroy

    respond_to do |format|
      format.html { redirect_to(:action => 'index') }
      format.xml  { head :ok }
    end
  end
end
