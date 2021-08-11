package edu.kh.job.report.exception;

public class InsertFileException extends RuntimeException{
	
	public InsertFileException() {
		super("파일정보를 삽입하는 과정에서 문제발생");
	}

}
