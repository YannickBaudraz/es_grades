class ApplicationController < ActionController::Base
  before_action :authenticate_person!, unless: :person_signed_in?
end
