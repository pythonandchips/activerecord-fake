require "active_record_fake/version"

module ActiveRecord
  class Fake
    attr_accessor :has_one_association, :has_one_options, :validates_associated_value, :saved, :id


    def initialize(param={})
      param.each_pair do |key, value|
        if self.respond_to?("#{key}=")
          self.send("#{key}=", value)
        end
      end
    end

    def self.transaction
      yield
    end

    def self.attributes
      @@attributes
    end

    def self.validates_associated class_name
      @@validated_associated ||= []
      @@validated_associated << klass
    end

    def self.fakes(class_name)
      @fake_class = Object.const_get(class_name.to_s.classify)
    end

    def self.belongs_to class_name, *args
    end

    def self.has_many class_name, *args
      self.instance_eval do
        define_method klass_name do |*args|
          self.instance_variable_get(:"@#{klass_name}")
        end
        define_method "#{klass_name}=" do |*args|
          self.instance_variable_set(:"@#{klass_name}", *args)
        end
      end
      @@attributes ||= []
      @@attributes << klass_name
    end

    def self.has_one class_name, *args
      self.instance_eval do
        define_method klass_name do |*args|
          self.instance_variable_get(:"@#{klass_name}")
        end
        define_method "#{klass_name}=" do |*args|
          self.instance_variable_set(:"@#{klass_name}", *args)
        end
      end
      @@attributes ||= []
      @@attributes << klass_name
    end

    def self.base_class
      @fake_class
    end

    def save
      @saved = true
    end

    def destroyed?
      false
    end

    def new_record?
      false
    end
  end
end
