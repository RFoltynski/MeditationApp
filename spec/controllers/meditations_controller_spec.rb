require 'rails_helper'

RSpec.describe MeditationsController, type: :controller do
  let(:user) { create(:user) }
  let(:collection) { create(:collection)}
  before { sign_in(user) }
  
  describe 'GET #index' do
    before { get :index }
    describe 'successful response' do
      it { expect(response).to be_successful }
      it { expect(response).to render_template('index') }
    end
  end

  describe 'GET #new' do
  before { get :new }
    describe 'successful response' do
      it { expect(response).to be_successful }
      it { expect(response).to render_template('new') }
    end
  end
end
