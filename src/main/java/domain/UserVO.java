package domain;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class UserVO {

    private String userid;
    private String userpw;
    private String userName;
    private boolean enabled;

    private Date regDate;
    private Date updateDate;

    private String post_code;
    private String street_address;
    private String address;
    private String detail_address;

    private List<authVO> authList;
}
