require 'rails_helper'
RSpec.describe 'user関連機能', type: :system do
  describe 'devise関連機能' do
    it 'サインアップ機能' do
      visit new_user_registration_path
      # binding.irb
      fill_in '名前', with: 'Taka'
      fill_in 'Eメール', with: 'test2@example.com'
      fill_in 'パスワード', with: 'password'
      fill_in 'パスワード（確認用）', with: 'password'
      click_button '新規登録'
      expect(page).to have_content 'マイページ編集'
      expect(page).to have_content 'お気に入り一覧'
      expect(page).to have_content '試合ルーム一覧へ'
    end
    it 'ログイン機能' do
      visit new_user_session_path
      fill_in 'Eメール', with: 'test2@example.com'
      fill_in 'パスワード', with: 'password'
      click_on 'ログイン'
      expect(page).to have_content 'マイページ編集'
      expect(page).to have_content 'お気に入り一覧'
      expect(page).to have_content '試合ルーム一覧へ'
    end
  end
  describe 'その他機能' do
    # it 'お気に入り一覧機能' do
    # end
    # it 'フォロー一覧機能' do
    # end
    it 'ゲストログイン機能' do
      visit new_user_session_path
      binding.irb
      click_on 'ゲストログイン（閲覧用）'
      expect(page).to have_content 'マイページ編集'
      expect(page).to have_content 'お気に入り一覧'
      expect(page).to have_content '試合ルーム一覧へ'
    end
  end
end 