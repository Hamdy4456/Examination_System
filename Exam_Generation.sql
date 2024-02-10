create proc Exam_Generation @AppID int, @CrsID int, @MCQ int, @T_F int
as
	begin try
		declare @ExID int
		select @ExID = Cast(Concat(@AppID,@CrsID) as int)
		
		if @crsID in (100,200)
			begin
			insert into Exam (Exam_ID, Exam_Type, Exam_Duration, Exam_FinalGrades, Course_ID, App_ID)
			values (@ExID, 'Acceptance', 1,10, @CrsID, @AppID)
			end
		
		else
			begin
			insert into Exam (Exam_ID, Exam_Type, Exam_Duration, Exam_FinalGrades, Course_ID, App_ID)
			values (@ExID, 'Final', 2,10, @CrsID, @AppID)
			end
		
		insert into Exam_Questions (Q_ID, Exam_ID)
		SELECT TOP(@MCQ) Q_ID, @ExID
		FROM Questions
		WHERE Question_Type = 'MCQ' and Course_ID = @CrsID
		ORDER BY NEWID()

		insert into Exam_Questions (Q_ID, Exam_ID)
		SELECT TOP(@T_F) Q_ID, @ExID
		FROM Questions
		WHERE Question_Type = 'T/F' and Course_ID = @CrsID
		ORDER BY NEWID()
	end try
	begin catch
		select 'ERROR: Make Sure You Input The Correct IDs'
	end catch
