package domain;

import lombok.Data;

import java.util.Date;

@Data
public class UserVO {

    private String mNo;
    private String mName;
    private String mId;
    private String mPw;
    private String mPw2;
    private String address;
    private Date regDate;
}
