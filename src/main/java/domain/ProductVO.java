package domain;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class ProductVO {

    private int product_id;
    private String product_name;
    private int product_price;
    private String product_desc;
    private MultipartFile product_url;
}
