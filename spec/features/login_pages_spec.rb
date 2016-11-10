require 'rails_helper'

RSpec.feature "LoginPages", type: :feature do
  context "Logging In" do
   Steps "to successfully log in" do
     Given 'I am on the landing page' do
       visit '/'
     end

     Then "I am a registered user" do
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
        click_button 'Register'
      end

      And "I can log in with my user id and password" do
        visit "/"
        fill_in 'login_user_id', with: 'BuBu4U'
        fill_in 'login_password', with: 'women'
        click_button 'Log In'
      end

      And "I can see a successful login page" do
        expect(page).to have_content("Welcome back BuBu4U")
        expect(page).to have_content('1 CheeChi Way')
        expect(page).to have_content('BangBang')
        expect(page).to have_content('TT')
        expect(page).to have_content('Women Rule')
        expect(page).to have_content('Phone: 123')
        expect(page).to have_content('Phone: 456')
        expect(page).to have_content('Phone: 789')
      end
    end #steps

  end #context

  context "Logging in unsuccessfully" do
    Steps "to unsuccessfully log in" do
      Given 'I am on the landing page' do
        visit '/'
      end

      Then "I am a registered user" do
         fill_in 'full_name', with: 'BuBu'
         fill_in 'street_address', with: '1 CheeChi Way'
         fill_in 'city', with: 'BangBang'
         fill_in 'state', with: 'TT'
         fill_in 'postal_code', with: '0000'
         fill_in 'country', with: 'Women Rule'
         fill_in 'email_address', with: 'women@ruleTheWorld.com'
         fill_in 'user_id', with: 'BuBu4U'
         fill_in 'password', with: 'women'
         click_button 'Register'
       end

       And "I can log in with the wrong user id and password" do
         visit "/"
         fill_in 'login_user_id', with: 'BuU'
         fill_in 'login_password', with: 'stinkyButt'
         click_button 'Log In'
       end

       And "I see an unsuccessful login message" do
         expect(page).to have_content("Log in failed, try again")
       end

     end #end of Steps
  end #end of context

end #feature
