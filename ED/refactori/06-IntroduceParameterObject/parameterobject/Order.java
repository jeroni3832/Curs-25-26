package xxx.refactorings.parameterobject;

import java.util.Enumeration;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Set;


public class Order {
	private Hashtable<String, Float> items = new Hashtable<String, Float>();

	public void addItem(Integer productID, String description, Integer quantity, Float price, Float discount) {
		items.put(productID + ": " + description, (quantity * price) - (quantity * price * discount));
	}

	public float calculateTotal() {
		float total = 0;
		Enumeration<String> keys = items.keys();

		while (keys.hasMoreElements()) {
			total = total + items.get(keys.nextElement());
		}
		return total;
	}
}
