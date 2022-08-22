class AnswerController < ApplicationController
    @@ary = []
    def index
        @quest = Quest.where(assesments_id: params[:id])
        @@ary.insert(0 , params[:id])
        @q_id = @@ary[0]
        
    #     @user_exists = Answer.where(assesments_id: params[:id] , users_id: session[:current_user])
    #     p "--------"
    #     p  @user_exists.present?
    #    if @user_exists.present?
    #         @user_exists.destroy
    #     end

    end
    def create
    #    @answer = Answer.new(params.require(:answer).permit(:users_id, :quests_id,:assesments_id,:answer))
    #    @quests_id = @answer[:quests_id]
    id = params[:id]
    users_id = params[:users_id]
    quests_id = params[:quests_id]
    assesments_id = params[:assesments_id]
    answer = params[:answer]
    result = params[:ans].eql?(answer)
    @answer = Answer.create!(
        users_id: users_id,
        quests_id: quests_id,
        assesments_id: assesments_id ,
        answer: answer,
        result: result
    )

       if @answer.save
           @id = Quest.where('id > ? AND assesments_id = ?', quests_id,assesments_id)
           redirect_to "/answer/home/#{assesments_id.to_i}"
       end
    end

    def results

   end
end
