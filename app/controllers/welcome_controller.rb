class WelcomeController < ApplicationController
    def index
        render json: {application_status: "First App Deployed" }
    end
end
