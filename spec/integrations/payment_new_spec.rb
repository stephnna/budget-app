require 'rails_helper'

RSpec.feature 'Group index', type: :feature do
  before(:each) do
    visit new_user_session_path

    @user = User.create(name: 'Stephen', email: '123@mail.com', password: 'password')
    @category = Category.create(name: 'Travel', icon: 'https://pxhere.com/en/photo/1569711', user_id: @user.id)
    @payment = Payment.create(name: 'Paris', amount: 1000.0, user_id: @user.id, category_id: @category.id)
    fill_in 'Email', with: '123@mail.com'
    fill_in 'Password', with: 'password'

    click_button 'Log in'
    visit new_category_payment_path(@category.id)
  end
  it 'display My Expense on the page' do
    expect(page).to have_content('Name')
    expect(page).to have_content('Amount')
  end
  it 'display Add New expense button on page' do
    expect(page).to have_button 'Save'
  end
end
