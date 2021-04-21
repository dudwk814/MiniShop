package common;

import domain.ReviewAttachVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import mapper.ReviewAttachMapper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;

@Log4j
@Component
@RequiredArgsConstructor
public class FileCheckTask {

    private final ReviewAttachMapper reviewAttachMapper;

    /**
     * 어제 날짜 이미지 업로드 폴더
     * @return
     */
    private String getFolderYesterday() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Calendar cal = Calendar.getInstance();

        cal.add(Calendar.DATE, -1);

        String str = sdf.format(cal.getTime());

        return str.replace("-", File.separator);
    }

    /**
     * 매일 새벽 2시 데이터베이스에 없는 이미지파일 삭제
     * */
    @Scheduled(cron = "* * 2 * * *")
    public void checkFiles() throws Exception {

        log.warn("File Check Task run.....");

        log.warn("new Date()");

        // file list in DB
        List<ReviewAttachVO> fileList = reviewAttachMapper.getOldFiles();

        // ready for check file in directory with db file list
        List<Path> fileListPaths = fileList.stream()
                .map(vo -> Paths.get("/dudwk814/tomcat/upload", vo.getUploadPath(),
                        vo.getUuid() + "_" + vo.getFileName())).collect(Collectors.toList());

        // image file has thumbnail file
        fileList.stream().filter(vo -> vo.isFileType() == true)
                .map(vo -> Paths.get("/dudwk814/tomcat/upload", vo.getUploadPath(), "s_" +
                        vo.getUuid() + "_" + vo.getFileName()))
                .forEach(p -> fileListPaths.add(p));

        log.warn("===========================================================");

        // files in yesterday directory
        File targetDir = Paths.get("/dudwk814/tomcat/upload", getFolderYesterday())
                .toFile();

        File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);

        log.warn("----------------------------------------------------------");

        for (File file : removeFiles) {

            log.warn(file.getAbsolutePath());

            file.delete();
        }
    }
}
