require 'rails_helper'

RSpec.describe Collection, type: :model do

  describe 'validation' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_most(255) }
    it { is_expected.to validate_length_of(:description).is_at_least(1) }
  end

  describe "relations" do
    it { is_expected.to have_many(:meditations) }
  end

end
