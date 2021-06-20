require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = create(:user5)
  end
  describe 'ユーザーバリデーションテスト' do

    it '全て規定の記述済みの場合OK' do
      # expect(@user.valid?).to eq(true)
      expect(@user).to be_valid
    end

    it 'ユーザー名が空の場合NG' do
      @user.name = ''
      expect(@user.valid?).to eq(false)
    end

    it 'メールアドレスが空の場合NG' do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end

    it 'メールアドレスが規定外の場合NG' do
      @user.email =  'gmail.com@'
      expect(@user.valid?).to eq(false)
    end

    it 'パスワードが６文字以下の場合NG' do
      @user.password =  '12345'
      # expect(@user.valid?).to eq(false)
      @user.valid?
      expect(@user.errors[:password]).to include('は6文字以上で入力してください')
    end
  end
end
