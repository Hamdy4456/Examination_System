create proc Applicant_Answers @ExID int, @QuestionID int, @AppAns varchar(5)
as
	begin try
		update Exam_questions
			set App_Answer = @AppAns
		where Exam_Id = @ExID and Q_ID = @QuestionID
	end try
	begin catch
		select 'ERROR: Make Sure You Input The Correct IDs'
	end catch
