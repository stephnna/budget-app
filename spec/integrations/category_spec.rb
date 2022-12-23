require 'rails_helper'

RSpec.feature 'Category index', type: :feature do
  before(:each) do
    visit user_session_path
    @user = User.create!(name: 'Stepehn', email: '123@mail.com', password: 'password', password_confirmation: 'password')
    within('#new_user') do
      fill_in 'Email', with: '123@mail.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    @category = @user.categories.create!(name: 'Travel', icon: 'https://pxhere.com/en/photo/1569711', user_id: @user.id)
    visit categories_path
  end

  it 'expect page path to be the category path' do
    expect(page).to have_current_path categories_path
  end

  it 'show Categories heading' do
    expect(page).to have_content 'Categories'
  end

  it 'display Add New Category button on page' do
    expect(page).to have_link 'Add a category'
  end

  it 'When I click on category name, I am redirected to the entity of that specific category.' do
    click_link 'Travel'
    expect(page).to have_current_path category_payments_path(@category.id)
  end

  it 'When I click on Add category, I am redirected to that Group\'s new page.' do
    click_link('Add a category')
    expect(page).to have_current_path new_category_path
  end
end