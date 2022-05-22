package vo;

public class OrderVo {
	private Long no;
	private String orderNumber;
	private Long pay;
	private String address;
	private Long memberNo;
	private String memberName;
	private String memberEmail;
	private Long bookNo;
	private Long count;
	private String bookTitle;
	private Long totalPay;
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	public Long getPay() {
		return pay;
	}
	public void setPay(Long pay) {
		this.pay = pay;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Long getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(Long memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public Long getBookNo() {
		return bookNo;
	}
	public void setBookNo(Long bookNo) {
		this.bookNo = bookNo;
	}
	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	public Long getTotalPay() {
		return totalPay;
	}
	public void setTotalPay(Long totalPay) {
		this.totalPay = totalPay;
	}
	@Override
	public String toString() {
		return "주문번호 : " + orderNumber + "\n이름 : " + memberName + "(" + memberEmail + ")\n금액 : " + pay + "\n주소 : " + address;
	}
		
	public String toStringByBook() {
		return "책 번호 : " + bookNo + ", 책 제목 : " + bookTitle + ", 수량 : " + count +  "권, 비용 : " + totalPay;
	}
	
}