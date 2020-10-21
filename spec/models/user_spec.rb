require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録がうまく行く時' do
      it "全てのカラムが入力されていれば、ユーザー登録することができる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it "nicknameが空だと、ユーザー登録ができない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
  
      it "emailが空だと、ユーザー登録ができない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
  
      it "emailが既に登録されていると、ユーザー登録ができない" do
        @user.save
        other_user = FactoryBot.build(:user)
        other_user.email = @user.email
        other_user.valid?
        expect(other_user.errors.full_messages).to include("Email has already been taken")
      end
  
      it "emailは＠が含まれていないと、ユーザー登録ができない" do
        @user.email = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
  
      it "passwordが空だと、ユーザー登録ができない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
  
      it "passwordは6文字以上でないと、ユーザー登録ができない" do
        password = "ab123"
        @user.password = password
        @user.password_confirmation = password 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
  
      it "passwordは半角英数混合でないと、ユーザー登録ができない" do
        password = "aaaaaaa"
        @user.password = password
        @user.password_confirmation = password 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
  
      it "password_confirmationが空だと、ユーザー登録ができない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
  
      it "passwordとpassword_confrimationが異なると、ユーザー登録ができない" do
        @user.password_confirmation = "abcd1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
  
      it "family_nameが空だと、ユーザー登録ができない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
  
      it "family_nameが半角だと、ユーザー登録ができない" do
        @user.family_name = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
  
      it "first_nameが空だと、ユーザー登録ができない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
  
      it "first_nameが半角だと、ユーザー登録ができない" do
        @user.first_name = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
  
      it "kana_family_nameが空だと、ユーザー登録ができない" do
        @user.kana_family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family name can't be blank")
      end
  
      it "kana_family_nameはカタカナでないと、ユーザー登録ができない" do
        @user.kana_family_name = "てすと"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family name is invalid")
      end
  
      it "kana_first_nameが空だと、ユーザー登録ができない" do
        @user.kana_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
  
      it "kana_first_nameはカタカナでないと、ユーザー登録ができない" do
        @user.kana_first_name = "てすと"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name is invalid")
      end
  
      it "birthdayが空だと、ユーザー登録ができない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
