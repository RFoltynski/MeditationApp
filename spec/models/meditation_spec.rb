require 'rails_helper'

RSpec.describe Meditation, type: :model do
  describe 'validation' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe "relations" do
    it { is_expected.to belong_to(:collection) } 
  end

end
