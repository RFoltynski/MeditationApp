require 'rails_helper'

RSpec.describe CollectionsController, type: :controller do

  let(:user) { create(:user) }
  before { sign_in(user) }

  describe 'GET #new' do
    before { get :new }
    describe 'successful response' do
      it { expect(response).to be_successful }
      it { expect(response).to render_template('new') }
    end
  end

  describe 'GET #show' do
    let(:collection) { create(:collection) }
    before { get :show, params: { id: collection.id } }

    describe 'successful response' do
      it { expect(response).to be_successful }
      it { expect(response).to render_template('show') }
    end

    describe 'collection' do
      it 'returns one collection by given id' do
        expect(assigns(:collection)).to eq(collection)
      end
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) { { collection: { name: 'test', description: 'testtest' } } }
    let(:invalid_attributes) { { collection: { name: ' ', description: '' } } }

    context 'valid attributes' do
      subject { post :create, params: valid_attributes }

      it { expect(subject).to redirect_to(users_path) }
      it { expect { subject }.to change(Collection, :count).by(1) }
    end
    context 'invalid attributes' do
      subject { post :create, params: invalid_attributes }

      it { expect(subject).to render_template('new') }
      it { expect { subject }.to change(Collection, :count).by(0) }
    end
  end
end
