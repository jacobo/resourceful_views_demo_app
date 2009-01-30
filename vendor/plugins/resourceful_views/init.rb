# require 'resourceful_views'
$:.unshift "#{File.dirname(__FILE__)}/lib"
require 'resourceful_views_helper'
require 'resourceful_views'

ActionController::Base.helper ResourcefulViewsHelper

ActionController::Base.class_eval do
  include ResourcefulViews::ActionControllerExtensions
end

ActionView::Base.class_eval do
  
  def _pick_template_with_extra_default_paths(template_path)
    begin
      _pick_template_without_extra_default_paths(template_path)
    rescue ActionView::MissingTemplate => e
      puts "caught #{e} " + template_path.inspect
      
      template_exists_checker = Proc.new do |template_name|
        begin
          _pick_template_without_extra_default_paths(template_name) ? true : false
        rescue ActionView::MissingTemplate
          false
        end
      end
      
      template_path = ResourcefulViews.determine_view_path_from_parts(template_path.split("/")) do |path_base, path_last|
        template_exists_checker.call("#{path_base}/#{path_last}")
      end
      if template_path
        _pick_template_without_extra_default_paths(template_path)
      else
        raise e
      end
    end
  end
  
  alias_method_chain :_pick_template, :extra_default_paths
  
end