package domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

import java.util.List;

@Data
@AllArgsConstructor
@Getter
public class ReviewPageDTO {

    private int reviewCnt;
    private List<ReviewVO> list;
}
