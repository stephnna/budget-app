# require 'rails_helper'

# RSpec.describe Category, type: :model do
#   subject do
#     @user = User.new(name: 'Stephen', email: '123@mail.com', password: 'password')
#     @group = @user.groups.new(name: 'Travel', icon: 'https://pxhere.com/en/photo/1569711', user_id: @user.id)
#   end
#   before { subject.save }

#   it 'Check the name is not blank' do
#     subject.name = nil
#     expect(subject).to_not be_valid
#   end

#   it 'name should be present' do
#     subject.name = @group.name
#     expect(subject).to be_valid
#   end

#   it 'icon should be present' do
#     subject.icon = nil
#     expect(subject).to_not be_valid
#   end

#   it 'should allow valid user_id' do
#     subject.user_id = nil
#     expect(subject).to_not be_valid
#   end
# end