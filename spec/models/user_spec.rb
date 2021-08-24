require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should not be created without password and password_confirmation fields' do 
      @user = User.new(first_name:'Dave',  last_name: 'Onaolapo', email: 'talk2@yahoo.com')
      expect(@user).to_not be_valid
    end 

    it 'should not be created without password and password_confirmation fields' do 
      @user = User.new(first_name:'Dave', last_name: 'Onaolapo', email: 'talk2@yahoo.com', password:'asded', password_confirmation:'asdef')
      expect(@user).to_not be_valid
    end 

    it 'should not accept a duplicate email' do 
      @user = User.create(first_name:'Dave', last_name: 'Onaolapo', email: 'tal2@yahoo.com', password:'asded', password_confirmation:'asded')
      @new_user = User.new(first_name:'Dave', last_name: 'Onaolapo', email: 'TAL2@YAHOO.COM', password:'asded', password_confirmation:'asded')
      expect(@new_user).to_not be_valid
    end 

    it 'should not be created without a first name, last name and email' do 
      @new_user = User.new( password:'asded', password_confirmation:'asdef')
      expect(@new_user).to_not be_valid
    end 

    it 'should not be created if the password is less than 7 characters' do 
      @user = User.new(first_name:'Dave', last_name: 'Onaolapo', email: 'talk2@yahoo.com', password:'as', password_confirmation:'as')
      expect(@user).to_not be_valid
    end 

    it 'should be created if the password is 7 characters or more' do 
      @user = User.new(first_name:'Dave', last_name: 'Onaolapo', email: 'talk2@yahoo.com', password:'asdfrer', password_confirmation:'asdfrer')
      expect(@user).to be_valid
    end 
  end  
  
  describe 'authenticate_with_credentials' do
    it 'authenticates a legitimate user' do
      @user = User.create(first_name:'Dav', last_name: 'Onaolapo', email: 'tl2@yahoo.com', password:'asdejjjd', password_confirmation:'asdejjjd')
      expect(User.authenticate_with_credentials('tl2@yahoo.com', 'asdejjjd')).to be_kind_of(User)
    end

    it 'authenticates with spacing around the email' do
      @user = User.create(first_name:'Da', last_name: 'Onaolapo', email: 'tl2e@yahoo.com', password:'asdejjjd', password_confirmation:'asdejjjd')
      expect(User.authenticate_with_credentials(' tl2e@yahoo.com ', 'asdejjjd')).to be_kind_of(User)
    end

    it 'authenticates with different title cases for email' do
      @user = User.create(first_name:'Dayy', last_name: 'Onaolapo', email: 'tle@yahoo.com', password:'asdejjjd', password_confirmation:'asdejjjd')
      expect(User.authenticate_with_credentials(' tle@yaHoo.coM ', 'asdejjjd')).to be_kind_of(User)
    end

  end
end
