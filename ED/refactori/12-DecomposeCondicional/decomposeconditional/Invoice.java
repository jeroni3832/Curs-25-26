package xxx.refactorings.decomposeconditional;


public class Invoice {
	private Customer customer;
	
	public Invoice (Customer customer) {
		this.customer = customer;
	}
	
	public float calculatePayment (float price, float discount, float vat) {
		float payment = 0;
		
		if (customer.getAge() < 18 || customer.getAge() > 65 ) {
		  payment = price * discount * vat;
		} else {
		  payment = price * vat;
		}
		return payment;
	}
}
