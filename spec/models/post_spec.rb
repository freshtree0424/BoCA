require 'rails_helper'

RSpec.describe Post, "Postモデルのテスト", type: :model do
  describe 'バリデーションのテスト' do
    subject { post.valid? }

    let(:user) { create(:user) }
    let!(:post) { build(:post, user_id: user.id) }

    context 'titleカラム' do
      it "titleが空白の場合にバリデーションチェックされエラーメッセージが返ってきているか" do
	      post = Post.new(title: '', body: 'hoge')
	      expect(post).to be_invalid
	      expect(post.errors[:title]).to include("を入力してください")
	    end
    end

    context 'bodyカラム' do
	    it "bodyが空白の場合にバリデーションチェックされエラーメッセージが返ってきているか" do
	      post = Post.new(title: 'hoge', body: '')
	      expect(post).to be_invalid
	      expect(post.errors[:body]).to include("を入力してください")
	    end
      it "201文字以上の場合にバリデーションチェックされエラーメッセージが返ってきているか" do
        post = Post.new
        post.body = Faker::Lorem.characters(number: 201)
        expect(post).to be_invalid
	      expect(post.errors[:body]).to include("は200文字以内で入力してください")
      end
    end

    context 'starカラム' do
    	 it "starが未選択の場合にバリデーションチェックされエラーメッセージが返ってきているか" do
	      post = Post.new(star: '')
	      expect(post).to be_invalid
	      expect(post.errors[:star]).to include("を入力してください")
	    end
	  end
	end

	describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'PostCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end

    context 'ViewCountモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:view_counts).macro).to eq :has_many
      end
    end

    context 'TagRelationshipモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:tag_relationships).macro).to eq :has_many
      end
    end

    context 'Tagモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:tags).macro).to eq :has_many
      end
    end
  end
end