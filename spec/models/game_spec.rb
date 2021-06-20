require 'rails_helper'
describe 'Gameモデル機能', type: :model do
  # upshot = FactoryBot.create(:upshot, user_id: user.id)
  upshot = FactoryBot.create(:upshot)
  user2 = FactoryBot.create(:user2)
  # user = FactoryBot.create(:user, name:'test_use5', email: 'test5@example.com', password:'password' )
  # user = FactoryBot.create(:user5, name:'test_user5', email: 'test5@example.com', password:'password' )
  # upshot = FactoryBot.create(:upshot, team_a_id: team_a.id, team_b_id: team_b.id, team_a_point)
  # game = FactoryBot.create(:game, user_id: user.id)
    
    describe 'バリデーションテスト' do
      context '入力が正しい場合' do
        it '新規作成ができる' do
          expect(upshot).to be_valid
        end
      end
      # binding.irb
      context 'チーム1の名前が空の場合' do
        it 'バリデーションエラーとなる' do
          team_a_id = ''
          expect(upshot).not_to be_invalid
        end
      end
      context 'チーム2の名前が空の場合' do
        it 'バリデーションエラーとなる' do
          team_b_id = ''
          expect(upshot).not_to be_invalid
        end
      end
      context 'チームの点数が空の場合' do
        it 'バリデーションエラーとなる' do
          team_a_point = ''
          expect(upshot).not_to be_invalid
        end
      end
      context 'チームの点数が空の場合' do
        it 'バリデーションエラーとなる' do
          team_b_point = ''
          expect(upshot).not_to be_invalid
        end
      end
      context 'コンテントが1000文字以上の場合' do
        it 'バリデーションエラーとなる' do
          user = FactoryBot.create(:user, name:'test_user33', email: 'test33@example.com', password:'password')
          game = FactoryBot.create(:game, content: "content", place: "Osaka", user_id: user.id )
          game.content = 'a'*1001
          expect(game).to be_invalid
        end
      end
    end
  end
  