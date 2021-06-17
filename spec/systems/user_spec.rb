require 'rails_helper'
RSpec.describe 'user関連機能', type: :system do
  user = FactoryBot.create(:user, name:'test_user7', email: 'test7@example.com', password:'password')
  before do
    visit root_path
  end

  describe 'devise関連機能' do
    it 'サインアップ機能' do
      visit new_user_registration_path
      # binding.irb
      fill_in '名前', with: 'Test333'
      fill_in 'Eメール', with: 'test333@example.com'
      fill_in 'パスワード', with: 'password'
      fill_in 'パスワード（確認用）', with: 'password'
      click_button '新規登録'
      expect(page).to have_content 'マイページ'
    end

    it 'ログイン機能' do
      visit new_user_session_path
      fill_in 'Eメール', with: 'test1@example.com'
      fill_in 'パスワード', with: 'password'
      # binding.irb
      click_button 'ログイン'
      expect(page).to have_content 'マイページ'
    end
  end

  describe 'その他機能' do
    it 'お気に入り一覧機能' do
      visit new_user_session_path
      fill_in 'Eメール', with: 'test1@example.com'
      fill_in 'パスワード', with: 'password'
      # binding.irb
      click_on 'commit'
      expect(page).to have_content 'マイページ編集'
      expect(page).to have_content 'お気に入り一覧'
      expect(page).to have_content '試合ルーム一覧へ'
      click_on 'お気に入り一覧'
      expect(page).to have_content 'マイページ編集'
      expect(page).to have_content '試合ルーム一覧へ'
    end

    it 'フォロー一覧機能' do
      visit new_user_session_path
      fill_in 'Eメール', with: 'test1@example.com'
      fill_in 'パスワード', with: 'password'
      # binding.irb
      click_on 'commit'
      click_on 'following'
      expect(page).to have_content 'マイページ編集'
      expect(page).to have_content 'お気に入り一覧'
      expect(page).to have_content '試合ルーム一覧へ'
    end

    it 'ゲストログイン機能' do
      visit new_user_session_path
      # binding.irb
      click_on 'ゲストログイン（閲覧用）'
      expect(page).to have_content 'マイページ編集'
      expect(page).to have_content 'お気に入り一覧'
      expect(page).to have_content '試合ルーム一覧へ'
    end

  end
end 