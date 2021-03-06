require 'rails_helper'

RSpec.describe User, type: :model do
  # FactoryBotでユーザー情報を@userに登録
  before do
    @user = FactoryBot.build(:user)
  end

  context 'when user is valid' do
    it 'nameとemailに値が入っている場合、有効な状態である' do
      expect(@user).to be_valid
    end

    it 'Nameが空白の場合、無効な状態である' do
      # FactoryBotに登録したユーザー情報のnameを空白に変更
      @user.name = ' '
      expect(@user).to be_invalid
    end

    it 'emailが空白の場合、無効な状態である' do
      # FactoryBotに登録したユーザー情報のemailを空白に変更
      @user.email = ' '
      expect(@user).to be_invalid
    end
  end

  context 'when email format is invalid' do
    it 'emailのvalidateが正しく機能しているか' do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.foo@bar_baz.com foo@bar+baz.com foo@bar..com]
      addresses.each do |invalid_address|
        expect(FactoryBot.build(:user, email: invalid_address)).to be_invalid
      end
    end
  end

  context 'when email addresses should be unique' do
    it '一意性が正しく機能しているか' do
      # @userを複製してduplicate_userに格納
      duplicate_user = @user.dup
      duplicate_user.email = @user.email.upcase
      @user.save!
      expect(duplicate_user).to be_invalid
    end
  end

  it 'emailを小文字に変換後の値と大文字を混ぜて登録されたアドレスが同じか' do
    @user.email = 'Foo@ExAMPle.CoM'
    @user.save!

    # 全て小文字のemailと等しいかのテスト
    expect(@user.reload.email).to eq 'foo@example.com'
  end
end
