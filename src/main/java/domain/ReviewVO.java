package domain;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.List;

@Data
public class ReviewVO {

    private int review_no;
    private int product_id;
    private String userid;
    private String review_title;
    private String review_content;
    private Date review_date;
    private Date review_updateDate;

    private MultipartFile[] uploadFile;

    private List<ReviewAttachVO> attachList;
}
