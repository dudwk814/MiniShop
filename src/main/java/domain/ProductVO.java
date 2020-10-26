package domain;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class ProductVO {

    private int product_id;
    private String product_name;
    private int product_price;
    private String product_desc;
    private String product_url;
    private String brand;
    private MultipartFile productPhoto;
}
