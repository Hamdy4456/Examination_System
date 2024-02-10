create proc Exam_Correction @ExID int
as
	begin try
		declare @grades int
		select @grades = count(*)
		from Questions inner join Exam_Questions
		on Questions.Q_ID = Exam_Questions.Q_ID
		where Exam_ID = @ExID
		and App_Answer = Answer

		update Exam
			set Exam_Grades = @grades
		where Exam_ID = @ExID
		end try
	begin catch
		select 'ERROR: Make Sure You Input The Correct Exam ID'
	end catch
