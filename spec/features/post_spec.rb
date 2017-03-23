require 'rails_helper'

describe 'navigate' do
  before do
      @user = FactoryGirl.create(:user)
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
      post1 = FactoryGirl.create(:post)
      post2 = FactoryGirl.create(:second_post)
      visit posts_path
      expect(page).to have_content(/Ratinale|content/)
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