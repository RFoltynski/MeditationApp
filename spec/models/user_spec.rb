require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    it { is_expected.to validate_presence_of(:nick) }
    it { is_expected.to validate_uniqueness_of(:nick) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  describe "relations" do
    it { is_expected.to have_many(:comments) }
  end

  describe 'presence of valuses' do
    let(:user) { build(:user) }

    it 'ensures first name presence' do
      user.nick = nil
      expect(user.save).to eq(false)
    end
    it 'ensures email presence' do
      user.email = nil
      expect(user.save).to eq(false)
    end
    it 'ensures that password is at least 6 character' do
      user.password = '234542'
      expect(user.save).to eq(true)
    end
  end

  describe 'attachment' do
    let(:user1) { create(:user, :with_avatar) }
    let(:user2) { create(:user) }

    it { expect(user1.avatar).to be_attached }

    it 'has correct extension' do
      user2.avatar.attach(io: File.open('spec/files/documents/dummy.pdf'), filename: 'attachment.pdf',content_type: 'application/pdf')
      expect(user2).not_to be_valid
    end
  end
end
