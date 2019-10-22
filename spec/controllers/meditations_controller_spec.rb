require 'rails_helper'

RSpec.describe MeditationsController, type: :controller do
  let(:user) { create(:user) }
  before { sign_in(user) }
  
  describe 'GET #show' do
    before { get :index }

    describe 'successful response' do
      it { expect(response).to be_successful }
      it { expect(response).to render_template('index') }
    end
  end
end
