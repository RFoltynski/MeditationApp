require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user) }

  before { sign_in(user) }

  describe 'POST #create' do 


  let(:valid_collection) { { comment: { content: 'testsdfasdf', meditation_id: 38, user_id: user.id } } }
  let(:invalid_collection) { { comment: { content: '', meditation_id: 38, user_id: user.id  } } }

  context 'valid attributes' do
    
    subject { post :create, params: valid_collection }

    it { expect(subject).to redirect_to("/meditations/38") }
    it { expect { subject }.to change(Comment, :count).by(1) }
  end
  
  context 'invalid attributes' do
    subject { post :create, params: invalid_collection }

    it { expect { subject }.to change(Comment, :count).by(0) }
  end

end
end
