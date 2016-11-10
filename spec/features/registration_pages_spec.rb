require 'rails_helper'

RSpec.feature "RegistrationPages", type: :feature do
  context 'Successfully Registering as a user' do
    Steps 'to Successfully register' do
      Given 'I am on the landing page' do
        visit '/'
      end

      And 'I can see a registration form' do
        expect(page).to have_content("Please register")
      end

      Then "I can fill out the registration form" do
        fill_in 'full_name', with: 'BuBu'
        fill_in 'street_address', with: '1 CheeChi Way'
        fill_in 'city', with: 'BangBang'
        fill_in 'state', with: 'TT'
        fill_in 'postal_code', with: '0000'
        fill_in 'country', with: 'Women Rule'
        fill_in 'phone1', with: '123'
        fill_in 'phone2', with: '456'
        fill_in 'phone3', with: '789'
        fill_in 'email_address', with: 'women@ruleTheWorld.com'
        fill_in 'user_id', with: 'BuBu4U'
        fill_in 'password', with: 'women'
      end

      And "I can register" do
        click_button 'Register'
      end
      Then "I am taken to a confirmation page" do
        expect(page).to have_content("Registration successful")
      end

    end #end of Steps
  end #end of context

  context 'unsuccessfully registering as a user' do
    Steps 'to unsuccessfully register' do
      Given 'I am on the landing page' do
        visit '/'
      end

      And 'I can see a registration form' do
        expect(page).to have_content("Please register")
      end

      Then "I can fill out the registration form wihout user ID or password" do
        fill_in 'full_name', with: 'BuBu'
        fill_in 'street_address', with: '1 CheeChi Way'
        fill_in 'city', with: 'BangBang'
        fill_in 'state', with: 'TT'
        fill_in 'postal_code', with: '0000'
        fill_in 'country', with: 'Women Rule'
        fill_in 'phone1', with: '123'
        fill_in 'phone2', with: '456'
        fill_in 'phone3', with: '789'
        fill_in 'email_address', with: 'women@ruleTheWorld.com'
      end

      And "I cannot register" do
        click_button 'Register'
        expect(page).to have_content("Please register!")
        end
      end
  end

end
