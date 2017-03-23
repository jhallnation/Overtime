require 'rails_helper'

describe 'navigate' do
  before do
      @user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: 'jon', last_name: 'snow')
      login_as(@user, :scope => :user)
    end

  describe 'index' do 
    before do 
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      post1 = Post.create(date: Date.today, ratinale: "Post1", user_id: @user.id)
      post2 = Post.create(date: Date.today, ratinale: "Post2", user_id: @user.id)
      visit posts_path
      expect(page).to have_content(/Post1|Post2/)
    end
  end

  describe 'creation' do
    before do 
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do 
      fill_in 'post[date]', with: Date.today
      fill_in 'post[ratinale]', with: 'some ratinale'
      click_on 'save'

      expect(page).to have_content('some ratinale')
    end

    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[ratinale]', with: 'User Association'
      click_on 'save'

      expect(User.last.posts.last.ratinale).to eq('User Association')
    end
  end
end