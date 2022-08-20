class AnswerController < ApplicationController
    def index
        @quest = Quest.where(assesments_id: params[:id])

    end
    def create
    #    @answer = Answer.new(params.require(:answer).permit(:users_id, :quests_id,:assesments_id,:answer))
    #    @quests_id = @answer[:quests_id]
    id = params[:id]
    users_id = params[:users_id]
    quests_id = params[:quests_id]
    assesments_id = params[:assesments_id]
    answer = params[:answer]
    @answer = Answer.create!(
        users_id: users_id,
        quests_id: quests_id,
        assesments_id: assesments_id ,
        answer: answer
    )

       if @answer.save
           @id = Quest.where('id > ? AND assesments_id = ?', quests_id,assesments_id)
           redirect_to "/answer/home/#{assesments_id.to_i}"
       end
    end
end
