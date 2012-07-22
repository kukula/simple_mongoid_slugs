module SimpleMongoidSlugs
  module ClassMethods
    def find_by_slug(param)
      find_by(slug: param)
    end
  end
  
  module InstanceMethods
    def add_slug
      attributes['slug'] ||= name.to_slug
      # slug should be present
      # slugs are unique so we should prevent validation fails, 
      # by adding "-" to the end of slug
      if attributes['slug'].blank? || self.class.where(slug: slug).count > 0
        attributes['slug'] += "-"
        add_slug
      end
    end

    def to_param
      slug
    end
  end
  
  def self.included(receiver)
    receiver.extend ClassMethods
    receiver.send :include, InstanceMethods
    receiver.field :slug, type: String
    receiver.validates_presence_of :slug
    receiver.validates_uniqueness_of :slug
    receiver.before_validation :add_slug, on: :create
    receiver.index({ slug: 1 }, { unique: true, name: "slug_index" })
  end

  class ::String
    def to_slug
      ret = self.strip.gsub /['`]/,""
      ret.gsub! /\s*@\s*/, " at "
      ret.gsub! /\s*&\s*/, " and "
      ret.parameterize
    end
  end
end