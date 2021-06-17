require 'rails_helper'
RSpec.describe '試合ルーム関連機能', type: :system do
  before do
    upshot = FactoryBot.create(:upshot)
    user2 = FactoryBot.create(:user2)
    # upshot2 = FactoryBot.create(:upshot2, user: user2)
    # upshot3 = FactoryBot.create(:upshot3, user: user2)
    # binding.irb
    # # user = FactoryBot.create(:user)
    # # team_a = FactoryBot.create(:team_a)
    # # team_b = FactoryBot.create(:team_b)
    # # game = FactoryBot.create(:game, user: user)
    # # game2 =FactoryBot.create(:game2, user: user)
    # # game3 = FactoryBot.create(:game3, user: user)
    # # binding.irb
    # # upshot = FactoryBot.create(:upshot, game_id: game.id, team_a_id: team_a.id, team_b_id: team_b.id, team_a_point: 3, team_b_point: 2)
    # # binding.irb

    visit new_user_session_path
    fill_in 'Eメール', with: 'test2@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'commit'
  end
  visit games_path
    FactoryBot.create(:game, user: user)
    @comment = FactoryBot.create(:comment, user_id: user.id, game_id: @game.id)
    visit new_user_session_path
    click_on 'ゲストログイン（閲覧用）'
  binding.irb

  it '試合ルーム作成機能' do
    visit games_path
    click_link '試合ルームの新規作成'
    expect(current_path).to have_content '/games/new'
    find("#game_upshot_attributes_team_a_id").find("option[value='1']").select_option
    find("#game_upshot_attributes_team_b_id").find("option[value='2']").select_option
    fill_in 'game[upshot_attributes][team_a_point]',with: ' 2 '
    fill_in 'game[upshot_attributes][team_b_point]',with: ' 3 '
    fill_in 'game[content]', with: '雨で前が見えない'
    find("#game_place").find("option[value='Tokyo']").select_option
    fill_in 'game[match_at]', with: '002020-10-07-03:03:03'
    sleep(0.5)
    binding.irb
    click_button 'ルーム作成'
    expect(page).to have_content 'TeamA'
    expect(page).to have_content 'TeamB'
    expect(page).to have_content 'TeamA'
    expect(page).to have_content 'TeamB'
  end

  it '試合ルーム編集機能' do
    click_link'試合ルーム一覧へ'
    sleep(0.5)
    click_link '編集'
    
    find("#game_upshot_attributes_team_a_id").find("option[value='1']").select_option
    find("#game_upshot_attributes_team_b_id").find("option[value='2']").select_option
    fill_in 'game[upshot_attributes][team_a_point]',with: ' 2 '
    fill_in 'game[upshot_attributes][team_b_point]',with: ' 3 '
    fill_in 'game[content]', with: '霧で前が見えない'
    find("#game_place").find("option[value='Tokyo']").select_option
    # binding.irb
    fill_in 'game[match_at]', with: '002020-10-07-03:03:03'
    sleep(0.5)
    click_button 'ルーム情報の更新'
    expect(page).to have_content 'TeamB'
    expect(page).to have_content 'TeamA'
  end

  it '試合ルーム削除機能' do
    click_link'試合ルーム一覧へ'
    sleep(0.5)
    click_link '削除'
    accept_alert
  end

  it '試合ルーム検索機能' do
    click_link '試合ルーム一覧へ'
    # binding.irb
    click_on '検索'
    expect(page).to have_content 'TeamB'
    expect(page).to have_no_content 'TeamC'
  end

  it '試合ルームお気に入り機能' do
    click_link'試合ルーム一覧へ'
    sleep(0.5)
    click_on '試合ルーム'
    click_on '♡'
    click_on '試合ルーム一覧'
    expect(page).to have_content 'TeamB'
    expect(page).to have_content 'TeamA'
  end

  it 'コメント投稿機能' do
    click_link'試合ルーム一覧へ'
    sleep(0.5)
    click_on '試合ルーム'
    # binding.irb
    fill_in 'Content', with: 'test_comment'
    click_on '登録する'
    expect(page).to have_content 'test_comment'
    click_on '試合ルーム一覧'
    expect(page).to have_content 'TeamB'
    expect(page).to have_content 'TeamA'
  end

  it 'コメント編集機能' do
    click_link'試合ルーム一覧へ'
    sleep(0.5)
    click_on '試合ルーム'
    # binding.irb
    fill_in 'Content', with: 'test_comment'
    click_on '登録する'
    click_on 'コメント編集'
    fill_in 'Content', with: 'test_comment'
    click_on '更新する'
    expect(page).to have_content 'test_comment'
    click_on '試合ルーム一覧'
    expect(page).to have_content 'TeamB'
    expect(page).to have_content 'TeamA'
  end

  it 'コメント削除機能' do
    click_link'試合ルーム一覧へ'
    sleep(0.5)
    click_on '試合ルーム'
    # binding.irb
    fill_in 'Content', with: 'test_comment'
    click_on '登録する'
    click_on 'コメントを削除する'
    expect(page).to have_no_content 'test_comment'
    click_on '試合ルーム一覧'
    expect(page).to have_content 'TeamB'
    expect(page).to have_content 'TeamA'
  end
end