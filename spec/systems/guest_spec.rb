require 'rails_helper'
RSpec.describe 'guest_login', type: :system do
  let(:upshot7) { FactoryBot.create(:upshot7) }
  describe 'ゲストログイン機能' do
    context 'ログイン画面のゲストログインボタンから,' do
      it 'ゲストユーザーログインできる' do
        # binding.irb
        visit root_path
        click_on 'ログイン'
        click_link 'ゲストログイン（閲覧用）'
        expect(page).to have_content 'ゲストユーザーとしてログインしました。'
      end
    end
  end
  context 'サインアップ画面のゲストログインボタンから,' do
    it 'ゲストユーザーログインできる' do
      visit root_path
      # binding.irb
      click_on '新規登録'
      click_link 'ゲストログイン（閲覧用）'
      expect(page).to have_content 'ゲストユーザーとしてログインしました。'
    end
  end
end