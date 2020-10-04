package domain;

import lombok.Data;

import java.util.Date;

@Data
public class UserVO {

    private String user_no;
    private String user_name;
    private String user_id;
    private String user_pw;
    private String user_pw2;
    private String address;
    private Date regDate;
}
