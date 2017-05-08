module ControllerHelpers
    def login_account
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:account]
      @user = Factory.create(:user)
      sign_in(:user)
    end
  end
end