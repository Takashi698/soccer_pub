require 'rails_helper'
describe 'Gameモデル機能', type: :model do
  context 'バリデーション' do
    it 'gameのcontentが空の場合' do
      user = FactoryBot.create(:user)
      post = Game.new(content: nil, user_id: user.id)
      expect(game).not_to be_valid
    end
  end
end