require 'user'
require_relative '../helpers/database_helpers'

describe 'User' do
  describe '::create' do
    it 'creates a new user' do
      user = User.create(email: 'test@test.com', password: 'Password123', display_name: 'Test User', username: 'test')

      persisted_data = persisted_data(table: :users, id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq(persisted_data.first['id'])
      expect(user.email).to eq('test@test.com')
      expect(user.display_name).to eq('Test User')
      expect(user.username).to eq('test')
    end
  end

  describe '::find' do
    it 'finds a user by ID' do
      created_user = User.create(email: 'test@test.com', password: 'Password123', display_name: 'Test User', username: 'test')
      found_user = User.find(id: created_user.id)

      expect(found_user.id).to eq(created_user.id)
      expect(found_user.email).to eq('test@test.com')
      expect(found_user.display_name).to eq('Test User')
      expect(found_user.username).to eq('test')
    end

    context 'when given nil' do
      it 'returns nil' do
        expect(User.find(id: nil)).to eq(nil)
      end
    end
  end
end