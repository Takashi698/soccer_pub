require 'rails_helper'
RSpec.describe Comment, type: :model do
  describe 'commentモデル機能' do
    context 'バリデーションテスト' do
      it 'コメントが空の場合' do
        user4 = create(:user4)
        game3 = create(:game3)
        comment = Comment.new(content: nil, user_id: user4.id, game_id: game3.id)
        expect(comment).to be_invalid
      end
    end
  end
end