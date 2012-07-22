class Task
  include Mongoid::Document
  include SimpleMongoidSlugs

  field :name, type: String
end
