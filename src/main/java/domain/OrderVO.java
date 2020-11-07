package domain;

import lombok.Data;

@Data
public class OrderVO {

    private int order_id;
    private String userid;
    private AddressVO addressVO;
    private int product_id;
    private int order_state;
    private int payment_option;
}
