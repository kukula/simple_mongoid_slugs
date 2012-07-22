# SimpleMongoidSlugs
When you create application using Rails and Mongoid you should probably notice those not so pretty URLs e.g.: ```http://localhost/tasks/500be69b7f8ee3dc0d000002/edit```. SimpleMongoidSlugs gem can simply turn them to something like: ```http://localhost/tasks/buy-some-milk/edit```. Gem provides you simple methods to add slug field for your model, populate it and use it. 

### How-to
```ruby
# Add to Gemfile and run bundle:
gem 'simple_mongoid_slugs', :git => 'git@github.com:anatoliku/simple_mongoid_slugs.git'

# If your model contains name attribute, just add ```include SimpleMongoidSlugs```
class Task
  include Mongoid::Document
  include SimpleMongoidSlugs

  field :name, type: String
end

# Then in controller change  
Task.find(params[:id])
# to  
Task.find_by_slug(params[:id])
```

### Features
* overrides ```to_param``` that returns a String, which Action Pack uses for constructing an URL to this object.
* make slugs always unique

### To-do
* make configurable 
* add Cyrillic symbols support

This project rocks and uses MIT-LICENSE.
