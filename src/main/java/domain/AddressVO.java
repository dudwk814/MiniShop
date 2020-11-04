package domain;

import lombok.Data;

@Data
public class AddressVO {

    private int address_id;
    private String userid;
    private String post_code;
    private String street_address;
    private String address;
    private String detail_address;
    private String note;
}
