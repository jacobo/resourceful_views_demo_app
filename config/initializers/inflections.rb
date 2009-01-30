# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format 
# (all these examples are active by default):
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

ActiveSupport::Inflector.inflections do |inflect|
  
  # Generic Controller will use:
  #English:   "post", "posts"

  # Make Resourceful will use:
  #German
  inflect.irregular "blogpfost", "blogpfosten"
  
  # Resource Controller will use:
  #French
  inflect.irregular 'poteau', 'poteaux'
  
  # Resources Controller will use:
  #Italian
  inflect.irregular 'alberino', 'alberini'
  
  # Resource This will use:
  #Portuguese: 'borne', 'bornes'

end

