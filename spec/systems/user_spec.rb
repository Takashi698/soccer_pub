require 'rails_helper'
RSpec.describe 'user関連機能', type: :system do
  describe 'devise関連機能' do
    it 'サインアップ機能' do
      visit new_user_registration_path
      fill_in 'Name', with: 'Taka'
      fill_in 'Eメール', with: 'test1@example.com'
      fill_in 'パスワード', with: 'password'
      fill_in 'パスワード（確認用）', with: 'password'
      click_on 'Sign up'
      expect(page).to have_content '新しく試合ルームを作成する'
    end
    it 'ログイン機能' do
      visit new_user_session_path
      fill_in 'Eメール', with: 'test2@example.com'
      fill_in 'パスワード', with: 'aaaaaa'
      click_on 'Log in'
      expect(page).to have_content '新しく試合ルームを作成する'
    end
  end
  describe 'その他機能' do
    it 'ゲストログイン機能' do
    end
    it 'お気に入り一覧機能' do
    end
    it 'フォロー一覧機能' do
    end
    it '試合ルーム一覧機能' do
      visit new_user_session_path
      click_on 'ゲストログイン（閲覧用）'
      expect(page).to have_content '新しく試合ルームを作成する'
    end
  end
end 