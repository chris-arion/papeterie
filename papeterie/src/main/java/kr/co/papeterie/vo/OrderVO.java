package kr.co.papeterie.vo;

public class OrderVO {
	private int idx;		// 인덱스
	private String userid;	// 아이디
	private String pcode;	// 상품코드
	private int count;		// 주문 수량
	private int price;		// 주문 금액
	private int addr_id;	// 배송지 인덱스
	private int pay_type;	// 결재수단 : 0 - 계좌이체, 1 - 신용카드, 2 - 간편결재
	private int bank;		// 계좌이체 시 선택한 은행
	private int card;		// 신용카드 선택 시 카드 종류 
	private int halbu;		// 신용카드 할부 개월수
	private int com;		// 간편결재 시 통신사
	private String phone;	// 간편결재 전화번호
	private int state;		// 주문 상태 : 0 - 주문 완료, 1 - 결재완료, 2 - 입금대기, 3 - 입금확인, 4 - 상품준비중, 5 - 배송중, 6 - 배송완료
	private String regdate;	// 주문일자
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAddr_id() {
		return addr_id;
	}
	public void setAddr_id(int addr_id) {
		this.addr_id = addr_id;
	}
	public int getPay_type() {
		return pay_type;
	}
	public void setPay_type(int pay_type) {
		this.pay_type = pay_type;
	}
	public int getBank() {
		return bank;
	}
	public void setBank(int bank) {
		this.bank = bank;
	}
	public int getCard() {
		return card;
	}
	public void setCard(int card) {
		this.card = card;
	}
	public int getHalbu() {
		return halbu;
	}
	public void setHalbu(int halbu) {
		this.halbu = halbu;
	}
	public int getCom() {
		return com;
	}
	public void setCom(int com) {
		this.com = com;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
}
