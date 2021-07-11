require "rails_helper"

RSpec.describe Devise::HeaderComponent, type: :component do
  context 'when all content is provided' do
    subject(:component) do
      described_class.new(
        intro: 'Intro',
        lead_in: 'Lead In',
        action_label: 'Sign In',
        action_path: '/sign_in'
      )
    end

    it 'renders a header with the provided content' do
      render_inline(component)

      expect(rendered_component).to include('Intro')
      expect(rendered_component).to include('Lead In')
      expect(rendered_component).to include('Sign In')
      expect(rendered_component).to include('/sign_in')
    end
  end

  context 'when lead_in is not provided' do
    subject(:component) do
      described_class.new(
        intro: 'Intro',
        lead_in: '',
        action_label: 'Sign In',
        action_path: '/sign_in'
      )
    end

    it 'does not render the lead in section' do
      render_inline(component)

      expect(rendered_component).to include('Intro')
      expect(rendered_component).not_to include('Sign In')
    end
  end
end
