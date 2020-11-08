package domain;

import lombok.Data;

import java.util.Date;

@Data
public class OrderVO {

    private int order_id;
    private String userid;
    private int address_id  ;
    private int product_id;
    private int order_state;
    private int payment_option;
    private Date order_date;
}
