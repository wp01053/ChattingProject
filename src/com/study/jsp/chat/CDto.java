package com.study.jsp.chat;

public class CDto {
	String CNUM;

	String RNAME;
	String M_COUNT;
	String BID;
	String R1;

	String PASSWORD;

	public String getCNUM() {
		return CNUM;
	}

	public void setCNUM(String cNUM) {
		CNUM = cNUM;
	}

	public CDto(String CNUM, String RNAME, String M_COUNT, String BID, String R1, String PASSWORD) {
		this.CNUM = CNUM;
		this.RNAME = RNAME;
		this.M_COUNT = M_COUNT;
		this.BID = BID;
		this.R1 = R1;

		this.PASSWORD = PASSWORD;

	}

	public String getRNAME() {
		return RNAME;
	}

	public void setRNAME(String rNAME) {
		RNAME = rNAME;
	}

	public String getM_COUNT() {
		return M_COUNT;
	}

	public void setM_COUNT(String m_COUNT) {
		M_COUNT = m_COUNT;
	}

	public String getR1() {
		return R1;
	}

	public void setR1(String r1) {
		R1 = r1;
	}

	public String getBID() {
		return BID;
	}

	public void setBID(String bID) {
		BID = bID;
	}

	public String getPASSWORD() {
		return PASSWORD;
	}

	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}

}
