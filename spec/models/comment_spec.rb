require 'rails_helper'
describe 'Commentモデル機能', type: :model do
  context 'バリデーション' do
    it 'commentのcontentが空の場合' do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:game, user_id: user.id)
      comment = Comment.new(content: nil, user_id: user.id, game_id: game.id)
      expect(comment).not_to be_valid
    end
  end
end
