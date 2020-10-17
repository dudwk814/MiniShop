package domain;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class UserVO {

    private Long user_no;
    private String user_name;
    private String user_id;
    private String user_pw;
    private String user_pw2;
    private boolean enabled;

    private String address;
    private Date regDate;
    private List<authVO> authList;
}
