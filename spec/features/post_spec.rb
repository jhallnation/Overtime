require 'rails_helper'

describe 'navigate' do
  describe 'index' do 
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
  end

  describe 'creation' do
    before do 
      user = User.create(email: "tester@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: 'jon', last_name: 'snow')
      login_as(user, :scope => :user)
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