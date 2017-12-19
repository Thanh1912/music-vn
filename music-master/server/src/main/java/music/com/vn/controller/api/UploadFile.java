package music.com.vn.controller.api;


import org.springframework.core.io.InputStreamResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.HandlerMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

@RestController

public class UploadFile {
    private String baseDir = System.getProperty("catalina.home")+"/";

    @GetMapping(path = "/resources/**")
    public ResponseEntity<InputStreamResource> getFile(HttpServletRequest request) throws IOException {
        String filePath = (String) request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
        System.out.println(filePath);
        filePath = filePath.substring("/resources".length());
        File resource = new File(baseDir + filePath);
        InputStream file = new FileInputStream(resource);
        return ResponseEntity.ok().contentLength(resource.length())
                .contentType(MediaType.parseMediaType("image/jpeg")).body(new InputStreamResource(file));
    }
}
