# frozen_string_literal: true

class Shared::PrimaryButtonComponent < ViewComponent::Base
  def initialize(label:)
    @label = label
  end
end
