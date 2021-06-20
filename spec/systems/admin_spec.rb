require 'rails_helper'
RSpec.describe 'Admin', type: :system do

  user9 = FactoryBot.create(:user9)
  user8 = FactoryBot.create(:user8)
  
  describe '管理者機能' do
    context '管理者の場合,' do
      it '管理者ページにアクセスできる' do
        # binding.irb
        visit root_path
        click_on 'ログイン'
        fill_in 'Eメール', with: 'test9@example.com'
        fill_in 'パスワード', with: 'password'
        sleep(0.5)
        click_on 'commit'
        expect(page).to have_content 'マイページ編集'
        expect(page).to have_content 'お気に入り一覧'
        expect(page).to have_content '試合ルーム一覧へ'
        expect(page).to have_content 'ログインしました。'
        expect(page).to have_content '管理者画面'
        click_on '管理者画面'
        expect(current_path).to eq rails_admin_path
      end
    end
    context '管理者でない場合,' do
      it '管理者ページにはアクセスできない' do
        visit root_path
        click_on 'ログイン'
        fill_in 'Eメール', with: 'test8@example.com'
        fill_in 'パスワード', with: 'password'
        click_on 'commit'
        expect(page).to have_content 'マイページ編集'
        expect(page).to have_content 'お気に入り一覧'
        expect(page).to have_content '試合ルーム一覧へ'
        expect(page).to have_content 'ログインしました。'
        expect(page).not_to have_content '管理者画面'
      end
    end
  end
end