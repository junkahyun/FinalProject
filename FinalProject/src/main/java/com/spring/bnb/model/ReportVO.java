package com.spring.bnb.model;

public class ReportVO {
	
	private int report_idx;
	private String fk_userid;
	private String reporttype;
	private String report_content;
	private String report_date;
	private int report_status;
	private String report_subject;
	private int rno;
	private int view_cnt;
	

	public ReportVO() {}
	
	public ReportVO(int report_idx, String fk_userid, String reporttype, String report_content, String report_date,
			int report_status, String report_subject, int rno, int view_cnt) {
		super();
		this.report_idx = report_idx;
		this.fk_userid = fk_userid;
		this.reporttype = reporttype;
		this.report_content = report_content;
		this.report_date = report_date;
		this.report_status = report_status;
		this.report_subject = report_subject;
		this.rno = rno;
		this.view_cnt = view_cnt;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getReport_idx() {
		return report_idx;
	}

	public void setReport_idx(int report_idx) {
		this.report_idx = report_idx;
	}

	public String getFk_userid() {
		return fk_userid;
	}

	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}

	public String getReporttype() {
		return reporttype;
	}

	public void setReporttype(String reporttype) {
		this.reporttype = reporttype;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public String getReport_date() {
		return report_date;
	}

	public void setReport_date(String report_date) {
		this.report_date = report_date;
	}

	public int getReport_status() {
		return report_status;
	}

	public void setReport_status(int report_status) {
		this.report_status = report_status;
	}

	public String getReport_subject() {
		return report_subject;
	}

	public void setReport_subject(String report_subject) {
		this.report_subject = report_subject;
	}

	public int getView_cnt() {
		return view_cnt;
	}

	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}

	
}
