class ApplicationController < ActionController::Base
  before_action :authenticate_person!, unless: :person_signed_in?

  def current_user
    current_person
  end
end
