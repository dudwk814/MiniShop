package domain;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class OrderVO {

    private String order_id;
    private String userid;
    private String post_code;
    private String street_address;
    private String address;
    private String detail_address;
    private String payment_option;
    private int sum_price;
    private Date order_date;

}
