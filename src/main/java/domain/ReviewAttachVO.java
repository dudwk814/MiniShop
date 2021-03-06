package domain;

import lombok.Data;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Data
public class ReviewAttachVO {

    private String uuid;
    private String uploadPath;
    private String fileName;
    private boolean fileType;
    private int attach_no;

    private int review_no;


    public String getImageURL() {
        try {

            return URLEncoder.encode(uploadPath + "/" + uuid + "_" + fileName, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return "";
    }

    public String getThumbnailURL() {
        try {

            return URLEncoder.encode(uploadPath + "/s_" + uuid + "_" + fileName, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return "";
    }
}
