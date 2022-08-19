class AnswerController < ApplicationController
    def index
        @id = Quest.where(assesments_id: params[:id])
 
    end
end
