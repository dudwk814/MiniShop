package controller;

import domain.ReviewAttachVO;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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

            String fileName = multipartFile.getOriginalFilename();

            // IE 브라우저 파일 경로
            fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);

            log.info("Only File Name : " + fileName);

            attachVO.setFileName(fileName);

            UUID uuid = UUID.randomUUID();

            String uploadFileName = uuid.toString() + "_" + fileName;




            try {
                File saveFile = new File(uploadPath, uploadFileName);

                // 원본 파일 저장
                multipartFile.transferTo(saveFile);

                // 섬네일 생성
                String thumbnailSaveName = uploadPath + File.separator +
                        "s_" + uuid + "_" + fileName;

                File thumbnailFile = new File(thumbnailSaveName);

                Thumbnailator.createThumbnail(saveFile, thumbnailFile, 100, 100);

                attachVO.setUuid(uuid.toString());
                attachVO.setUploadPath(uploadFolderPath);
                attachVO.setFileName(fileName);

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

    /**
     * 이미지 업로드 후 결과창에서 이미지 조회
     */
    @GetMapping("/display")
    public ResponseEntity<byte[]> getFile(String fileName) {
        ResponseEntity<byte[]> result = null;

        try {
            String srcFileName = URLDecoder.decode(fileName, "UTF-8");

            log.info("fileName : " + srcFileName);

            String uploadPath = "C:\\upload";

            File file = new File(uploadPath + File.separator + srcFileName);

            log.info("file : " + file);

            HttpHeaders header = new HttpHeaders();

            // MIME타입 처리
            header.add("Content-Type", Files.probeContentType(file.toPath()));

            // 파일 데이터 처리
            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

        } catch (Exception e) {
            log.error(e.getMessage());
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

        return result;
    }

    @PostMapping("/removeFile")
    public ResponseEntity<String> removeFile(String fileName) {
        String srcFileName = null;
        String uploadPath = "C:\\upload";
        String result = null;
        try {
            srcFileName = URLDecoder.decode(fileName, "UTF-8");

            File file = new File(uploadPath + File.separator + srcFileName);
            boolean delete = file.delete();

            File thumbnail = new File(file.getParent(), "s_" + file.getName());

            delete = thumbnail.delete();

            if (delete == true) {
                result = "success";
            }

            return new ResponseEntity<>(result, HttpStatus.OK);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return new ResponseEntity<>("false", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
