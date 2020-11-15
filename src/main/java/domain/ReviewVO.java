package domain;

import lombok.Data;

import java.util.Date;

@Data
public class ReviewVO {

    private int review_no;
    private int product_id;
    private String userid;
    private String review_title;
    private String review_content;
    private Date review_date;
    private Date review_updateDate;
}
