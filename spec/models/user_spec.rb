require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { user.valid? }
    
    let!(:other_user) { create(:user) }
    let(:user) { build(:user) }
    
    context 'nameカラム' do
       it "nameが空白の場合にバリデーションチェックされエラーメッセージが返ってきているか" do
        user.name = ''
        expect(user).to be_invalid
	      expect(user.errors[:name]).to include("を入力してください")
      end
      it "同一のnameが既に存在する場合にバリデーションチェックされエラーメッセージが返ってきているか" do
        user.name = other_user.name
        expect(user).to be_invalid
	      expect(user.errors[:name]).to include("はすでに存在します")
      end
    end
    
    context 'introductionカラム' do
      it "51文字以上の場合にバリデーションチェックされエラーメッセージが返ってきているか" do
        user.introduction = Faker::Lorem.characters(number: 51)
        expect(user).to be_invalid
	      expect(user.errors[:introduction]).to include("は50文字以内で入力してください")
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:posts).macro).to eq :has_many
      end
    end
    
    context 'PostCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end
    
    context 'ViewCountモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:view_counts).macro).to eq :has_many
      end
    end
  end
end