package domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {

    /**
     * 페이징 관련
     */
    private int pageNum;
    private int amount;

    private String type;
    private String keyword;

    /**
     * 상품 관련
     */
    private int price_from;
    private int price_to;
    private String brand;

    public Criteria() {
        this(1, 10);
    }

    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;

    }

    public String[] getTypeArr() {

        return type == null? new String[] {}: type.split("");
    }
}
