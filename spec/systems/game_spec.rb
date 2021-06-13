require 'rails_helper'
RSpec.describe '試合ルーム関連機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @horse_diary = FactoryBot.create(:game, user_id: @user.id)
    visit new_user_session_path
    click_on 'ゲストログイン（閲覧用）'
  end
  it '試合ルーム作成機能' do
  end
  it '試合ルーム編集機能' do
  end
  it '試合ルーム削除機能' do
  end
  it '試合ルーム検索機能' do
  end
  it '試合ルームお気に入り機能' do
  end
  it 'コメント機能' do
  end
end