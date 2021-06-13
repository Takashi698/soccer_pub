require 'rails_helper'
RSpec.describe '試合ルーム関連機能', type: :system do
  before do
    user = FactoryBot.create(:user)
    @game = FactoryBot.create(:game, user_id: user.id)
    @comment = FactoryBot.create(:comment, user_id: user.id, game_id: @game.id)
    visit new_user_session_path
    click_on 'ゲストログイン（閲覧用）'
  end
  it '試合ルーム作成機能' do
    visit new_user_session_path
    fill_in 'Eメール', with: 'test1@example.com'
    fill_in 'パスワード', with: 'password'
    click_on 'Log in'
    visit games_path
    find('input#q_content_cont').set('third')
    click_on '試合ルームを作成する'
    find('textarea#game_content').set('third')
    click_on '登録する'
    expect(page).to have_content 'third'   
  end
  it '試合ルーム編集機能' do
    visit new_user_session_path
    fill_in 'Eメール', with: 'test1@example.com'
    fill_in 'パスワード', with: 'password'
    click_on 'Log in'
    visit games_path
    click_on 'first'
    click_on '編集'
    find('textarea#game_content').set('forth')
    click_on '更新する'
    expect(page).to have_content 'forth' 
    expect(page).to_not have_content 'first'
  end
  it '試合ルーム削除機能' do
    visit new_user_session_path
    fill_in 'Eメール', with: 'test1@example.com'
    fill_in 'パスワード', with: 'password'
    click_on 'Log in'
    visit games_path
    click_on 'first'
    click_on '削除'
    accept_alert
    expect(page).to_not have_content 'first'
  end
  it '試合ルーム検索機能' do
    visit new_user_session_path
    fill_in 'Eメール', with: 'test1@example.com'
    fill_in 'パスワード', with: 'password'
    click_on 'Log in'
    visit games_path
    find('input#q_content_cont').set('first')
    click_on 'search'
    expect(page).to have_content 'first'
    expect(page).to_not have_content 'second'
  end
  it '試合ルームお気に入り機能' do
    visit new_user_session_path
    fill_in 'Eメール', with: 'test1@example.com'
    fill_in 'パスワード', with: 'password'
    click_on 'Log in'
    visit games_path
    click_on 'first'
    click_on '♡'
    users_favorites_path
    expect(page).to have_content 'first'
  end
  it 'コメント投稿機能' do
    fill_in 'Eメール', with: 'test1@example.com'
    fill_in 'パスワード', with: 'password'
    click_on 'Log in'
    click_on 'test1'
    fill_in 'Content', with: 'comment'
    click_on '登録する'
    expect(page).to have_content 'comment'
  end
  it 'コメント編集機能' do
    visit new_user_session_path
    fill_in 'Eメール', with: 'one@example.com'
    fill_in 'パスワード', with: 'aaaaaa'
    click_on 'Log in'

  end
  it 'コメント削除機能' do
    visit new_user_session_path
    fill_in 'Eメール', with: 'one@example.com'
    fill_in 'パスワード', with: 'aaaaaa'
    click_on 'Log in'
end