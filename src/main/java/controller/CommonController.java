package controller;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

@Controller
@Log4j
public class CommonController {

    // 스프링 시큐리티 접근 에러 메서드
    @GetMapping("/accessError")
    public String accessError() {

        return "accessError";
    }

    // 이미지 업로드
    @PostMapping("/uploadAjaxAction")
    public void uploadAjaxPost(MultipartFile[] uploadFile) {

        log.info("update ajax post......");

        String uploadFolder = "C:\\upload";

        for (MultipartFile multipartFile : uploadFile) {

            log.info("---------------------------------------");
            log.info("Upload File Name : " + multipartFile.getOriginalFilename());
            log.info("Upload File Size : " + multipartFile.getSize());

            String uploadFileName = multipartFile.getOriginalFilename();

            // IE 브라우저 파일 경로
            uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);

            log.info("Only File Name : " + uploadFileName);

            File saveFile = new File(uploadFolder, uploadFileName);

            try {

                multipartFile.transferTo(saveFile);
            } catch (Exception e) {
                log.error(e.getMessage());
            } // end catch
        } // end for
    }
}
