package controller;

import domain.ReviewAttachVO;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@Log4j
public class CommonController {

    /**
     * 접근제어 에러
     * @return
     */
    @GetMapping("/accessError")
    public String accessError() {

        return "accessError";
    }

    /**
     * 이미지 업로드
     * @param uploadFile
     * @return
     */
    @PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<List<ReviewAttachVO>> uploadAjaxPost(MultipartFile[] uploadFile) {

        log.info("update ajax post......");

        List<ReviewAttachVO> list = new ArrayList<>();

        String uploadFolder = "C:\\upload";

        String uploadFolderPath = getFolder();

        // make folder --------
        File uploadPath = new File(uploadFolder, uploadFolderPath);

        if (uploadPath.exists() == false) {
            uploadPath.mkdirs();
        }

        for (MultipartFile multipartFile : uploadFile) {

            log.info("---------------------------------------");
            log.info("Upload File Name : " + multipartFile.getOriginalFilename());
            log.info("Upload File Size : " + multipartFile.getSize());

            ReviewAttachVO attachVO = new ReviewAttachVO();

            String uploadFileName = multipartFile.getOriginalFilename();

            // IE 브라우저 파일 경로
            uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);

            log.info("Only File Name : " + uploadFileName);

            attachVO.setFileName(uploadFileName);

            UUID uuid = UUID.randomUUID();

            uploadFileName = uuid.toString() + "_" + uploadFileName;



            try {
                File saveFile = new File(uploadPath, uploadFileName);
                multipartFile.transferTo(saveFile);

                attachVO.setUuid(uuid.toString());
                attachVO.setUploadPath(uploadFolderPath);

                // 이미지 파일 여부 체크
                if (checkImageType(saveFile)) {

                    attachVO.setFileType(true);

                }

                // add to List
                list.add(attachVO);
            } catch (Exception e) {
                log.error(e.getMessage());
            } // end catch
        } // end for

        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    /**
     * 이미지 파일 년/월/일 체크
     * @return
     */
    private String getFolder() {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Date date = new Date();

        String str = sdf.format(date);

        return str.replace("-", File.separator);
    }

    /**
     * 이미지 파일 체크
     * @param file
     * @return
     */
    private boolean checkImageType(File file) {

        try {
            String contentType = Files.probeContentType(file.toPath());

            return contentType.startsWith("image");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }
}
