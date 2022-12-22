require 'rails_helper'

RSpec.describe Payment, type: :model do
  subject do
    @user = User.new(name: 'Rich', email: '123@mail.com', password: 'password')
    @category = @user.categories.new(name: 'Travel', icon: 'https://pxhere.com/en/photo/1569711', user_id: @user.id)
    @payment = Payment.new(name: 'Savings', amount: 1000, user_id: @user.id, category_id: @category_id)
  end
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be numeric value' do
    expect(subject.amount).to be_kind_of Numeric
  end

  it 'amount should be present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be is greater than 0' do
    subject.amount = -1
    expect(subject).to_not be_valid
  end

  it 'Should be associated to a category' do
    expect(subject).to respond_to(:category_id)
  end
end
