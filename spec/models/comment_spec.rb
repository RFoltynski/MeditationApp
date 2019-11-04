require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validation' do
    it { is_expected.to validate_presence_of(:content) }
  end

  describe "relations" do
    it { is_expected.to belong_to(:meditation) }
    it { is_expected.to belong_to(:user) }
  end
end
