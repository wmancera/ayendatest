class ErrorController < ApplicationController
 def show
      render json: "{data:error}"
  end
end