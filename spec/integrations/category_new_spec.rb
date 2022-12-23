require 'rails_helper'

RSpec.feature 'Category index', type: :feature do
  before(:each) do
    visit user_session_path
    @user = User.create!(name: 'Stephen', email: '123@mail.com', password: 'password', password_confirmation: 'password')
    within('#new_user') do
      fill_in 'Email', with: '123@mail.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    @category = @user.categories.create!(name: 'Travel', icon: 'https://pxhere.com/en/photo/1569711', user_id: @user.id)
    visit new_category_path
  end
  it 'display My Categorys on page' do
    expect(page).to have_content('Create a category')
    expect(page).to have_content('Name')
    expect(page).to have_content('Icon')
  end
  it 'display Add New Catgory button on page' do
    expect(page).to have_button 'Save'
  end 
end