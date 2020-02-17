package com.koreigner.common.address;

public class Korea_Address_VO {
	private String do_kor;	
	private String do_en;	
	private String gu_gun_eup_kor;	
	private String gu_gun_eup_eng;	
	private String si_gu_gun_eup_eng;
	
	
	public Korea_Address_VO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public Korea_Address_VO(String do_kor, String do_en, String gu_gun_eup_kor,
			String gu_gun_eup_eng, String si_gu_gun_eup_eng) {
		super();
		
		this.do_kor = do_kor;
		this.do_en = do_en;
		this.gu_gun_eup_kor = gu_gun_eup_kor;
		this.gu_gun_eup_eng = gu_gun_eup_eng;
		this.si_gu_gun_eup_eng = si_gu_gun_eup_eng;
	}
	
	public String getDo_kor() {
		return do_kor;
	}
	public void setDo_kor(String do_kor) {
		this.do_kor = do_kor;
	}
	public String getDo_en() {
		return do_en;
	}
	public void setDo_en(String do_en) {
		this.do_en = do_en;
	}
	public String getGu_gun_eup_kor() {
		return gu_gun_eup_kor;
	}
	public void setGu_gun_eup_kor(String gu_gun_eup_kor) {
		this.gu_gun_eup_kor = gu_gun_eup_kor;
	}
	public String getGu_gun_eup_eng() {
		return gu_gun_eup_eng;
	}
	public void setGu_gun_eup_eng(String gu_gun_eup_eng) {
		this.gu_gun_eup_eng = gu_gun_eup_eng;
	}
	public String getSi_gu_gun_eup_eng() {
		return si_gu_gun_eup_eng;
	}
	public void setSi_gu_gun_eup_eng(String si_gu_gun_eup_eng) {
		this.si_gu_gun_eup_eng = si_gu_gun_eup_eng;
	}
	@Override
	public String toString() {
		return "TestVO [do_kor=" + do_kor + ", do_en=" + do_en
				+ ", gu_gun_eup_kor=" + gu_gun_eup_kor + ", gu_gun_eup_eng=" + gu_gun_eup_eng + ", si_gu_gun_eup_eng="
				+ si_gu_gun_eup_eng + "]";
	}	

	

	
}













