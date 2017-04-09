require 'active_support/concern'

module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(params)
      results = self.where(nil)
      params.each do |key, value|
        results = results.public_send(key, value) if value.present?
      end
      results
    end
  end
end
