package com.kh.dplate.reservationtime.model.vo;

public class ReservationTime {
	
		private int timeNo; //		    TIME_NO NUMBER PRIMARY KEY,
		private int resNo;//		    RES_NO NUMBER REFERENCES RESTAURANT(RES_NO) NOT NULL,
		private String reVisitdate; //		    RE_VISITDATE VARCHAR2(15) NOT NULL,
		private String reTime; //		    RE_TIME VARCHAR2(15) NOT NULL,
		private int rePeople; //		    RE_PEOPLE NUMBER NOT NULL
		
		
		public ReservationTime() {
			super();
		}


		public ReservationTime(int timeNo, int resNo, String reVisitdate, String reTime, int rePeople) {
			super();
			this.timeNo = timeNo;
			this.resNo = resNo;
			this.reVisitdate = reVisitdate;
			this.reTime = reTime;
			this.rePeople = rePeople;
		}


		public int getTimeNo() {
			return timeNo;
		}


		public void setTimeNo(int timeNo) {
			this.timeNo = timeNo;
		}


		public int getResNo() {
			return resNo;
		}


		public void setResNo(int resNo) {
			this.resNo = resNo;
		}


		public String getReVisitdate() {
			return reVisitdate;
		}


		public void setReVisitdate(String reVisitdate) {
			this.reVisitdate = reVisitdate;
		}


		public String getReTime() {
			return reTime;
		}


		public void setReTime(String reTime) {
			this.reTime = reTime;
		}


		public int getRePeople() {
			return rePeople;
		}


		public void setRePeople(int rePeople) {
			this.rePeople = rePeople;
		}


		@Override
		public String toString() {
			return "ReservationTime [timeNo=" + timeNo + ", resNo=" + resNo + ", reVisitdate=" + reVisitdate
					+ ", reTime=" + reTime + ", rePeople=" + rePeople + "]";
		}
		
		
		
		


}
