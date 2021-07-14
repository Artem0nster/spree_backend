module Spree
  module MultipleStoresResource
    extend ActiveSupport::Concern

    included do
      validate :must_have_one_store, unless: :disable_store_presence_validation?
    end

    protected

    def must_have_one_store
      return if stores.any?

      errors.add(:stores, Spree.t(:must_have_one_store))
    end

    # this can be overriden on model basis
    def disable_store_presence_validation?
      Spree::Config[:disable_store_presence_validation]
    end
  end
end
