package cn.lollipop.schedule.util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.UUID;

public class MultipartFileUtil {
    private static String[] imagesContentTypes = {"image/jpeg", "image/gif", "image/png"};

    public static void saveImages(MultipartFile multipartFile, HttpServletRequest request) {
        boolean flag = false;

        if (!multipartFile.isEmpty() && multipartFile.getSize() != 0) {
            for (String contentType : imagesContentTypes) {
                if (contentType.equals(multipartFile.getContentType())) {
                    flag = true;
                    break;
                }
            }
        }

        if (!flag) {
            return;
        }

        String filePath = request.getServletContext().getRealPath("/upload/") + UUID.randomUUID() + "." + multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf(".") + 1);
        try {
            multipartFile.transferTo(new File(filePath));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
