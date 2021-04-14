package domain;

import lombok.Data;

import java.util.List;

@Data
public class OrderDetailsVO {

    private int order_details_num;
    private String order_id;
    private int product_id;
    private int amount;
    private String userid;

}
