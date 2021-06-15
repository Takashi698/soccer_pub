require 'rails_helper'
RSpec.describe '試合ルーム関連機能', type: :system do
  before do
    # user = FactoryBot.create(:user)
    # binding.irb

    # team_a = FactoryBot.create(:team_a)
    # team_b = FactoryBot.create(:team_b)
    # game = FactoryBot.create(:game, user: user)
    # game2 =FactoryBot.create(:game2, user: user)
    # game3 = FactoryBot.create(:game3, user: user)
    # binding.irb
    upshot = FactoryBot.create(:upshot)
    # upshot = FactoryBot.create(:upshot, game_id: game.id, team_a_id: team_a.id, team_b_id: team_b.id, team_a_point: 3, team_b_point: 2)
    # binding.irb
    visit new_user_session_path
    fill_in 'Eメール', with: 'test1@example.com'
    fill_in 'パスワード', with: 'password'
    click_link 'ログイン'
  end
  # visit games_path
  #   FactoryBot.create(:game, user: user)
  #   @comment = FactoryBot.create(:comment, user_id: user.id, game_id: @game.id)
  #   visit new_user_session_path
  #   click_on 'ゲストログイン（閲覧用）'
  it '試合ルーム作成機能' do
    # binding.irb
    visit games_path
    # click_link '試合ルーム一覧'
    binding.irb
    find('input#q_content_cont').set('?')
    click_link '試合ルームの新規作成'
    find('textarea#game_content').set('?')
    click_on 'ルーム作成'
    expect(page).to have_content '?'
  end
  # it '試合ルーム編集機能' do
  #   visit games_path
  #   click_on 'first'
  #   click_on '編集'
  #   find('textarea#game_content').set('?')
  #   click_on 'ルーム情報の更新'
  #   expect(page).to have_content '?' 
  #   expect(page).to_not have_content '?'
  # end
#   it '試合ルーム削除機能' do
#     visit games_path
#     click_on 'first'
#     click_on '削除'
#     accept_alert
#     expect(page).to_not have_content '?'
#   end
#   it '試合ルーム検索機能' do
#     visit games_path
#     find('input#q_content_cont').set('?')
#     click_on 'search'
#     expect(page).to have_content '?'
#     expect(page).to_not have_content '?'
#   end
#   it '試合ルームお気に入り機能' do
#     visit games_path
#     click_on '?'
#     click_on '♡'
#     users_favorites_path
#     expect(page).to have_content '?'
#   end
#   it 'コメント投稿機能' do
#     # fill_in 'Eメール', with: 'test1@example.com'
#     # fill_in 'パスワード', with: 'password'
#     # click_on 'Log in'
#     click_on 'test1'
#     fill_in 'Content', with: '?'
#     click_on '登録する'
#     expect(page).to have_content '?'
#   end
#   it 'コメント編集機能' do
#   end
#   it 'コメント削除機能' do
#   end
end