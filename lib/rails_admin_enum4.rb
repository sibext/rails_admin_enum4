require "rails_admin_enum4/engine"

module RailsAdminEnum4
end

require 'rails_admin/config/fields'
require 'rails_admin/config/fields/base'

module RailsAdmin
  module Config
    module Fields
      module Types
        class Enum4 < RailsAdmin::Config::Fields::Base
          RailsAdmin::Config::Fields::Types::register(self)

          register_instance_option :enum_values do
            data_name = name.to_s.pluralize(100)
            @enum_values ||= bindings[:object].class.respond_to?(data_name) || bindings[:object].respond_to?(data_name) ? data_name : name
          end

          register_instance_option :values do
            bindings[:object].class.respond_to?(enum_values) ? bindings[:object].class.send(enum_values) : bindings[:object].send(enum_values)
          end

          register_instance_option :partial do
            :form_enum4
          end

          register_instance_option :pretty_value do
            if value
              I18n::t "enum.values.#{values.keys[value]}", default: values.keys[value].capitalize
            else
              I18n::t "enum.none", default: 'None'
            end
          end

          def self.data_for_name name
            name.to_s.pluralize(100)
          end

        end
      end
    end
  end
end

RailsAdmin::Config::Fields.register_factory do |parent, properties, fields|
  model = parent.abstract_model.model
  method_name = RailsAdmin::Config::Fields::Types::Enum4::data_for_name properties.name
  puts "#{model} >>>>> #{properties.type} #{properties.name} #{method_name}\n"

  if (not properties.name.to_s.eql? 'id') && \
      properties.type.to_s.eql?('integer') &&
      !Object.respond_to?(method_name) && \
      model.respond_to?(method_name)
    fields << RailsAdmin::Config::Fields::Types::Enum4.new(parent, properties.name, properties)
    puts "ADDED"
    true
  else
    false
  end
end


