package domain;

import lombok.Data;

@Data
public class CartVO {

    private int cart_id;
    private String userid;
    private String username;
    private int product_id;
    private String product_name;
    private int product_price;
    private int amount;
    private int money;
}
