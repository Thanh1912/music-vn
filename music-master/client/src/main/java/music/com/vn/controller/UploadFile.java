package music.com.vn.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.HandlerMapping;

@RestController
public class UploadFile {
private String baseDir = System.getProperty("catalina.home")+"/";
	
	@GetMapping(path = "/public/resource/**")
	public ResponseEntity<InputStreamResource> getFile(HttpServletRequest request) throws IOException {
		String filePath = (String) request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
		System.out.println(filePath);
		filePath = filePath.substring("/public/resource".length());
	
		File resource = new File(baseDir + filePath);
		
		InputStream file = new FileInputStream(resource);
		return ResponseEntity.ok().contentLength(resource.length())
				.contentType(MediaType.parseMediaType("image/jpeg")).body(new InputStreamResource(file));
	}
	
	 @Autowired
	 ServletContext context;

	 @RequestMapping(value = "/upload", headers=("content-type=multipart/*"), method = RequestMethod.POST)
	 public ResponseEntity<?> upload(@RequestParam("file") MultipartFile inputFile) {
	 System.out.print("ok");
	 checkAndCreateFolder(baseDir+"img/","user/");
	  HttpHeaders headers = new HttpHeaders();
	  if (!inputFile.isEmpty()) {
	   try {
	    String originalFilename = inputFile.getOriginalFilename();
	    File destinationFile = new File(baseDir+"img/user"+  File.separator + originalFilename);
	    inputFile.transferTo(destinationFile);
	   
	    headers.add("File Uploaded Successfully - ", originalFilename);
	    return ResponseEntity.ok("utrtry");
	   } catch (Exception e) {    
	    return ResponseEntity.ok("rtytry");
	   }
	  }else{
	   return ResponseEntity.ok("ee");
	  }
	 }
	 private static void checkAndCreateFolder(String location, String path) {
			File fileLocation = new File(location);
			if (!fileLocation.exists()) {
				fileLocation.mkdir();
			}
			File file = new File(fileLocation + File.separator + path);
			if (!file.exists()) {
				file.mkdirs();
			}
		}
}
