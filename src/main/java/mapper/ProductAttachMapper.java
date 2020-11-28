package mapper;

import domain.ProductAttachVO;

import java.util.List;

public interface ProductAttachMapper {

    public void insert(ProductAttachVO vo);

    public void delete(String uuid);

    public List<ProductAttachVO> findByProductId(int product_id);
}
