require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "validation" do
    it { is_expected.to validate_presence_of(:nick) }
    it { is_expected.to validate_uniqueness_of(:nick) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end
end
  