class QuizController < ApplicationController

  @@ary = []

  @@qno_param = []


  def quiz

  end


  def quiz_index
    if !session[:current_user].nil?
    @admin_log = User.find(session[:current_user])
    @logged_user = User.find(session[:current_user])
    end

  end



  def question

    if params[:id] != nil

      @@ary.insert(0, params[:id])

    end

    @ids = @@ary[0]

    p "============================================"

    p "params id"

    p params[:id] != nil

    p @ids

    p @@ary

    #  p params[:id]

    @ans = Quest.where(assesments_id: @@ary[0])

    p "ans_id"

    p @ans



    # question no calculation

    @question_no = Quest.where(assesments_id: @ids)

    @questions = []

    @question_no.all.map do |quest|

      @questions.push(quest.id)

    end

    p "============================================"

    p "question arr"

    p @questions

    @questions



    # find question no

    @temp_qno = Quest.find_by(params[:qno])

    @temp_id = Quest.find_by(assesments_id: @ids)



   if @ids != nil

      if @temp_qno.present?
        @@qno_param.insert(0, params[:qno])
      elsif @temp_id != nil
        @@qno_param.insert(0, @temp_id.id)
      end

   elsif params[:qno] != nil
         if @temp_qno.nil?
            @@qno_param.insert(0, params[:qno])
         else
            @@qno_param.insert(0, @temp_id.id)
         end
    end
    @q_id = @@qno_param[0]
  end


  def create_quiz
    @admin_log = User.find(session[:current_user])

    @assesment = Assesment.new(params.require(:assesment).permit(:title, :user_id))
    @assesment[:status] = false
       if @assesment.save
            render "quiz_index"
       end

  end



  def delete_quiz

    @delete_quiz = Assesment.find_by(id: params[:delquiz_id])
    if @delete_quiz.destroy
      redirect_to "/quiz/home"
    end

  end



  def delete_quest
    @del_id = Quest.find(params[:del_id])
    Answer.find_by(quests_id: @del_id).destroy
    if @del_id.destroy
      @@qno_param = []

      redirect_to "/quiz/question"

    end



    p "========================================================="

    p params[:del_id]

  end



  def create_quest

    @quest = Quest.new(params.require(:quest).permit(:question, :answer, :choice1, :choice2, :choice3, :user_id, :assesments_id))

    if @quest.save

      @ids = @@ary[0]

      redirect_to "/quiz/question"

    end

  end

end
