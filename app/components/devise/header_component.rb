# frozen_string_literal: true

class Devise::HeaderComponent < ViewComponent::Base
  def initialize(intro:, lead_in: '', action_label: '', action_path: '')
    @intro = intro
    @lead_in = lead_in
    @action_label = action_label
    @action_path = action_path
  end
end
