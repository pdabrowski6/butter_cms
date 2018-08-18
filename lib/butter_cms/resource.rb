module ButterCMS
  class Resource
    def initialize(attributes = {})
      attributes.each do |attr, value|
        define_singleton_method(attr) { attributes[attr] }
      end
    end
  end
end
