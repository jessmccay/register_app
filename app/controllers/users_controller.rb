class UsersController < ApplicationController
  def index
    render :register
  end

  def register

    if params[:user_id].nil? || params[:user_id].strip.empty? || params[:password].nil? || params[:password].nil?

      redirect_to "/"

    else

      @user = User.new
      @user.user_id = params[:user_id]
      @user.password = params[:password]
      @user.full_name = params[:full_name]
      @user.street_address = params[:street_address]
      @user.city = params[:city]
      @user. state = params[:state]
      @user.country = params[:country]
      @user.postal_code = params[:postal_code]
      @user.email_address = params[:email_address]
      @user.save


    if !params[:phone1].nil? && !params[:phone1].strip.empty?
      phone1 = Phone.new
      phone1.number = params[:phone1]
      phone1.user = @user
      phone1.save
    end

    if !params[:phone2].nil? && !params[:phone2].strip.empty?
      phone2 = Phone.new
      phone2.number = params[:phone2]
      phone2.user = @user
      phone2.save
    end

    if !params[:phone3].nil? && !params[:phone3].strip.empty?
      phone3 = Phone.new
      phone3.number = params[:phone3]
      phone3.user = @user
      phone3.save
    end

    render :confirmation
    end
  end

  def login

    #checks if the fields are left blank
    if params[:login_user_id].nil? || params[:login_user_id].strip.empty? || params[:login_password].nil? || params[:login_password].nil?

      #displays register page
      flash[:notice] = "Log in failed, try again"
      redirect_to "/"

    end

    #checks if user exists in the database
    if !User.find_by_user_id(params[:login_user_id]).nil?
      #loads user into variable
      @user1 = User.find_by_user_id(params[:login_user_id])

      #checks if login password matches the password from the user object in the db
      if params[:login_password] == @user1.password
        render :login
      else
        #displays register page
        flash[:notice] = "Log in failed, try again"
        redirect_to '/'
      end

      #if user doesnt exist
    else
      #displays register page
      flash[:notice] = "Log in failed, try again"
      redirect_to '/'
    end


 end # end of login method

end #end of controller class
