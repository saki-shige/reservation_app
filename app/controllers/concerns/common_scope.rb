require 'active_support'

module CommonScope
    extend ActiveSupport::Concern

    included do
      scope :recent, -> { order(created_at: :desc)}
    end
end
