require 'rails_helper'

RSpec.describe Micropost, type: :model do
  # FactoryBotでユーザー情報を@userに登録
  # 紐付いているユーザーを通してマイクロポストの情報を@micropostに登録
  before do
    @user = FactoryBot.create(:user)
    @micropost = @user.microposts.create(content: 'example')
  end

  context 'when micropost is valid' do
    it 'contentとuser_idに値が入っている場合、有効な状態である' do
      expect(@micropost).to be_valid
    end

    it 'userを削除すると、userが書いたmicropostも削除される' do
      expect { @user.destroy }.to change(Micropost, :count).by(-1)
    end

    it '登録されていないUser_idを選択しmicropostを投稿した場合、無効な状態である' do
      invalid_micropost = FactoryBot.build(:invalid_micropost)
      expect(invalid_micropost.save).to be_falsey
    end

    it 'contentが空白の場合、無効な状態である' do
      # FactoryBotに登録したマイクロポスト情報のcontentを空白に変更
      @micropost.content = ' '
      expect(@micropost).to be_invalid
    end

    it 'user_idが空白の場合、無効な状態である' do
      # FactoryBotに登録したマイクロポスト情報のuser_idを空白に変更
      @micropost.user_id = ' '
      expect(@micropost).to be_invalid
    end

    it 'contentが141文字以上の場合、無効な状態である' do
      # FactoryBotに登録したマイクロポスト情報のcontentに141文字分のaを代入
      @micropost.content = 'a' * 141
      expect(@micropost).to be_invalid
    end
  end
end
